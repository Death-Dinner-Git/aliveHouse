<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\City;
use app\common\model\BuildingDetail;
use app\common\model\HouseBetter;
use app\common\model\NewHouse;

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
class BuildingBase extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%building_base}}';

    // 保存自动完成列表
    protected $auto = [];
    // 新增自动完成列表
    protected $insert = [];
    // 更新自动完成列表
    protected $update = [];

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['is_delete', 'type', 'city_id'], 'integer'],
            [['city_id', 'name', 'address', 'created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'address'], 'string', 'max' => 255],
            [['city_id'], 'exist', 'skipOnError' => true, 'targetClass' => City::tableNameSuffix(), 'targetAttribute' => ['city_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'is_delete' => '时效;0=失效,1=有效;默认1;',
            'type' => '类型;0=,1=;默认1;',
            'city_id' => '城市表ID',
            'name' => '楼盘名',
            'address' => '地址',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getCity()
    {
        return $this->hasOne(City::tableNameSuffix(), ['id' => 'city_id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getBuildingDetails()
    {
        return $this->hasMany(BuildingDetail::tableNameSuffix(), ['building_base_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getHouseBetters()
    {
        return $this->hasMany(HouseBetter::tableNameSuffix(), ['building_base_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getNewHouses()
    {
        return $this->hasMany(NewHouse::tableNameSuffix(), ['building_base_id' => 'id']);
    }
}
