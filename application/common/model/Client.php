<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\ClientServer;
use app\common\model\TakeOrder;
use app\common\model\Walk;

/**
 * This is the model class for table "{{%client}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property string $cardId
 * @property string $userName
 * @property string $phone
 * @property string $address
 * @property string $email
 * @property string $avatar
 * @property integer $type
 * @property integer $sex
 * @property integer $province_id
 * @property integer $city_id
 * @property integer $county_id
 * @property integer $clientFrom
 * @property string $clientFromExtra
 * @property string $agentName
 * @property string $agentTel
 * @property string $otherName
 * @property string $otherPhone
 * @property string $qq
 * @property string $weChat
 * @property string $birth
 * @property string $job
 * @property string $buyPurpose
 * @property string $notes
 * @property integer $requireType
 * @property integer $inHainan
 * @property integer $askType
 * @property integer $askDate
 * @property string $lastVisitDate
 * @property string $nextVisitDate
 * @property integer $visitNum
 * @property integer $serviceStatus
 * @property string $serviceAt
 * @property integer $belongUserId
 * @property integer $firstUserId
 * @property integer $arrangeId
 * @property integer $changeClient
 * @property string $delReason
 * @property integer $belongPid
 * @property integer $updatedBy
 * @property string $updatedAt
 * @property integer $createdBy
 * @property string $createdAt
 * @property integer $agentNextId
 * @property string $visitHouseAt
 * @property integer $isBargain
 * @property string $agentAt
 * @property integer $fitmentId
 * @property string $seeItem
 * @property string $buyCity
 * @property string $clientPoint
 * @property string $showAt
 * @property string $created_at
 * @property string $updated_at
 *
 * @property ClientServer[] $clientServers
 * @property TakeOrder[] $takeOrders
 * @property Walk[] $walks
 */
