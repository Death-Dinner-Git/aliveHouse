<?php

namespace app\manage\model;

use app\common\model\Config as BaseConfig;


/**
 * This is the model class for table "{{%config}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $app
 * @property string $title
 * @property string $name
 * @property string $value
 * @property integer $group
 * @property string $type
 * @property string $options
 * @property string $tip
 * @property string $created_at
 * @property string $updated_at
 * @property integer $order
 * @property integer $status
 */
class Config extends BaseConfig
{

}
