<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\GuestServer;
use app\common\model\TakeOrder;
use app\common\model\Walk;

/**
 * This is the model class for table "{{%guest}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $server
 * @property string $cardId
 * @property string $real_name
 * @property string $userName
 * @property string $phone
 * @property string $address
 * @property string $email
 * @property string $avatar
 * @property integer $type
 * @property integer $level
 * @property integer $sex
 * @property integer $province
 * @property integer $city
 * @property integer $clientFrom
 * @property string $agentName
 * @property string $agentTel
 * @property string $tel
 * @property string $otherName
 * @property string $otherPhone
 * @property string $QQ
 * @property string $birth
 * @property string $job
 * @property string $feature
 * @property string $notes
 * @property integer $requireType
 * @property integer $inHainan
 * @property integer $askType
 * @property integer $askDate
 * @property integer $lastVisitDate
 * @property integer $nextVisitDate
 * @property integer $visitNum
 * @property integer $clientLevel
 * @property integer $category
 * @property integer $serviceStatus
 * @property integer $belongUserId
 * @property string $belongUser
 * @property integer $firstUserId
 * @property string $firstUser
 * @property integer $arrangeId
 * @property string $arrangeUser
 * @property integer $changeClient
 * @property string $delReason
 * @property integer $belongPid
 * @property integer $createdId
 * @property string $updatedBy
 * @property integer $updatedAt
 * @property string $createdBy
 * @property integer $createdAt
 * @property integer $changeAt
 * @property integer $agentNextId
 * @property integer $jobType
 * @property integer $visitHouseAt
 * @property integer $isBargain
 * @property string $agentSaleName
 * @property integer $agentAt
 * @property string $agentSaleTel
 * @property integer $fitmentId
 * @property string $seeItem
 * @property string $buyCity
 * @property string $clientPoint
 * @property integer $showAt
 * @property string $created_at
 * @property string $updated_at
 *
 * @property GuestServer[] $guestServers
 * @property TakeOrder[] $takeOrders
 * @property Walk[] $walks
 */
