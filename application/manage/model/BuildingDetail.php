<?php

namespace app\manage\model;

use app\common\model\BuildingDetail as BaseBuildingDetail;

use app\manage\model\BuildingBase;

/**
 * This is the model class for table "{{%building_detail}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $building_base_id
 * @property string $description
 * @property string $address
 * @property string $url
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BuildingBase $buildingBase
 */
class BuildingDetail extends BaseBuildingDetail
{

}