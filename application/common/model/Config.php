<?php

namespace app\common\model;

use app\common\model\Model;

/**
 * This is the model class for table "{{%config}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $app
 * @property string $title
 * @property string $name
 * @property string $value
 * @property integer $group
 * @property string $type
 * @property string $options
 * @property string $tip
 * @property string $created_at
 * @property string $updated_at
 * @property integer $order
 * @property integer $status
 */
class Config extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%config}}';

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
            [['is_delete', 'app', 'group', 'order', 'status'], 'integer'],
            [['value', 'created_at', 'updated_at'], 'required'],
            [['value'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['title', 'name'], 'string', 'max' => 32],
            [['type'], 'string', 'max' => 16],
            [['options'], 'string', 'max' => 255],
            [['tip'], 'string', 'max' => 100],
            [['name'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '配置ID',
            'is_delete' => '时效;0=无效;1=有效;',
            'app' => '应用;0=后台;1=前台;',
            'title' => '配置标题',
            'name' => '配置名称',
            'value' => '配置值',
            'group' => '配置分组',
            'type' => '配置类型',
            'options' => '配置额外值',
            'tip' => '配置说明',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
            'order' => '排序',
            'status' => '状态',
        ];
    }
}