class Guest extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%guest}}';

    protected $field = [
        'id',
        'is_delete',
        'server',
        'cardId',
        'real_name',
        'userName',
        'phone',
        'address',
        'email',
        'avatar',
        'type',
        'level',
        'sex',
        'province',
        'city',
        'clientFrom',
        'agentName',
        'agentTel',
        'tel',
        'otherName',
        'otherPhone',
        'QQ',
        'birth',
        'job',
        'feature',
        'notes',
        'requireType',
        'inHainan',
        'askType',
        'askDate',
        'lastVisitDate',
        'nextVisitDate',
        'visitNum',
        'clientLevel',
        'category',
        'serviceStatus',
        'belongUserId',
        'belongUser',
        'firstUserId',
        'firstUser',
        'arrangeId',
        'arrangeUser',
        'changeClient',
        'delReason',
        'belongPid',
        'createdId',
        'updatedBy',
        'updatedAt',
        'createdBy',
        'createdAt',
        'changeAt',
        'agentNextId',
        'jobType',
        'visitHouseAt',
        'isBargain',
        'agentSaleName',
        'agentAt',
        'agentSaleTel',
        'fitmentId',
        'seeItem',
        'buyCity',
        'clientPoint',
        'showAt',
        'created_at',
        'updated_at',
    ];

    // 保存自动完成列表
    protected $auto = [];
    // 新增自动完成列表
    protected $insert = [];
    // 更新自动完成列表
    protected $update = [];

    public $clientFromList = ['1'=>'已正式客户','2'=>'待开发客户'];

    public $jobTypeList = ['1'=>'过客','2'=>'客户'];

    public $isBargainList = ['1'=>'贵宾','2'=>'普通'];

    public static $serverList = ['1'=>'已正式客户','2'=>'待开发客户'];

    public static $typeList = ['1'=>'过客','2'=>'客户'];

    public static $levelList = ['1'=>'贵宾','2'=>'普通'];

    public static function getServiceList(){
        return self::$serverList;
    }

    public static function getTypeList(){
        return self::$typeList;
    }

    public static function getLevelList(){
        return self::$levelList;
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            'rule'=>[
                ['is_delete','in:0,1','时效 无效'],
                ['type','number','类型 无效'],
                ['server','number','服务 无效'],
                ['level','number','等级 无效'],
                ['ID_cards','max:255',],
                ['avatar','max:255',],
                ['real_name','max:64',],
                ['nickname','max:64',],
                ['email','max:64',],
                ['phone','max:32',],
                ['address','max:32',],
            ],
            'msg'=>[],
            'sds'=>[
                [['is_delete', 'server', 'type', 'level', 'sex', 'province', 'city', 'clientFrom', 'requireType', 'inHainan', 'askType', 'askDate', 'lastVisitDate', 'nextVisitDate', 'visitNum', 'clientLevel', 'category', 'serviceStatus', 'belongUserId', 'firstUserId', 'arrangeId', 'changeClient', 'belongPid', 'createdId', 'updatedAt', 'createdAt', 'changeAt', 'agentNextId', 'jobType', 'visitHouseAt', 'isBargain', 'agentAt', 'fitmentId', 'showAt'], 'integer'],
                [['belongPid', 'created_at', 'updated_at'], 'required'],
                [['created_at', 'updated_at'], 'safe'],
                [['cardId', 'phone', 'address', 'agentTel', 'tel', 'otherName', 'QQ', 'birth', 'job'], 'string', 'max' => 32],
                [['real_name', 'userName', 'email', 'agentName', 'otherPhone'], 'string', 'max' => 64],
                [['avatar', 'delReason', 'seeItem'], 'string', 'max' => 255],
                [['feature', 'notes', 'clientPoint'], 'string', 'max' => 1000],
                [['belongUser', 'firstUser', 'arrangeUser', 'updatedBy', 'createdBy', 'agentSaleName'], 'string', 'max' => 50],
                [['agentSaleTel'], 'string', 'max' => 20],
                [['buyCity'], 'string', 'max' => 100],
            ]
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
            'server' => '服务;0=已正式客户,1=待开发客户;默认1;',
            'cardId' => '身份证',
            'real_name' => '真实姓名',
            'userName' => '用户名',
            'phone' => '手机号码',
            'address' => '地址',
            'email' => '邮箱',
            'avatar' => '头像地址',
            'type' => '类型;0=过客,1=客户;默认1;',
            'level' => '等级;0=贵宾,1=普通;默认1;',
            'sex' => '性别',
            'province' => '省份',
            'city' => '城市',
            'clientFrom' => '客户来源',
            'agentName' => '置业人员名称',
            'agentTel' => '置业人员联系方式',
            'tel' => '联系方式',
            'otherName' => '其他名称',
            'otherPhone' => '其他手机号码',
            'QQ' => 'QQ',
            'birth' => '生日',
            'job' => '工作',
            'feature' => '客户需求',
            'notes' => '备注',
            'requireType' => '需求类别',
            'inHainan' => '是否来过海南',
            'askType' => '接洽方式',
            'askDate' => 'Ask Date',
            'lastVisitDate' => '第一次回访时间',
            'nextVisitDate' => '最近一次回访日期',
            'visitNum' => '回访次数',
            'clientLevel' => '1暂未确定，2近期看房，3重要客户，4放弃客户，5看房客户，6成交客户，7退房客户',
            'category' => '客户分类',
            'serviceStatus' => '服务状态',
            'belongUserId' => '权属人',
            'belongUser' => '权属人名',
            'firstUserId' => '第一次添加人',
            'firstUser' => '第一次添加人名',
            'arrangeId' => '看房安排',
            'arrangeUser' => '看房安排者',
            'changeClient' => '改变客户',
            'delReason' => '删除原因',
            'belongPid' => '权属上级',
            'createdId' => '创建者',
            'updatedBy' => '更新者',
            'updatedAt' => '更新时间',
            'createdBy' => '添加者',
            'createdAt' => '创建时间',
            'changeAt' => '改变时间',
            'agentNextId' => '经纪人id',
            'jobType' => '工作方式',
            'visitHouseAt' => '看房时间',
            'isBargain' => '1已成交，2未成交',
            'agentSaleName' => '客户分类',
            'agentAt' => '确定时间',
            'agentSaleTel' => '置业人员 账号',
            'fitmentId' => '家装',
            'seeItem' => '看房项目',
            'buyCity' => '购买城市',
            'clientPoint' => '客户关注',
            'showAt' => '查看时间',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getGuestServers()
    {
        return $this->hasMany(GuestServer::tableNameSuffix(), ['guest_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getTakeOrders()
    {
        return $this->hasMany(TakeOrder::tableNameSuffix(), ['guest_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getWalks()
    {
        return $this->hasMany(Walk::tableNameSuffix(), ['guest_id' => 'id']);
    }
}
