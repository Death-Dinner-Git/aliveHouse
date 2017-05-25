<?php

namespace backend\modules\assign\controllers;

use Yii;
use backend\controllers\BackendComController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\Admin;
use backend\modules\assign\models\Notices;
use backend\modules\assign\models\searches\NoticesSearch;

/**
 * NoticesController implements the CRUD actions for Notices model and implements the backend common controller ..
 */
class NoticesController extends BackendComController
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
                        'actions' => [ 'create', 'update', 'delete', 'view', 'index', 'apply'],
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
     *  Lists all Notices models.
     * @param int $pageSize
     * @return mixed
     */
    public function actionIndex($pageSize = 20)
    {
        $searchModel = new NoticesSearch();
        $where = ['pass' => ['1', '2', '3']];
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $where, $pageSize);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     *  Lists all apply Notices models.
     * @param int $pageSize
     * @return mixed
     */
    public function actionApply($pageSize = 20)
    {
        $searchModel = new NoticesSearch();
        $searchModel -> uid = Yii::$app -> user -> id;
        $where = ['pass' => ['1', '2', '3', '4']];
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $where, $pageSize);

        return $this->render('apply', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Notices model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $model->username = $model->getUsername($model->uid);
        return $this->render('view', [
            'model' => $model,
        ]);
    }

    /**
     * Creates a new Notices model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Notices();

        if ($model->load(Yii::$app->request->post())) {
            $model->uid = Yii::$app->user->id;
            $model->created_at = date('Y-m-d H:i:s');
            $model->updated_at = date('Y-m-d H:i:s');
            $model->started_at = date('Y-m-d H:00:00', strtotime($model->started_at));
            $model->ended_at = date('Y-m-d H:00:00', strtotime($model->ended_at));
            if (isset($_REQUEST['submitCheck'])){
                if ($_REQUEST['submitCheck'] = 'check'){
                    $model->pass = 1;
                }
            }
            if ($model->validate()){
                $model ->setOrderValue();
            }
            if ($model->save()){
                return $this->redirect(['view', 'id' => $model->id]);
            }else{
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Notices model.
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
     * Deletes an existing Notices model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['apply']);
    }

    /**
     * Finds the Notices model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Notices the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Notices::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
