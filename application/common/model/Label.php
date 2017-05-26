<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\LabelPark;

/**
 * This is the model class for table "{{%label}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $type
 * @property string $name
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 *
 * @property LabelPark[] $labelParks
 */
class Label extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%label}}';

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
            [['is_delete', 'type'], 'integer'],
            [['name', 'description', 'created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['name'], 'string', 'max' => 32],
            [['description'], 'string', 'max' => 255],
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
            'type' => '父级类型:0=失效,1=预定,2=客户,3=房东,4=新房,5=二手房,6=楼房,7=客服评价,8=;默认1;',
            'name' => '标签',
            'description' => '详细描述',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getLabelParks()
    {
        return $this->hasMany(LabelPark::tableNameSuffix(), ['label_id' => 'id']);
    }
}
