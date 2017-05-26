<?php

namespace app\manage\model;

use app\common\model\BuildingBase as BaseBuildingBase;

use app\manage\model\City;
use app\manage\model\BuildingDetail;
use app\manage\model\HouseBetter;
use app\manage\model\NewHouse;

/**
 * This is the model class for table "{{%building_base}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $type
 * @property integer $city_id
 * @property string $name
 * @property string $address
 * @property string $created_at
 * @property string $updated_at
 *
 * @property City $city
 * @property BuildingDetail[] $buildingDetails
 * @property HouseBetter[] $houseBetters
 * @property NewHouse[] $newHouses
 */
class BuildingBase extends BaseBuildingBase
{

}
