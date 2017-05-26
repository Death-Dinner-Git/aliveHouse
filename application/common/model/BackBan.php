<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackAuthItem;
use app\common\model\BackUser;

/**
 * This is the model class for table "{{%back_ban}}".
 *
 * @property string $item_name
 * @property integer $back_user_id
 * @property integer $ban
 * @property string $created_at
 *
 * @property BackAuthItem $itemName
 * @property BackUser $backUser
 */
class BackBan extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%back_ban}}';

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
            [['item_name', 'back_user_id', 'created_at'], 'required'],
            [['back_user_id', 'ban'], 'integer'],
            [['created_at'], 'safe'],
            [['item_name'], 'string', 'max' => 64],
            [['item_name'], 'exist', 'skipOnError' => true, 'targetClass' => BackAuthItem::tableNameSuffix(), 'targetAttribute' => ['item_name' => 'name']],
            [['back_user_id'], 'exist', 'skipOnError' => true, 'targetClass' => BackUser::tableNameSuffix(), 'targetAttribute' => ['back_user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'item_name' => '名称',
            'back_user_id' => 'UID',
            'ban' => '类型;0=允许;1=禁止;',
            'created_at' => '变更时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getItemName()
    {
        return $this->hasOne(BackAuthItem::tableNameSuffix(), ['name' => 'item_name']);
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getBackUser()
    {
        return $this->hasOne(BackUser::tableNameSuffix(), ['id' => 'back_user_id']);
    }
}
