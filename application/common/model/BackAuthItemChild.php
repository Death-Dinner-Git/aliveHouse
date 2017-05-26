<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackAuthItem;

/**
 * This is the model class for table "{{%back_auth_item_child}}".
 *
 * @property string $parent
 * @property string $child
 *
 * @property BackAuthItem $parent0
 * @property BackAuthItem $child0
 */
class BackAuthItemChild extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%back_auth_item_child}}';

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
            [['parent', 'child'], 'required'],
            [['parent', 'child'], 'string', 'max' => 64],
            [['parent'], 'exist', 'skipOnError' => true, 'targetClass' => BackAuthItem::tableNameSuffix(), 'targetAttribute' => ['parent' => 'name']],
            [['child'], 'exist', 'skipOnError' => true, 'targetClass' => BackAuthItem::tableNameSuffix(), 'targetAttribute' => ['child' => 'name']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'parent' => '权限上级',
            'child' => '权限下级',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getParent0()
    {
        return $this->hasOne(BackAuthItem::tableNameSuffix(), ['name' => 'parent']);
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getChild0()
    {
        return $this->hasOne(BackAuthItem::tableNameSuffix(), ['name' => 'child']);
    }
}
