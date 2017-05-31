<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;

/**
 * This is the model class for table "{{%download}}".
 *
 * @property integer $id
 * @property integer $back_user_id
 * @property string $title
 * @property string $url
 * @property string $fileName
 * @property string $tb_name
 * @property string $tb_id
 * @property string $tb_category
 * @property string $created_at
 *
 * @property BackUser $backUser
 */
class Download extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%download}}';

    protected $field = [
        'id',
        'back_user_id',
        'title',
        'url',
        'fileName',
        'tb_name',
        'tb_id',
        'tb_category',
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
            [['back_user_id', 'title', 'url', 'tb_name', 'tb_id', 'tb_category', 'created_at'], 'required'],
            [['back_user_id'], 'integer'],
            [['url', 'tb_id', 'tb_category'], 'string'],
            [['created_at'], 'safe'],
            [['title', 'tb_name'], 'string', 'max' => 50],
            [['fileName'], 'string', 'max' => 255],
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
            'back_user_id' => '后台管理员ID',
            'title' => '资源描述',
            'url' => '资源地址',
            'fileName' => '资源名称',
            'tb_name' => '目标表名',
            'tb_id' => '表的id',
            'tb_category' => '类别信息',
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
