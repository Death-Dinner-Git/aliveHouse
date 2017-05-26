<?php

namespace app\manage\model;

use app\common\model\Department as BaseDepartment;

use app\manage\model\BackUser;


/**
 * This is the model class for table "{{%department}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property string $remark
 * @property string $name
 * @property integer $parent
 * @property string $code
 * @property integer $order
 * @property integer $level
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser[] $backUsers
 */
class Department extends BaseDepartment
{

}