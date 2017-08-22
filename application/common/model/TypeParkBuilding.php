<?php

namespace app\common\model;

use app\common\model\Type;
use app\common\model\TypePark;
use app\common\validate\TypeParkValidate;

/**
 * This is the model class for table "{{%label_park}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $label_id
 * @property integer $target_id
 * @property integer $group
 * @property string $name
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 *
 * @property Type $label
 */
class TypeParkBuilding extends TypePark
{

    public $type = '6';

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%type_park_building}}';

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return TypeParkValidate::load();
    }
}

