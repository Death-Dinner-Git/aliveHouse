<?php

namespace app\manage\model;

use app\common\model\NewHouse as BaseNewHouse;
use app\manage\validate\NewHouseValidate;
use app\manage\model\BuildingBase;

/**
 * This is the model class for table "{{%new_house}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $building_base_id
 * @property integer $type
 * @property string $room
 * @property string $description
 * @property string $address
 * @property string $url
 * @property string $url_icon
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BuildingBase $buildingBase
 */
class NewHouse extends BaseNewHouse
{

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return NewHouseValidate::load();
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
