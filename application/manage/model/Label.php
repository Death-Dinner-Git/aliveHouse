<?php

namespace app\manage\model;

use app\common\model\Label as BaseLabel;

use app\manage\model\LabelPark;

/**
 * This is the model class for table "{{%label}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $type
 * @property string $name
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 *
 * @property LabelPark[] $labelParks
 */
class Label extends BaseLabel
{

}
