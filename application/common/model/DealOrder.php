<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;
use app\common\model\Client;

/**
 * This is the model class for table "{{%take_order}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $back_user_id
 * @property integer $client_id
 * @property string $order_code
 * @property integer $house_type
 * @property integer $goods_id
 * @property integer $deal_status
 * @property string $money
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property Client $client
 */
class DealOrder extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%take_order}}';

    protected $field = [
        'id',
        'is_delete',
        'back_user_id',
        'client_id',
        'order_code',
        'house_type',
        'goods_id',
        'deal_status',
        'money',
        'description',
        'created_at',
        'updated_at',
    ];

    // 保存自动完成列表
    protected $auto = [];
    // 新增自动完成列表
    protected $insert = [];
    // 更新自动完成列表
    protected $update = [];

    public static $houseType = ['1'=>'新房','2'=>'二手房'];

    public static function getHouseType(){
        return self::$houseType;
    }

    public static $dealStatus = ['1'=>'成交','2'=>'取消'];

    public static function getDealStatus(){
        return self::$dealStatus;
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            'rule'=>[
                ['is_delete','in:0,1','时效 无效'],
                ['house_type','in:2,1','类型 无效'],
                ['deal_status','in:2,1','交易状态 无效'],
                ['back_user_id','number',],
                ['client_id','number',],
                ['house_type','number',],
                ['goods_id','number',],
                ['deal_status','number',],
                ['order_code','max:255',],
                ['money','max:255',],
                ['description','max:255',],
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
            'back_user_id' => '后台管理员ID',
            'client_id' => '客户表ID',
            'order_code' => '订单号',
            'house_type' => '类型;1=新房,2=二手房;默认1;',
            'goods_id' => '目标商品ID',
            'deal_status' => '交易状态;2=失败,1=成功;默认1;',
            'money' => '交易金额',
            'description' => '备注',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getBackUser()
    {
        return $this->hasOne(ucfirst(BackUser::tableNameSuffix()), 'back_user_id', 'id');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getClient()
    {
        return $this->hasOne(ucfirst(Client::tableNameSuffix()), 'client_id', 'id');
    }
}
