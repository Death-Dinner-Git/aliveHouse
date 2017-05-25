<?php

namespace backend\modules\assign\controllers;

use backend\modules\assign\components\RegionHelper;
use Yii;
use backend\controllers\BackendComController;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\NotFoundHttpException;
use backend\modules\assign\components\Helper;
use backend\modules\assign\models\searches\AssignmentSearch;
use backend\modules\assign\models\AuthAssignment;

/**
 * AssignmentController implements the CRUD actions for Assignment model and implements the backend common controller .
 *
 */
class AssignmentController extends BackendComController
{
    public $userClassName;
    public $idField = 'id';
    public $usernameField = 'username';
    public $fullnameField;
    public $searchClass;
    public $extraColumns = [];

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        if ($this->userClassName === null) {
            $this->userClassName = Yii::$app->getUser()->identityClass;
            $this->userClassName = $this->userClassName ? : 'backend\models\Admin';
        }
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'assign' => ['post'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => [
                            'signup',
                            'create',
                            'delete',
                            'assign',
                            'update',
                            'user',
//                            'captcha',
                            'index',
                            'view',
                        ],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
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
     * Lists all Assignment models.
     * @return mixed
     */
    public function actionIndex()
    {

        if ($this->searchClass === null) {
            $searchModel = new AssignmentSearch;
            $region = Yii::$app->user->getIdentity()->region;
            $dataProvider = $searchModel->search(Yii::$app->getRequest()->getQueryParams(), $this->userClassName, $this->usernameField ,$region);
        } else {
            $class = $this->searchClass;
            $searchModel = new $class;
            $dataProvider = $searchModel->search(Yii::$app->getRequest()->getQueryParams());
        }

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'searchModel' => $searchModel,
            'idField' => $this->idField,
            'usernameField' => $this->usernameField,
            'region' => '管理范围',
            'extraColumns' => $this->extraColumns,
        ]);
    }

    /**
     * Displays a single Assignment model.
     * @param  integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);

        return $this->render('view', [
            'model' => $model,
            'idField' => $this->idField,
            'usernameField' => $this->usernameField,
            'fullnameField' => $this->fullnameField,
            'items' => $this->getItems($id)
        ]);
    }

    /**
     * Displays a single Assignment model.
     * @param  integer $id
     * @return mixed
     */
    public function actionUser($id)
    {
        $model = $this->findModel($id);

        if (Yii::$app->request->isAjax){
            Yii::$app->response->format = 'json';
            $res['code'] = 0;
            $res['url'] = '';
            if (!empty($_REQUEST['url'])) {
                $prefix = Yii::$app->basePath . '/..';
                $folder = str_replace('/tmp', '/head/', @pathinfo($_REQUEST['url'], PATHINFO_DIRNAME));
                $to = $folder . @pathinfo($_REQUEST['url'], PATHINFO_BASENAME);
                $this->getFolder($prefix . $folder, false);
                $model->head_url = $to;
                $model->setScenario('save');
                if ($model->save()){
                    $res['code'] = '1';
                    $res['url'] = $to;
                    $this->getFolder($prefix . $folder, true);
                    @$this->copy($prefix . $_REQUEST['url'], $prefix . $to);
                    //清空缓存图片
                    $tmpPathStr = @pathinfo($_REQUEST['url'], PATHINFO_DIRNAME);
                    @$this->getFolder($prefix . $tmpPathStr, true);
                }
            }
           return $res;
        }

        return $this->render('home', [
            'model' => $model,
        ]);
    }

    /**
     * Assign or revoke assignment to user
     * @param  integer $id
     * @param  string  $action
     * @return mixed
     */
    public function actionAssign($id)
    {
        $post = Yii::$app->getRequest()->post();
        $action = $post['action'];
        $roles = $post['roles'];
        $manager = Yii::$app->getAuthManager();
        $error = [];
        if ($action == 'assign') {
            foreach ($roles as $name) {
                try {
                    $item = $manager->getRole($name);
                    $item = $item ? : $manager->getPermission($name);
                    $manager->assign($item, $id);
                } catch (\Exception $exc) {
                    $error[] = $exc->getMessage();
                }
            }
        } else {
            foreach ($roles as $name) {
                try {
                    $item = $manager->getRole($name);
                    $item = $item ? : $manager->getPermission($name);
                    $manager->revoke($item, $id);
                } catch (\Exception $exc) {
                    $error[] = $exc->getMessage();
                }
            }
        }
        Helper::invalidate();
        Yii::$app->response->format = 'json';
        return array_merge($this->getItems($id), ['errors' => $error]);
    }

    /**
     *
     * @param string $id
     * @return array
     */
    protected function getItems($id)
    {
        $manager = Yii::$app->getAuthManager();
        $avaliable = [];
        foreach (array_keys($manager->getRoles()) as $name) {
            $avaliable[$name] = 'role';
        }

        foreach (array_keys($manager->getPermissions()) as $name) {
            if ($name[0] != '/') {
                $avaliable[$name] = 'permission';
            }
        }

        $assigned = [];
        foreach ($manager->getAssignments($id) as $item) {
            $assigned[$item->roleName] = $avaliable[$item->roleName];
            unset($avaliable[$item->roleName]);
        }

        return[
            'avaliable' => $avaliable,
            'assigned' => $assigned
        ];
    }

    /**
     * Search roles of user
     * @param  integer $id
     * @param  string  $target
     * @param  string  $term
     * @return string
     */
    public function actionSearch($id, $target, $term = '')
    {
        Yii::$app->response->format = 'json';
        $authManager = Yii::$app->authManager;
        $roles = $authManager->getRoles();
        $permissions = $authManager->getPermissions();

        $avaliable = [];
        $assigned = [];
        foreach ($authManager->getAssignments($id) as $assigment) {
            if (isset($roles[$assigment->roleName])) {
                if (empty($term) || strpos($assigment->roleName, $term) !== false) {
                    $assigned['Roles'][$assigment->roleName] = $assigment->roleName;
                }
                unset($roles[$assigment->roleName]);
            } elseif (isset($permissions[$assigment->roleName]) && $assigment->roleName[0] != '/') {
                if (empty($term) || strpos($assigment->roleName, $term) !== false) {
                    $assigned['Permissions'][$assigment->roleName] = $assigment->roleName;
                }
                unset($permissions[$assigment->roleName]);
            }
        }

        if ($target == 'avaliable') {
            if (count($roles)) {
                foreach ($roles as $role) {
                    if (empty($term) || strpos($role->name, $term) !== false) {
                        $avaliable['Roles'][$role->name] = $role->name;
                    }
                }
            }
            if (count($permissions)) {
                foreach ($permissions as $role) {
                    if ($role->name[0] != '/' && (empty($term) || strpos($role->name, $term) !== false)) {
                        $avaliable['Permissions'][$role->name] = $role->name;
                    }
                }
            }
            return $avaliable;
        } else {
            return $assigned;
        }
    }

    /**
     * Creates a new Menu model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new $this->userClassName;
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
                $item = $item ? : $manager->getPermission($roleList[$user->role]);
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
        $model = $this->findModel($id);
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
     * Deletes an existing Menu model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param  integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $model->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Assignment model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param  integer $id
     * @return \yii\db\ActiveRecord|\yii\web\IdentityInterface the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $class = $this->userClassName;
        if (($model = $class::findIdentity($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The Setting requested page does not exist.');
        }
    }
    /**
     * Finds the permission RoleList based on its role.
     * @param $all boolean,default not get all lists ,if true get all lists
     * @return array RoleList
     */
    protected function getAssignRoleList($all = false )
    {

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


