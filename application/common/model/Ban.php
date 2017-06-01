<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\AuthItem;
use app\common\model\BackUser;

/**
 * This is the model class for table "{{%back_ban}}".
 *
 * @property string $item_name
 * @property integer $back_user_id
 * @property integer $ban
 * @property string $created_at
 *
 * @property AuthItem $itemName
 * @property BackUser $backUser
 */
class Ban extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%ban}}';

    protected $field = [
        'item_name',
        'back_user_id',
        'ban',
        'created_at',
    ];

    // 保存自动完成列表
    protected $auto = [];
    // 新增自动完成列表
    protected $insert = [];
    // 更新自动完成列表
    protected $update = [];

    public static $banList = ['0'=>'允许','1'=>'禁止'];

    public static function getBanList(){
        return self::$banList;
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            'rule'=>[
                ['back_user_id','number','用户 无效'],
                ['ban','in:0,1','权限 无效'],
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
        return $this->hasOne(AuthItem::tableNameSuffix(), ['name' => 'item_name']);
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getBackUser()
    {
        return $this->hasOne(ucfirst(BackUser::tableNameSuffix()), 'back_user_id', 'id');
    }
}
