<?php

namespace app\common\model;

use app\common\model\Type;
use app\common\model\TypePark;
use app\manage\validate\TypeParkValidate;

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
 * @property Label $label
 */
class TypeParkHandHouse extends TypePark
{

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return TypeParkValidate::load();
    }

    /**
     * @param $data
     * @param string $scene
     * @return bool
     */
    public static function check($data,$scene = ''){
        $validate = self::getValidate();

        //设定场景
        if (is_string($scene) && $scene !== ''){
            $validate->scene($scene);
        }

        return $validate->check($data);
    }
}

