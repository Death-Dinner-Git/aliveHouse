<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\AuthAssignment;
use app\common\model\BackUser;
use app\common\model\AuthRule;
use app\common\model\AuthItemChild;
use app\common\model\Ban;

/**
 * This is the model class for table "{{%auth_item}}".
 *
 * @property string $name
 * @property integer $type
 * @property string $description
 * @property string $rule_name
 * @property string $data
 * @property string $created_at
 * @property string $updated_at
 *
 * @property AuthAssignment[] $AuthAssignments
 * @property BackUser[] $backUsers
 * @property AuthRule $ruleName
 * @property AuthItemChild[] $AuthItemChildren
 * @property AuthItemChild[] $AuthItemChildren0
 * @property AuthItem[] $children
 * @property AuthItem[] $parents
 * @property Ban[] $Bans
 * @property BackUser[] $backUsers0
 */
class AuthItem extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%auth_item}}';

    protected $field = [
        'name',
        'type',
        'description',
        'rule_name',
        'data',
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
            [['name', 'type', 'created_at', 'updated_at'], 'required'],
            [['type'], 'integer'],
            [['description', 'data'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'rule_name'], 'string', 'max' => 64],
            [['rule_name'], 'exist', 'skipOnError' => true, 'targetClass' => AuthRule::tableNameSuffix(), 'targetAttribute' => ['rule_name' => 'name']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'name' => '权限名',
            'type' => '类型',
            'description' => '权限描述',
            'rule_name' => '使用规则',
            'data' => '补充说明',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getAuthAssignments()
    {
        return $this->hasMany(ucfirst(AuthAssignment::tableNameSuffix()), 'name','item_name');
    }

    /**
     * @return mixed
     */
    public function getBackUsers()
    {
        return $this->hasMany(ucfirst(BackUser::tableNameSuffix()), 'back_user_id', 'id')->viaTable('{{%back_auth_assignment}}', ['item_name' => 'name']);
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getRuleName()
    {
        return $this->hasOne(ucfirst(AuthRule::tableNameSuffix()), 'rule_name', 'name');
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getAuthItemChildren()
    {
        return $this->hasMany(ucfirst(AuthItemChild::tableNameSuffix()), 'name' ,'parent' );
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getAuthItemChildren0()
    {
        return $this->hasMany(ucfirst(AuthItemChild::tableNameSuffix()), 'name', 'child' );
    }

    /**
     * @return mixed
     */
    public function getChildren()
    {
        return $this->hasMany(ucfirst(AuthItem::tableNameSuffix()),  'child','name')->viaTable('{{%back_auth_item_child}}', ['parent' => 'name']);
    }

    /**
     * @return mixed
     */
    public function getParents()
    {
        return $this->hasMany(ucfirst(AuthItem::tableNameSuffix()), 'parent','name')->viaTable('{{%back_auth_item_child}}', ['child' => 'name']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getBans()
    {
        return $this->hasMany(ucfirst(Ban::tableNameSuffix()), 'name','item_name');
    }

    /**
     * @return mixed
     */
    public function getBackUsers0()
    {
        return $this->hasMany(ucfirst(BackUser::tableNameSuffix()), 'back_user_id', 'id')->viaTable('{{%back_ban}}', ['item_name' => 'name']);
    }
}
