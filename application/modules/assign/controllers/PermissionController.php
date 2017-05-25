<?php

namespace backend\modules\assign\controllers;

use backend\modules\assign\components\ItemController;
use yii\rbac\Item;

/**
 * PermissionController implements the CRUD actions for AuthItem model.
 */
class PermissionController extends ItemController
{
    public $type = Item::TYPE_PERMISSION;

}
