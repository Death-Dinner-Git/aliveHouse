<?php

namespace backend\modules\assign\controllers;

use Yii;
use backend\controllers\BackendComController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\modules\assign\models\MenuRules;
use backend\models\searches\ChecksSearch;
use backend\modules\assign\models\Data;
use backend\modules\assign\models\searches\DataSearch;

/**
 * DataController implements the CRUD actions for Data model and implements the backend common controller .
 */
class DataController extends BackendComController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['rules', 'checks', 'checks-delete', 'create', 'update', 'delete', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * @return string
     * @throws NotFoundHttpException
     */
    public function actionRules()
    {
        $model = MenuRules::findOne(['name'=>'积分规则','type'=>2]);

        if (Yii::$app->request->isAjax){
            Yii::$app->response->format = 'json';
            $res['code'] = 0;
            $res['msg'] = '更新规则失败';
            if ( $model->load(Yii::$app->request->post()) ){
                $step = intval($model->step);
                $aims = intval($model->aims);
                $earn = intval($model->earn);
                if ($step >0 && $aims > 0 && $earn >0){
                    $rules = json_decode($model->data, true);
                    $index = $step-1;
                    if ($index > 0 ){
                        if( $rules[$index-1]['aims'] >= $aims ){
                            $res['msg'] = '达到目标应该比上一次目标大';
                            return $res;
                        }
                        if( $rules[$index-1]['earn'] >= $earn ){
                            $res['msg'] = '获得积分应该比上一次积分大';
                            return $res;
                        }
                    }
                    $rules[$index]['aims'] = $aims;
                    $rules[$index]['earn'] = $earn;
                    $model -> data = json_encode($rules);
                    if ($model->save()){
                        $res['code'] = 1;
                        $res['msg'] = '更新规则成功';
                    }
                }
            }
            return $res;
        }

        if (($model) !== null) {
            return $this->render('points-rule-view', [
                'model' => $model,
            ]);
        } else {
            return $this->render('//site/error', ['layout' => true]);
        }
    }

    /**
     * Lists all Checks models.
     * @param int $pageSize
     * @return mixed
     */
    public function actionChecks($pageSize = 20)
    {
        $searchModel = new ChecksSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $pageSize);

        return $this->render('checks-index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * delete the Checks models.
     * @param int $id
     * @return mixed
     */
    public function actionChecksDelete($id)
    {
        if (Yii::$app->request->isAjax){
            Yii::$app->response->format = 'json';
            $res['code'] = 0;
            $res['msg'] = '删除记录失败';
            $res['remove'] = false;
            $model = ChecksSearch::findOne($id);
            if ($model){
                if ($model->delete()){
                    $res['code'] = 1;
                    $res['msg'] = '删除记录成功';
                    $res['remove'] = true;
                }
            }
            return $res;
        }
    }

    /**
     * Lists all Data models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new DataSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Lists all Data models.
     * @return mixed
     */
    public function actionRestore()
    {
        $searchModel = new DataSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     *  Set a permission for Creates a new Data model.
     * @return mixed
     */
    public function actionPermission()
    {
        $searchModel = new DataSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Data model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Data model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Data();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Data model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Data model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Data model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Data the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Data::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
