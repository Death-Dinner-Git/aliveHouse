<?php

namespace app\manage\model;

use app\common\model\HouseHost as BaseHouseHost;
use app\manage\validate\HouseHostValidate;

use app\manage\model\HouseHostServer;
use app\manage\model\SecondHandHouse;

/**
 * This is the model class for table "{{%house_host}}".
 *
 * @property integer $id
 * @property string $ID_cards
 * @property string $real_name
 * @property string $phone
 * @property string $nickname
 * @property string $address
 * @property string $email
 * @property string $avatar
 * @property integer $is_delete
 * @property integer $city_id
 * @property integer $type
 * @property string $created_at
 * @property string $updated_at
 *
 * @property HouseHostServer[] $houseHostServers
 * @property SecondHandHouse[] $secondHandHouses
 */
class HouseHost extends BaseHouseHost
{

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return HouseHostValidate::load();
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
