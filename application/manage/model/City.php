<?php

namespace app\manage\model;

use app\common\model\City as BaseCity;
use app\manage\validate\CityValidate;

use app\common\model\Region;
use app\manage\model\BuildingBase;
use app\manage\model\SecondHandHouse;

/**
 * This is the model class for table "{{%city}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property double $region_id
 * @property integer $parent
 * @property string $name
 * @property integer $level
 * @property integer $order
 * @property string $code
 * @property string $name_en
 * @property string $short_name_en
 * @property string $data
 *
 * @property BuildingBase[] $buildingBases
 * @property Region $region
 * @property SecondHandHouse[] $secondHandHouses
 */
class City extends BaseCity
{

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return CityValidate::load();
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