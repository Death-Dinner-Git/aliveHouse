<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;
use app\common\model\Guest;

/**
 * This is the model class for table "{{%take_order}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $back_user_id
 * @property integer $guest_id
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
 * @property Guest $guest
 */
class TakeOrder extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%take_order}}';

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
            [['is_delete', 'back_user_id', 'guest_id', 'house_type', 'goods_id', 'deal_status'], 'integer'],
            [['back_user_id', 'guest_id', 'order_code', 'goods_id', 'money', 'description', 'created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['order_code', 'money', 'description'], 'string', 'max' => 255],
            [['back_user_id'], 'exist', 'skipOnError' => true, 'targetClass' => BackUser::tableNameSuffix(), 'targetAttribute' => ['back_user_id' => 'id']],
            [['guest_id'], 'exist', 'skipOnError' => true, 'targetClass' => Guest::tableNameSuffix(), 'targetAttribute' => ['guest_id' => 'id']],
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
            'guest_id' => '客户表ID',
            'order_code' => '订单号',
            'house_type' => '类型;1=新房,2=二手房;默认1;',
            'goods_id' => '目标商品ID',
            'deal_status' => '交易状态;0=失败,1=成功;默认1;',
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
        return $this->hasOne(BackUser::tableNameSuffix(), ['id' => 'back_user_id']);
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getGuest()
    {
        return $this->hasOne(Guest::tableNameSuffix(), ['id' => 'guest_id']);
    }
}
