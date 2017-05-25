<?php

namespace backend\modules\assign\controllers;

use Yii;
use backend\controllers\BackendComController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\modules\assign\components\Helper;
use backend\modules\assign\components\MenuHelper;
use backend\modules\assign\models\Menu;
use backend\modules\assign\models\searches\MenuSearch;

/**
 * MenuController implements the CRUD actions for Menu model and implements the backend common controller ..
 */
class MenuController extends BackendComController
{

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Menu models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new MenuSearch;
        $searchModel ->type = 1;
        $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

        if (Yii::$app->request->isAjax) {
            Yii::$app->getResponse()->format = 'json';
            $id = intval(Yii::$app->request->post('id')) ? 1 : 0;
            $menuRows = MenuHelper::getAssignedMenu(Yii::$app->user->id);
            $menus = [];
            if ($menuRows) {
                $menus = $this -> initMenu($menuRows);
            }
            return $menus;
        }

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'searchModel' => $searchModel,
        ]);
    }

    /**
     * Displays a single Menu model.
     * @param  integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Menu model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Menu;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Helper::invalidate();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
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
        if ($model->menuParent) {
            $model->parent_name = $model->menuParent->name;
        }
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Helper::invalidate();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Menu model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param  integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        Helper::invalidate();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Menu model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param  integer $id
     * @return Menu the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Menu::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * @param $menuRows
     * @return array
     * {
    id          : "string" // required
    parent      : "string" // required
    text        : "string" // node text
    icon        : "string" // string for custom
    state       : {
    opened    : boolean  // is the node open
    disabled  : boolean  // is the node disabled
    selected  : boolean  // is the node selected
    },
    li_attr     : {}  // attributes for the generated LI node
    a_attr      : {}  // attributes for the generated A node
    }
     */
    protected function initMenu($menuRows){
        $menus = [];
        if ($menuRows){
            foreach ($menuRows as $key => $menuRow) {
                $menus[$key]['id'] = $menuRow['id'];
                $menus[$key]['text'] = $menuRow['text'];
                $menus[$key]['order'] = $menuRow['order'];
                if (isset($menuRow['children'])){
                    $menus[$key]['children'] = $this -> initMenu($menuRow['children']);
                }
            }
        }else{
            $menus = [];
        }
        return $menus;
    }
}
