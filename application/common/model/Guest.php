<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\GuestServer;
use app\common\model\TakeOrder;
use app\common\model\Walk;

/**
 * This is the model class for table "{{%guest}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $server
 * @property string $ID_cards
 * @property string $real_name
 * @property string $phone
 * @property string $nickname
 * @property string $address
 * @property string $email
 * @property string $avatar
 * @property integer $region_id
 * @property integer $type
 * @property integer $level
 * @property string $created_at
 * @property string $updated_at
 *
 * @property GuestServer[] $guestServers
 * @property TakeOrder[] $takeOrders
 * @property Walk[] $walks
 */
class Guest extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%guest}}';

    protected $field = [
        'id',
        'is_delete',
        'server',
        'ID_cards',
        'real_name',
        'phone',
        'nickname',
        'address',
        'email',
        'avatar',
        'region_id',
        'type',
        'level',
        'created_at',
        'updated_at',
    ];

    // 保存自动完成列表
    protected $auto = [];
    // 新增自动完成列表
    protected $insert = [];
    // 更新自动完成列表
    protected $update = [];

    public static $serverList = ['0'=>'已正式客户','1'=>'待开发客户'];

    public static $typeList = ['0'=>'过客','1'=>'客户'];

    public static $levelList = ['0'=>'贵宾','1'=>'普通'];

    public static function getServiceList(){
        return self::$serverList;
    }

    public static function getTypeList(){
        return self::$typeList;
    }

    public static function getLevelList(){
        return self::$levelList;
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['is_delete', 'server', 'region_id', 'type', 'level'], 'integer'],
            [['region_id', 'created_at', 'updated_at'], 'required'],
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
            'is_delete' => '时效;0=失效,1=有效;默认1;',
            'server' => '服务;0=已正式客户,1=待开发客户;默认1;',
            'ID_cards' => '身份证',
            'real_name' => '真实姓名',
            'phone' => '手机号码',
            'nickname' => '昵称',
            'address' => '地址',
            'email' => '邮箱',
            'avatar' => '头像地址',
            'region_id' => '全国地区表ID',
            'type' => '类型;0=过客,1=客户;默认1;',
            'level' => '等级;0=贵宾,1=普通;默认1;',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getGuestServers()
    {
        return $this->hasMany(GuestServer::tableNameSuffix(), ['guest_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getTakeOrders()
    {
        return $this->hasMany(TakeOrder::tableNameSuffix(), ['guest_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getWalks()
    {
        return $this->hasMany(Walk::tableNameSuffix(), ['guest_id' => 'id']);
    }
}
