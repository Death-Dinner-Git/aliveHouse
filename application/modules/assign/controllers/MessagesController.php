<?php
namespace backend\modules\assign\controllers;

use Yii;
use backend\controllers\BackendComController;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * MessagesController implements the CRUD actions for Activity model and implements the backend common controller .
 */
class MessagesController extends BackendComController
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
                        'actions' => ['index', 'processes'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Processes action.
     *
     * @return string
     */
    public function actionProcesses()
    {
        return $this->render('index');
    }

}
