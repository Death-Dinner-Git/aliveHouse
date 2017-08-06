<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\AuthItem;
use app\common\model\BackUser;

/**
 * This is the model class for table "auth_assignment".
 *
 * @property string $item_name
 * @property integer $back_user_id
 * @property string $created_at
 *
 * @property AuthItem $itemName
 * @property BackUser $backUser
 */
class AuthAssignment extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%auth_assignment}}';

    protected $field = [
        'item_name',
        'user_id',
        'created_at',
    ];

    // 保存自动完成列表
    protected $auto = [];
    // 新增自动完成列表
    protected $insert = [];
    // 更新自动完成列表
    protected $update = [];

    /**
     * @description 自动验证规则
     * @inheritdoc
     */
    public function rules()
    {
        return [
            'rule'=>[
                ['back_user_id','number','用户 无效'],
                ['item_name','max:64',],
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
            'item_name' => '分类权限等级',
            'back_user_id' => '分配对象UID',
            'created_at' => '创建时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getItemName()
    {
        return $this->hasOne(ucfirst(AuthItem::tableNameSuffix()), 'name', 'item_name');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getBackUser()
    {
        return $this->hasOne(ucfirst(BackUser::tableNameSuffix()), 'id', 'back_user_id');
    }
}
