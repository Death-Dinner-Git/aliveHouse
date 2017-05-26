<?php

namespace app\manage\model;

use app\common\model\NewHouse as BaseNewHouse;
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
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BuildingBase $buildingBase
 */
class NewHouse extends BaseNewHouse
{

}
