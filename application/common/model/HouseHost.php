<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\HouseHostServer;
use app\common\model\SecondHandHouse;

/**
 * This is the model class for table "{{%house_host}}".
 *
 * @property integer $id
 * @property string $ID_cards
 * @property string $real_name
 * @property string $phone
 * @property string $nickname
 * @property string $address
 * @property string $email
 * @property string $avatar
 * @property integer $is_delete
 * @property integer $city_id
 * @property integer $type
 * @property string $created_at
 * @property string $updated_at
 *
 * @property HouseHostServer[] $houseHostServers
 * @property SecondHandHouse[] $secondHandHouses
 */
class HouseHost extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%house_host}}';

    protected $field = [
        'id',
        'ID_cards',
        'real_name',
        'phone',
        'nickname',
        'address',
        'email',
        'avatar',
        'is_delete',
        'city_id',
        'type',
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
            [['is_delete', 'city_id', 'type'], 'integer'],
            [['city_id', 'created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['ID_cards', 'avatar'], 'string', 'max' => 255],
            [['real_name', 'nickname', 'email'], 'string', 'max' => 64],
            [['phone', 'address'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ID_cards' => '身份证',
            'real_name' => '真实姓名',
            'phone' => '手机号码',
            'nickname' => '昵称',
            'address' => '地址',
            'email' => '邮箱',
            'avatar' => '头像地址',
            'is_delete' => '时效;0=失效,1=有效;默认1;',
            'city_id' => '城市表ID',
            'type' => '类型;0=过客,1=客户;默认1;',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getHouseHostServers()
    {
        return $this->hasMany(HouseHostServer::tableNameSuffix(), ['house_host_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getSecondHandHouses()
    {
        return $this->hasMany(SecondHandHouse::tableNameSuffix(), ['house_host_id' => 'id']);
    }
}