class Client extends Model
{
    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%client}}';
    protected $field = [
        'id',
        'is_delete',
        'cardId',
        'userName',
        'phone',
        'address',
        'email',
        'avatar',
        'type',
        'sex',
        'province_id',
        'city_id',
        'county_id',
        'clientFrom',
        'agentName',
        'agentTel',
        'otherName',
        'otherPhone',
        'qq',
        'weChat',
        'birth',
        'job',
        'notes',
        'requireType',
        'buyPurpose',
        'inHainan',
        'askType',
        'askDate',
        'lastVisitDate',
        'nextVisitDate',
        'visitNum',
        'serviceStatus',
        'serviceAt',
        'belongUserId',
        'firstUserId',
        'arrangeId',
        'changeClient',
        'delReason',
        'belongPid',
        'updatedBy',
        'updatedAt',
        'createdBy',
        'createdAt',
        'agentNextId',
        'visitHouseAt',
        'isBargain',
        'agentAt',
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

    // 类型
    public $typeList = ['1' => '过客', '2' => '客户'];
    // sex
    public $sexList = ['1' => '女', '2' => '男'];
    // 客户来源
    public $clientFromList = [
        '1' => '好房置业',
        '2' => '好房活动',
        '3' => '朋友介绍',
        '4' => '看房游',
        '5' => '自主开发',
        '6' => '搜房发帖',
        '7' => '安居客发帖',
        '8' => '站外发帖',
        '9' => '好房发帖',
        '10' => '搜房发帖',
        '11' => '二手房',
        '12' => '售楼处',
        '13' => '售楼处来电',
        '14' => '好房400',
        '15' => '客户转介绍',
        '16' => '户外宣传',
        '17' => '好房商桥',
        '18' => '好房互动',
        '19' => '房展会',
        '20' => '短信促销',
        '21' => '一号通来电',
        '22' => '甲方客户',
        '23' => '其他'
    ];

    // 需求类别
    public $requireTypeList = [
        '1' => '新房',
        '2' => '二手房',
        '3' => '综合投资',
    ];
    // 接洽方式
    public $askTypeList = [
        '1' => '网络',
        '2' => '来电',
        '3' => '去电',
        '4' => '来访',
        '5' => '短信',
        '6' => '其他',
    ];
    // 置业目的
    public $buyPurposeList = [
        '1' => '居住',
        '2' => '养老',
        '3' => '休闲度假 ',
        '4' => '投资',
        '0' => '其他',
    ];
    // 客户等级
    public $clientLevelList = [
        '1' => '暂未确定',
        '2' => '近期看房',
        '3' => '重要客户',
        '4' => '放弃客户',
        '5' => '看房客户',
        '6' => '成交客户',
        '7' => '退房客户',
        '11' => 'A级',
        '12' => 'B级',
        '13' => 'C级',
        '14' => 'D级'
    ];
    // 服务状态
    public $serviceStatusList = [
        '1' => '暂未确定',
        '2' => '近期看房',
        '3' => '重要客户',
        '4' => '放弃客户',
        '5' => '看房客户',
        '6' => '成交客户',
        '7' => '退房客户',
        '11' => 'A级',
        '12' => 'B级',
        '13' => 'C级',
        '14' => 'D级'
    ];
    public static $serverList = ['1' => '已正式客户', '2' => '待开发客户'];
    public static $typeLists = ['1' => '过客', '2' => '客户'];
    public static $levelList = ['1' => '贵宾', '2' => '普通'];

    public static function getServiceList()
    {
        return self::$serverList;
    }

    public static function getTypeList()
    {
        return self::$typeLists;
    }

    public static function getLevelList()
    {
        return self::$levelList;
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            'rule' => [
                ['is_delete', 'in:0,1', '时效 无效'],
                ['type', 'number', '类型 无效'],
                ['server', 'number', '服务 无效'],
                ['level', 'number', '等级 无效'],
                ['ID_cards', 'max:255',],
                ['avatar', 'max:255',],
                ['real_name', 'max:64',],
                ['nickname', 'max:64',],
                ['email', 'max:64',],
                ['phone', 'max:32',],
                ['address', 'max:32',],
            ],
            'msg' => [],
            'sds' => [
                [['is_delete', 'type', 'level', 'sex', 'province_id', 'city_id', 'county_id', 'clientFrom', 'requireType', 'inHainan', 'askType', 'askDate', 'visitNum', 'category', 'serviceStatus', 'belongUserId', 'firstUserId', 'arrangeId', 'changeClient', 'belongPid', 'updatedBy', 'createdBy', 'agentNextId', 'isBargain', 'fitmentId'], 'integer'],
                [['feature', 'notes'], 'string'],
                [['lastVisitDate', 'nextVisitDate', 'serviceAt', 'updatedAt', 'createdAt', 'visitHouseAt', 'agentAt', 'showAt', 'created_at', 'updated_at'], 'safe'],
                [['cardId', 'phone', 'tel', 'address', 'agentTel', 'otherName', 'qq', 'birth', 'job'], 'string', 'max' => 32],
                [['userName', 'email', 'agentName', 'otherPhone', 'belongUser', 'firstUser', 'arrangeUser'], 'string', 'max' => 64],
                [['avatar', 'delReason', 'seeItem'], 'string', 'max' => 255],
                [['buyCity'], 'string', 'max' => 100],
                [['clientPoint'], 'string', 'max' => 1000],
            ]
        ];
    }

    /**
     * @return array
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'is_delete' => '时效;0=失效,1=有效;默认1;',
            'cardId' => '身份证',
            'userName' => '用户名',
            'phone' => '手机号码',
            'address' => '地址',
            'email' => '邮箱',
            'avatar' => '头像地址',
            'type' => '类型;0=过客,1=客户;默认1;',
            'sex' => '性别',
            'province_id' => '省份',
            'city_id' => '城市',
            'county_id' => '区/县',
            'clientFrom' => '客户来源',
            'clientFromExtra' => '其他客户来源方式',
            'agentName' => '置业人员名称',
            'agentTel' => '置业人员联系方式',
            'otherName' => '其他名称',
            'otherPhone' => '其他手机号码',
            'qq' => 'QQ',
            'weChat' => '微信',
            'birth' => '生日',
            'job' => '工作',
            'buyPurpose' => '置业目的',
            'buyPurposeExtra' => '其他置业目的',
            'notes' => '备注',
            'requireType' => '需求类别',
            'inHainan' => '是否来过海南',
            'askType' => '接洽方式',
            'askDate' => '接洽日期',
            'lastVisitDate' => '第一次回访时间',
            'nextVisitDate' => '最近一次回访日期',
            'visitNum' => '回访次数',
            'serviceStatus' => '服务状态',
            'serviceAt' => '服务时间',
            'belongUserId' => '权属人',
            'firstUserId' => '第一次添加人',
            'arrangeId' => '看房安排',
            'changeClient' => '改变客户',
            'delReason' => '删除原因',
            'belongPid' => '权属上级',
            'updatedBy' => '更新者',
            'updatedAt' => '更新时间',
            'createdBy' => '添加者',
            'createdAt' => '创建时间',
            'agentNextId' => '经纪人id',
            'visitHouseAt' => '看房时间',
            'isBargain' => '1已成交，2未成交',
            'agentAt' => '确定时间',
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
    public function getClientServers()
    {
        return $this->hasMany(ClientServer::tableNameSuffix(), ['client_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getTakeOrders()
    {
        return $this->hasMany(TakeOrder::tableNameSuffix(), ['client_id' => 'id']);
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getWalks()
    {
        return $this->hasMany(Walk::tableNameSuffix(), ['client_id' => 'id']);
    }
}