<?php

namespace backend\modules\assign\controllers;

use backend\modules\assign\components\ItemController;
use yii\rbac\Item;

/**
 * RoleController implements the CRUD actions for AuthItem model.
 */
class RoleController extends ItemController
{
    public $type = Item::TYPE_ROLE;

}
