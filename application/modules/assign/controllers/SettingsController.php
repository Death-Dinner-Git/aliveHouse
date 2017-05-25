<?php

namespace backend\modules\assign\controllers;

use Yii;
use backend\controllers\BackendComController;
use backend\modules\assign\models\Menu;
use backend\modules\assign\models\searches\MenuSearch;
use backend\modules\assign\models\SysSettings;
use backend\modules\assign\models\searches\SysSettingsSearch;

/**
 * SettingsController implements the CRUD actions for SysSettings model and implements the backend common controller ..
 */
class SettingsController extends BackendComController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [];
    }

    /**
     * Lists all SysSettings models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SysSettingsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single SysSettings model.
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
     * Creates a new SysSettings model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new SysSettings();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing SysSettings model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if (!$model){
            return $this->redirect(['index']);
        }

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }


    /**
     * Lists all SysSettings models.
     * @return mixed
     */
    public function actionApp()
    {
        $searchModel = new MenuSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('app', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single SysSettings model.
     * @param integer $id
     * @return mixed
     */
    public function actionAppView($id)
    {
        return $this->render('app-view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new SysSettings model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionAppCreate()
    {
        $model = new Menu();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['app-view', 'id' => $model->id]);
        } else {
            return $this->render('app-create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing SysSettings model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionAppUpdate($id)
    {
        $model = Menu::findOne($id);
        if (!$model){
            return $this->redirect(['app']);
        }

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['app-view', 'id' => $model->id]);
        } else {
            return $this->render('app-update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Finds the SysSettings model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return SysSettings the loaded model
     */
    protected function findModel($id)
    {
        if (($model = SysSettings::findOne($id)) !== null) {
            return $model;
        } else {
            return null;
        }
    }
}
