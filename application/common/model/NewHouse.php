<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;
use app\common\model\BuildingBase;

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
 * @property BackUser $createdBy
 */
class NewHouse extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%new_house}}';

    protected $field = [
        'id',
        'is_delete',
        'building_base_id',
        'title',
        'city_id',
        'county_id',
        'address',
        'type',
        'room',
        'url',
        'floorsType',
        'onFloor',
        'floors',
        'face',
        'houseType',
        'fitment',
        'eachPrice',
        'price',
        'years',
        'area',
        'description',
        'supporting',
        'traffic',
        'around',
        'houseLabel',
        'istop',
        'status',
        'salestatus',
        'contact',
        'tel',
        'email',
        'weChat',
        'qq',
        'created_by',
        'created_at',
        'updated_at',
    ];

    // 保存自动完成列表
    protected $auto = [];
    // 新增自动完成列表
    protected $insert = [];
    // 更新自动完成列表
    protected $update = [];

    public static $typeList = ['1'=>'新房','2'=>'二手房'];
    public $statusList = ['1'=>'销售中','2'=>'已售完'];

    public static function getTypeList(){
        return self::$typeList;
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            'rule'=>[
                ['is_delete','in:0,1','时效 无效'],
                ['building_base_id','number',],
                ['type','number',],
                ['room','max:255',],
                ['description','max:255',],
                ['address','max:255',],
                ['url','max:255',],
            ],
            'msg'=>[]
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
            'type' => '类型;1=类型;默认1;',
            'room' => '房号',
            'description' => '详细描述',
            'address' => '地址',
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
        return $this->hasOne(ucfirst(BuildingBase::tableNameSuffix()),'id', 'building_base_id');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getCreatedBy()
    {
        return $this->hasOne(ucfirst(BackUser::tableNameSuffix()),'id', 'created_by');
    }
}
