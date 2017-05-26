<?php

namespace app\manage\model;

use app\common\model\SecondHandHouse as BaseSecondHandHouse;
use app\manage\model\HouseHost;
use app\manage\model\City;

/**
 * This is the model class for table "{{%second_hand_house}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $house_host_id
 * @property integer $type
 * @property integer $city_id
 * @property string $address
 * @property string $room
 * @property string $description
 * @property string $url
 * @property string $created_at
 * @property string $updated_at
 *
 * @property HouseHost $houseHost
 * @property City $city
 */
class SecondHandHouse extends BaseSecondHandHouse
{

}
