<?php

namespace backend\modules\assign\controllers;

use backend\components\Helper;
use Yii;
use backend\controllers\BackendComController;
use backend\models\Admin;
use backend\models\searches\AdminSearch;
use backend\modules\assign\components\RegionHelper;

/**
 * AdminController implements the CRUD actions for Admin model and implements the backend common controller ..
 */
class AdminController extends BackendComController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [];
    }

    /**
     * Lists all Admin models.
     * @param $pageSize
     * @return mixed
     */
    public function actionIndex( $pageSize = 20)
    {
        $searchModel = new AdminSearch();
        $where = ['>', 't.role',Yii::$app->user->identity->role];
        if (Yii::$app->user->identity -> role != '8'){
            $allAssignRegionChildId = RegionHelper::getAssignRegionChildIdByUserId(Yii::$app->user->id);
            if (!empty($allAssignRegionChildId)){
                $where = ['and',$where,['t.region_id'=>$allAssignRegionChildId]];
            }
        }
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $where, $pageSize);

        if (Yii::$app->request->isAjax){
            $res['code'] = 0;
            $res['msg'] = '获取数据失败';
            $this ->layout = false;
            Yii::$app->response->format = 'json';
            $res['code'] = 1;
            $res['html'] = $this->render('ajax-index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
            $res['get'] = $_GET;
            return $res;
        }

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

//    public function actions(){
//        return [
//            // captcha action renders the CAPTCHA image displayed on the contact page
//            'captcha'=>[
//                'class' => 'yii\captcha\CaptchaAction',
//                'testLimit'=>1,
//                'fixedVerifyCode' => YII_ENV_TEST ? 'test' : null,
//                'backColor'=>0xFFFFFF,  //背景颜色
//                'minLength'=>4,  //最短为4位
//                'maxLength'=>4,   //是长为4位
//                'transparent'=>true,  //显示为透明
//                'padding' => 5,//间距
//                'height'=>35,//高度
//                'width' => 200,  //宽度
//                'foreColor'=>0x4d4d4d,     //字体颜色
//                'offset'=>15,        //设置字符偏移量 有效果
//            ],
//        ];
//    }

    /**
     * Displays a single Assignment model.
     * @param  integer $id
     * @return mixed
     */
    public function actionUser($id)
    {
        $model = Admin::findOne($id);

        if (Yii::$app->request->isAjax){
            Yii::$app->response->format = 'json';
            $res['code'] = 0;
            $res['url'] = '';
            $url = Yii::$app->getRequest()->post('url');
            if ($model && $url) {
                $prefix = Yii::$app->basePath . '/..';
                $folder = str_replace('/tmp', '/head/', @pathinfo($url, PATHINFO_DIRNAME));
                $to = $folder . @pathinfo($url, PATHINFO_BASENAME);
                $this->getFolder($prefix . $folder, false);
                $model->head_url = $to;
                $model->setScenario('save');
                if ($model->save()){
                    $res['code'] = '1';
                    $res['url'] = $to;
                    $this->getFolder($prefix . $folder, true);
                    @$this->copy($prefix . $url, $prefix . $to);
                    //清空缓存图片
                    $tmpPathStr = @pathinfo($url, PATHINFO_DIRNAME);
                    @$this->getFolder($prefix . $tmpPathStr, true);
                }
            }
            return $res;
        }

        if (!$model){
            return $this->render('//site/error', ['layout' => true, 'code' => '404', 'name' => '已不存在', 'message' => '管理员已不存在']);
        }

        return $this->render('home', [
            'model' => $model,
        ]);
    }


    /**
     * Creates a new Menu model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Admin();
        $model -> setScenario('create');

        $model->load(Yii::$app->request->post());
        if (Yii::$app->request->isAjax) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\bootstrap\ActiveForm::validate($model);
        }

        $model -> parentRegion = Yii::$app->user->identity->full_region_name;
        $roleList = $this->getAssignRoleList();

        if ($model->load(Yii::$app->request->post())) {
//            $this->createAction('captcha')->validate($model->verifyCode, false);   //验证验证码
            if ($user = $model->signup()) {
                $manager = Yii::$app->getAuthManager();
                $item = $manager->getRole($roleList[$user->role]);
                $manager->assign($item, $user -> id);
                return $this->redirect(['admin/index']);
            }
        }

        return $this->render('create', [
            'model' => $model,
            'roleList' => $roleList,
        ]);

    }

    /**
     * Updates an existing Menu model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param  integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = Admin::findOne($id);

        if (!$model){
            return $this->render('//site/error', ['layout' => true, 'code' => '404', 'name' => '已不存在', 'message' => '管理员已不存在']);
        }

        $model->setScenario('login-update');
        if($model->load(Yii::$app->request->post())){
            if (empty($model->password_old)) {
                $model->addError('password_old', '旧密码 不能为空.');
            }
            if (empty($model->password)) {
                $model->addError('password_old', '新密码 不能为空.');
            }
            if (empty($model->password_rep)) {
                $model->addError('password_old', '确认密码 不能为空.');
            }
            if (!$model->hasErrors() && ($model->password != $model->password_rep)) {
                $model->addError('password_old', '两次密码 不同.');
            }
            if ( !$model->hasErrors() && !$model->validatePassword($model->password_old)) {
                $model->addError('password_old', '密码错误.');
            }else{
                $model->setPassword($model->password);
                $model->generateAuthKey();

                $model->setScenario('save');
                if ($model->save()) {
                    return $this->redirect(['user','id'=>$model->id]);
                }
            }
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Admin model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $res['code'] = 0;
        $res['msg'] = '删除管理员失败';
        $res['remove'] = false;
        $uid = Yii::$app->user->id;
        if (Yii::$app->request->isAjax) {
            Yii::$app->getResponse()->format = 'json';

            if (!Yii::$app->request->isPost){
                $res['msg'] = '发生未知错误';
                return $res;
            }

            $model = Admin::findOne(['id' => $id]);
            if (empty($model)) {
                $res['msg'] = '找不到该管理员或已被其他管理员删除';
                return $res;
            }

            if (!(\backend\modules\assign\components\RegionHelper::hasPermission($uid, $model->id))) {
                $res['msg'] = '不好意思,无权限操作';
                return $res;
            }

            if ($model->delete()) {
                $data = ['action'=>'删除管理员','create_username'=>Yii::$app->user->identity->username,'delete_username'=>$model->username,];
                Helper::deleteLog(Yii::$app->user->id,$model->id,Admin::tableName(),$model->id,$data);
                $res['u'] = $model->id;
                $res['code'] = 1;
                $res['msg'] = '删除管理员成功';
                $res['remove'] = true;
            }
            return $res;
        } else {
            return $this->render('//site/error', ['layout' => true, 'code' => '400', 'name' => '请正常操作...', 'message' => '天才都是不小心养成的...']);
        }
    }

    /**
     * Finds the permission RoleList based on its role.
     * @param $all boolean,default not get all lists ,if true get all lists
     * @return array RoleList
     */
    protected function getAssignRoleList($all = false )
    {
        $res = [];

        $roleList = [
            '9'=>'全网普通管理员',
            '18'=>'省级超级管理员',
            '19'=>'省级普通管理员',
            '28'=>'地区超级管理员',
            '29'=>'地区普通管理员',
        ];
        if ($all){
            $roleList[8] = '全网超级管理员';
            return $roleList;
        }
        $role = Yii::$app->user->identity->role;
        foreach ($roleList as $key=>$value){
            if ($role < $key){
                $res[$key] = $value;
            }
        }
        if (!isset($res)){
            $res = false;
        }
        return $res;
    }
}
