<?php

namespace backend\modules\assign\controllers;

use backend\controllers\BackendComController;

/**
 * DefaultController implements the CRUD actions for Data model and implements the backend common controller .
 */
class DefaultController extends BackendComController
{

    /**
     * Action index
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}
