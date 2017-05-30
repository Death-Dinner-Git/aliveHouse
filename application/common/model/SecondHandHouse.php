<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\HouseHost;
use app\common\model\City;

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
class SecondHandHouse extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%second_hand_house}}';

    protected $field = [
        'id',
        'is_delete',
        'house_host_id',
        'type',
        'city_id',
        'address',
        'room',
        'description',
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
            [['is_delete', 'house_host_id', 'type', 'city_id'], 'integer'],
            [['house_host_id', 'city_id', 'address', 'room', 'description', 'url', 'created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['address', 'room', 'description', 'url'], 'string', 'max' => 255],
            [['house_host_id'], 'exist', 'skipOnError' => true, 'targetClass' => HouseHost::tableNameSuffix(), 'targetAttribute' => ['house_host_id' => 'id']],
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
            'house_host_id' => '房东表ID',
            'type' => '类型;0=,1=;默认1;',
            'city_id' => '城市表ID',
            'address' => '地址',
            'room' => '房号',
            'description' => '详细描述',
            'url' => '封面宣传',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getHouseHost()
    {
        return $this->hasOne(HouseHost::tableNameSuffix(), ['id' => 'house_host_id']);
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getCity()
    {
        return $this->hasOne(City::tableNameSuffix(), ['id' => 'city_id']);
    }
}
