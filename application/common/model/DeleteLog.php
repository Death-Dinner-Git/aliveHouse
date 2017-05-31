<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;

/**
 * This is the model class for table "{{%delete_log}}".
 *
 * @property integer $id
 * @property integer $table_type
 * @property integer $back_user_id
 * @property integer $delete_id
 * @property string $remark
 * @property string $created_at
 *
 * @property BackUser $backUser
 */
class DeleteLog extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%delete_log}}';

    protected $field = [
        'id',
        'table_type',
        'back_user_id',
        'delete_id',
        'remark',
        'created_at',
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
            [['table_type', 'back_user_id', 'delete_id'], 'integer'],
            [['delete_id', 'created_at'], 'required'],
            [['remark'], 'string'],
            [['created_at'], 'safe'],
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
            'table_type' => '目标表类型',
            'back_user_id' => '后台业务员ID',
            'delete_id' => '被操作ID',
            'remark' => '备注',
            'created_at' => '创建时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getBackUser()
    {
        return $this->hasOne(ucfirst(BackUser::tableNameSuffix()), 'back_user_id', 'id');
    }
}
