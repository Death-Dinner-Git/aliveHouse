<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;

/**
 * This is the model class for table "{{%upload}}".
 *
 * @property string $id
 * @property integer $is_delete
 * @property integer $back_user_id
 * @property string $name
 * @property string $path
 * @property string $url
 * @property string $ext
 * @property integer $size
 * @property string $md5
 * @property string $sha1
 * @property string $location
 * @property integer $download
 * @property string $create_time
 * @property string $update_time
 * @property integer $sort
 * @property integer $status
 *
 * @property BackUser $backUser
 */
class Upload extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%upload}}';

    protected $field = [
        'id',
        'is_delete',
        'back_user_id',
        'name',
        'path',
        'url',
        'ext',
        'size',
        'md5',
        'sha1',
        'location',
        'download',
        'create_time',
        'update_time',
        'sort',
        'status',
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
            [['is_delete', 'back_user_id', 'size', 'download', 'sort', 'status'], 'integer'],
            [['create_time', 'update_time'], 'required'],
            [['create_time', 'update_time'], 'safe'],
            [['name', 'path', 'url'], 'string', 'max' => 255],
            [['ext'], 'string', 'max' => 4],
            [['md5'], 'string', 'max' => 32],
            [['sha1'], 'string', 'max' => 40],
            [['location'], 'string', 'max' => 15],
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
            'is_delete' => '时效;0=无效;1=有效;',
            'back_user_id' => 'UID',
            'name' => '文件名',
            'path' => '文件路径',
            'url' => '文件链接',
            'ext' => '文件类型',
            'size' => '文件大小',
            'md5' => '文件md5',
            'sha1' => '文件sha1编码',
            'location' => '文件存储位置',
            'download' => '下载次数',
            'create_time' => '上传时间',
            'update_time' => '修改时间',
            'sort' => '排序',
            'status' => '状态',
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
