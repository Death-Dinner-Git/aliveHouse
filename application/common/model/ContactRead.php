<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;
use app\common\model\Contact;

/**
 * This is the model class for table "{{%contact_read}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $assign
 * @property integer $back_user_id
 * @property integer $contact_id
 * @property string $content
 * @property string $remark
 * @property string $reback
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property Contact $contact
 */
class ContactRead extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%contact_read}}';

    protected $field = [
        'id',
        'is_delete',
        'assign',
        'back_user_id',
        'contact_id',
        'content',
        'remark',
        'reback',
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
            [['is_delete', 'assign', 'back_user_id', 'contact_id'], 'integer'],
            [['back_user_id', 'contact_id', 'created_at'], 'required'],
            [['content', 'remark', 'reback'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['back_user_id'], 'exist', 'skipOnError' => true, 'targetClass' => BackUser::tableNameSuffix(), 'targetAttribute' => ['back_user_id' => 'id']],
            [['contact_id'], 'exist', 'skipOnError' => true, 'targetClass' => Contact::tableNameSuffix(), 'targetAttribute' => ['contact_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'is_delete' => '时效;0=无效;1=有效;',
            'assign' => '分配;0=分配;1=自由;',
            'back_user_id' => '后台管理员ID',
            'contact_id' => '联系我们表ID',
            'content' => '通知信息内容',
            'remark' => '备注',
            'reback' => '回馈',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getBackUser()
    {
        return $this->hasOne(ucfirst(BackUser::tableNameSuffix()), 'back_user_id', 'id');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getContact()
    {
        return $this->hasOne(Contact::tableNameSuffix(), ['id' => 'contact_id']);
    }
}
