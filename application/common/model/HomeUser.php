<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\Contact;
use app\common\model\HomeUserLog;
use app\common\model\Opinion;

/**
 * This is the model class for table "{{%home_user}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property string $code
 * @property string $phone
 * @property integer $phone_verified
 * @property string $email
 * @property integer $email_verified
 * @property string $username
 * @property string $password
 * @property string $nickname
 * @property string $real_name
 * @property string $head_url
 * @property string $sex
 * @property string $signature
 * @property string $birthday
 * @property integer $height
 * @property integer $weight
 * @property string $token
 * @property string $auth_key
 * @property string $password_reset_token
 * @property string $password_reset_code
 * @property integer $status
 * @property string $ip
 * @property string $reg_ip
 * @property string $reg_type
 * @property string $registered_at
 * @property string $logined_at
 * @property string $updated_at
 *
 * @property Contact[] $contacts
 * @property HomeUserLog[] $homeUserLogs
 * @property Opinion[] $opinions
 */
class HomeUser extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%home_user}}';

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
            [['id', 'username', 'password'], 'required'],
            [['id', 'is_delete', 'phone_verified', 'email_verified', 'height', 'weight', 'status'], 'integer'],
            [['sex', 'ip'], 'string'],
            [['birthday', 'registered_at', 'logined_at', 'updated_at'], 'safe'],
            [['code', 'username', 'signature', 'auth_key', 'reg_ip'], 'string', 'max' => 32],
            [['phone'], 'string', 'max' => 11],
            [['email', 'nickname', 'real_name', 'head_url'], 'string', 'max' => 64],
            [['password', 'token', 'password_reset_token', 'password_reset_code'], 'string', 'max' => 255],
            [['reg_type'], 'string', 'max' => 15],
            [['username'], 'unique'],
            [['code'], 'unique'],
            [['phone'], 'unique'],
            [['email'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '自增ID',
            'is_delete' => '时效;0=无效;1=有效;',
            'code' => '会员编号ID',
            'phone' => '手机号码',
            'phone_verified' => '手机号码是否已验证;\"0\"表示没有验证,\"1\"表示已验证',
            'email' => '邮箱',
            'email_verified' => '邮箱是否已验证;\"0\"表示没有验证,\"1\"表示已验证',
            'username' => '用户名',
            'password' => '密码',
            'nickname' => '昵称',
            'real_name' => '真实姓名',
            'head_url' => '头像地址',
            'sex' => '性别',
            'signature' => '个性签名',
            'birthday' => '生日',
            'height' => '身高/单位CM',
            'weight' => '体重/单位KG',
            'token' => '当前token',
            'auth_key' => '自动密匙',
            'password_reset_token' => '重置密匙',
            'password_reset_code' => '验证码',
            'status' => '状态;0:正常,1:异常;2:禁用;',
            'ip' => '登录IP',
            'reg_ip' => '注册IP',
            'reg_type' => '注册方式',
            'registered_at' => '注册时间',
            'logined_at' => '登录时间',
            'updated_at' => '更新时间',
        ];
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getContacts()
    {
        return $this->hasMany(Contact::tableNameSuffix(), ['home_user_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getHomeUserLogs()
    {
        return $this->hasMany(HomeUserLog::tableNameSuffix(), ['home_user_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getOpinions()
    {
        return $this->hasMany(Opinion::tableNameSuffix(), ['home_user_id' => 'id']);
    }
}
