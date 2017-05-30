<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BuildingBase;

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
class BuildingDetail extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%building_detail}}';

    protected $field = [
        'id',
        'is_delete',
        'building_base_id',
        'description',
        'address',
        'url',
        'created_at',
        'updated_at',
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
            [['is_delete', 'building_base_id'], 'integer'],
            [['building_base_id', 'description', 'address', 'url', 'created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['description', 'address', 'url'], 'string', 'max' => 255],
            [['building_base_id'], 'exist', 'skipOnError' => true, 'targetClass' => BuildingBase::tableNameSuffix(), 'targetAttribute' => ['building_base_id' => 'id']],
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
            'building_base_id' => '楼盘表ID',
            'description' => '详细描述',
            'address' => '详细地址',
            'url' => '封面宣传',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getBuildingBase()
    {
        return $this->hasOne(BuildingBase::tableNameSuffix(), ['id' => 'building_base_id']);
    }
}
