<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;

/**
 * This is the model class for table "{{%customer_service}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $level
 * @property integer $back_user_id
 * @property integer $duration
 * @property string $start_at
 * @property string $end_at
 * @property integer $order
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 */
class CustomerService extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%customer_service}}';

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
            [['is_delete', 'level', 'back_user_id', 'duration', 'order'], 'integer'],
            [['back_user_id', 'created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['start_at', 'end_at'], 'string', 'max' => 10],
            [['back_user_id'], 'exist', 'skipOnError' => true, 'targetClass' => BackUser::tableNameSuffix(), 'targetAttribute' => ['back_user_id' => 'id']],
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
            'level' => '等级;0=普通客服;1=金牌客服;',
            'back_user_id' => '后台管理员ID',
            'duration' => '有效时间',
            'start_at' => '开始时间',
            'end_at' => '结束时间',
            'order' => '拖拽顺序',
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
}
