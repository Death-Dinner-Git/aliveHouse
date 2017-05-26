<?php

namespace app\manage\model;

use app\common\model\City as BaseCity;

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

}