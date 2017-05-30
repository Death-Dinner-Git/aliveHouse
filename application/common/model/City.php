<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BuildingBase;
use app\common\model\Region;
use app\common\model\SecondHandHouse;

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
class City extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%city}}';

    protected $field = [
        'id',
        'is_delete',
        'region_id',
        'parent',
        'name',
        'level',
        'order',
        'code',
        'name_en',
        'short_name_en',
        'data',
    ];

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
            [['is_delete', 'parent', 'level', 'order'], 'integer'],
            [['region_id', 'parent', 'name', 'order', 'code', 'name_en', 'short_name_en'], 'required'],
            [['region_id'], 'number'],
            [['data'], 'string'],
            [['name', 'code', 'name_en'], 'string', 'max' => 100],
            [['short_name_en'], 'string', 'max' => 10],
            [['region_id'], 'exist', 'skipOnError' => true, 'targetClass' => Region::tableNameSuffix(), 'targetAttribute' => ['region_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'is_delete' => '时效;0=无效;1=有效;',
            'region_id' => '地区父级',
            'parent' => 'Parent',
            'name' => 'Name',
            'level' => '等级;0=全国,1=省级,2=市级,3=县级',
            'order' => 'Order',
            'code' => 'Code',
            'name_en' => 'Name En',
            'short_name_en' => 'Short Name En',
            'data' => 'Data',
        ];
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getBuildingBases()
    {
        return $this->hasMany(BuildingBase::tableNameSuffix(), ['city_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getRegion()
    {
        return $this->hasOne(Region::tableNameSuffix(), ['id' => 'region_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSecondHandHouses()
    {
        return $this->hasMany(SecondHandHouse::tableNameSuffix(), ['city_id' => 'id']);
    }
}
