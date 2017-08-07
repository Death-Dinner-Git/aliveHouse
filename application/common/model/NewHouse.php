<?php

namespace app\common\model;

use app\common\model\Model;
use app\common\model\BackUser;
use app\common\model\BuildingBase;
use app\common\model\City;
use app\common\model\ImagesNewHouse;

/**
 * This is the model class for table "hfzy_new_house".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $building_base_id
 * @property string $title
 * @property integer $city_id
 * @property integer $county_id
 * @property string $address
 * @property integer $type
 * @property string $room
 * @property integer $hall
 * @property integer $kitchen
 * @property integer $toilet
 * @property integer $veranda
 * @property string $url
 * @property string $url_icon
 * @property integer $floorsType
 * @property integer $onFloor
 * @property integer $floors
 * @property integer $face
 * @property integer $houseType
 * @property integer $fitment
 * @property integer $eachPrice
 * @property integer $price
 * @property integer $years
 * @property integer $area
 * @property string $description
 * @property string $supporting
 * @property string $traffic
 * @property string $around
 * @property string $houseLabel
 * @property integer $isTop
 * @property integer $status
 * @property integer $saleStatus
 * @property string $contact
 * @property string $tel
 * @property string $email
 * @property string $weChat
 * @property string $qq
 * @property integer $created_by
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BuildingBase $buildingBase
 * @property BackUser $createdBy
 */
class NewHouse extends Model
{

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%new_house}}';

    protected $field = [
        'id',
        'is_delete',
        'building_base_id',
        'title',
        'city_id',
        'county_id',
        'address',
        'type',
        'room',
        'hall',
        'kitchen',
        'toilet',
        'veranda',
        'url',
        'url_icon',
        'floorsType',
        'onFloor',
        'floors',
        'face',
        'houseType',
        'fitment',
        'eachPrice',
        'price',
        'years',
        'area',
        'description',
        'supporting',
        'traffic',
        'around',
        'houseLabel',
        'isTop',
        'status',
        'saleStatus',
        'contact',
        'tel',
        'email',
        'weChat',
        'qq',
        'created_by',
        'created_at',
        'updated_at',
    ];

    // 保存自动完成列表
    protected $auto = [];
    // 新增自动完成列表
    protected $insert = [];
    // 更新自动完成列表
    protected $update = [];

    // 卧室
    public $roomList = [
        '1'=>'一',
        '2'=>'二',
        '3'=>'三',
        '4'=>'四',
        '5'=>'五',
        '6'=>'六',
        '7'=>'七',
        '8'=>'八',
        '9'=>'九',
        '10'=>'十',
    ];
    // 大厅
    public $hallList = [
        '1'=>'一',
        '2'=>'二',
        '3'=>'三',
        '4'=>'四',
        '5'=>'五',
    ];
    // 厨房
    public $kitchenList = [
        '1'=>'一',
        '2'=>'二',
        '3'=>'三',
        '4'=>'四',
        '5'=>'五',
    ];
    // 独卫
    public $toiletList = [
        '1'=>'一',
        '2'=>'二',
        '3'=>'三',
        '4'=>'四',
        '5'=>'五',
    ];
    // 阳台
    public $verandaList = [
        '1'=>'一',
        '2'=>'二',
        '3'=>'三',
        '4'=>'四',
        '5'=>'五',
    ];
    // 楼层类型
    public $floorsTypeList = [
        '1'=>'多层',
        '2'=>'高层',
        '3'=>'小高层',
        '4'=>'复式',
        '5'=>'平房',
        '6'=>'别墅',
        '7'=>'跃层',
        '8'=>'公寓',
        '10'=>'其他',
    ];
    // 朝向
    public $faceList = [
        '1'=>'东',
        '2'=>'南',
        '3'=>'西',
        '4'=>'北',
        '5'=>'东北',
        '6'=>'东南',
        '7'=>'西南',
        '8'=>'西北',
    ];
    // 房屋类型
    public $houseTypeList = [
        '1'=>'旅游地产',
        '2'=>'普通住宅',
        '3'=>'写字楼',
        '4'=>'商铺',
        '5'=>'别墅',
        '6'=>'酒店式公寓',
        '7'=>'商住两用',
        '8'=>'公寓',
        '9'=>'其他',
    ];
    // 装修状况
    public $fitmentList = [
        '1'=>'销售状态',
        '2'=>'毛坯',
        '3'=>'简易装修',
        '4'=>'中档装修',
        '5'=>'精装修',
    ];
    // 基础设施
    public $supportingList = [
        '1'=>'空调',
        '2'=>'电视',
        '3'=>'床',
        '4'=>'热水器',
        '5'=>'衣柜',
        '6'=>'冰箱',
        '7'=>'洗衣机',
        '8'=>'电话',
        '9'=>'宽带',
        '10'=>'电梯',
        '11'=>'车位',
        '12'=>'煤气',
        '13'=>'水',
        '14'=>'电',
        '15'=>'厨柜',
        '16'=>'有线电视',
        '17'=>'餐桌',
        '18'=>'书桌',
        '19'=>'煤气炉',
        '20'=>'整体浴室',
    ];
    // 房源标签
    public $houseLabelList = [
        '1'=>'双学区',
        '2'=>'学区房',
        '3'=>'电梯房',
        '4'=>'南北通透',
        '5'=>'满五年',
        '6'=>'满二唯一',
        '7'=>'海景房',
        '8'=>'送露台',
        '9'=>'带花园',
        '10'=>'送车位',
        '11'=>'独家委托',
        '12'=>'高铁附近',
        '13'=>'精装修',
        '14'=>'拎包入住',
        '15'=>'随时看房',
        '16'=>'急售',
        '17'=>'投资首选',
        '18'=>'景观房',
    ];
    // 状态
    public $statusList = [
        '1'=>'设为推荐',
        '2'=>'取消推荐',
        '3'=>'审核通过',
        '4'=>'审核未通过',
    ];
    // 销售状态
    public $saleStatusList = [
        '1'=>'销售中',
        '2'=>'已售完',
        '3'=>'已过期',
    ];

    //房型
    public $chamberList = [
        '1'=>'一室',
        '2'=>'一室',
        '3'=>'三室',
        '4'=>'四室',
        '5'=>'五室',
        '6'=>'五室以上',
    ];
    // 面积
    public $areaList = [
        '1'=>'50㎡以内',
        '2'=>'50-70㎡',
        '3'=>'70-100㎡',
        '4'=>'100-130㎡',
        '5'=>'130-160㎡',
        '6'=>'160-200㎡',
        '7'=>'200㎡以上',
    ];
    // 排序
    public $orderList = [
        '1'=>'价格由低到高',
        '2'=>'价格由高到低',
        '3'=>'面积大到小',
        '4'=>'面积小到大',
    ];
    // 发布时间
    public $createList = [
        '1'=>'一天内',
        '3'=>'三天内',
        '7'=>'一星期内',
        '30'=>'一个月内',
        '32'=>'一个月以上',
    ];
    // 更新时间
    public $updateList = [
        '1'=>'一天内发布',
        '3'=>'三天内发布',
        '7'=>'一个星期内发布',
        '21'=>'三个星期内发布',
        '31'=>'一个月内发布',
        '32'=>'一个月以上发布',
    ];
    // 单价
    public $eachPriceList = [
        '1'=>'2000元/㎡以内',
        '2'=>'2000-4000元/㎡',
        '3'=>'4000-6000元/㎡',
        '4'=>'6000-8000元/㎡',
        '5'=>'8000-10000元/㎡',
        '6'=>'10000-14000元/㎡',
        '7'=>'14000-20000/㎡',
        '8'=>'20000-30000/㎡',
        '9'=>'30000元/㎡以上',
    ];
    // 售价
    public $priceList = [
        '1'=>'50万内',
        '2'=>'50-70万',
        '3'=>'70-100万',
        '4'=>'100-130万',
        '5'=>'130-160万',
        '6'=>'160-200万',
        '7'=>'200万以上',
    ];

    //房源类型
    public static $typeList = [
        '1'=>'新房',
        '2'=>'二手房',
    ];

    public static function getTypeList(){
        return self::$typeList;
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            'rule'=>[
                ['is_delete','in:0,1','时效 无效'],
                ['building_base_id','number',],
                ['type','number',],
                ['room','max:255',],
                ['description','max:255',],
                ['address','max:255',],
                ['url','max:255',],
            ],
            'msg'=>[],
            'data'=>[
                [['is_delete', 'building_base_id', 'city_id', 'county_id', 'type', 'hall', 'kitchen', 'toilet', 'veranda', 'floorsType', 'onFloor', 'floors', 'face', 'houseType', 'fitment', 'eachPrice', 'price', 'years', 'area', 'isTop', 'status', 'saleStatus', 'created_by'], 'integer'],
                [['building_base_id', 'title', 'address', 'room', 'url', 'description', 'created_by', 'created_at', 'updated_at'], 'required'],
                [['description', 'traffic', 'around'], 'string'],
                [['created_at', 'updated_at'], 'safe'],
                [['title', 'address', 'room', 'url', 'url_icon', 'supporting', 'houseLabel', 'contact', 'tel', 'email', 'weChat', 'qq'], 'string', 'max' => 255],
            ],
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
            'building_base_id' => '楼盘表ID',
            'title' => '介绍/标题',
            'city_id' => '城市',
            'county_id' => '区域/县级',
            'address' => '地址',
            'type' => '房源类型;1新房2二手房;默认1;',
            'room' => '房号',
            'hall' => '大厅',
            'kitchen' => '厨房',
            'toilet' => '独卫',
            'veranda' => '阳台',
            'url' => '封面宣传',
            'url_icon' => '缩略图',
            'floorsType' => '所在楼层类型',
            'onFloor' => '位于楼层',
            'floors' => '共计楼层',
            'face' => '房屋朝向',
            'houseType' => '房屋类型',
            'fitment' => '装修情况',
            'eachPrice' => '房屋单价(元/平方米',
            'price' => '售价',
            'years' => '建筑年代',
            'area' => '建筑面积',
            'description' => '详细描述',
            'supporting' => '配套设施',
            'traffic' => '交通状况',
            'around' => '周边环境',
            'houseLabel' => '房源标签',
            'isTop' => '置顶',
            'status' => '状态',
            'saleStatus' => '销售状态',
            'contact' => '联系人',
            'tel' => '手机/固话',
            'email' => '邮箱',
            'weChat' => '微信',
            'qq' => 'QQ',
            'created_by' => '创建者',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getBuildingBase()
    {
        return $this->hasOne(ucfirst(BuildingBase::tableNameSuffix()),'id', 'building_base_id');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getCreatedBy()
    {
        return $this->hasOne(ucfirst(BackUser::tableNameSuffix()),'id', 'created_by');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getCity()
    {
        return $this->hasOne(ucfirst(City::tableNameSuffix()),'id', 'city_id');
    }

    /**
     * @return \think\model\relation\HasOne
     */
    public function getCounty()
    {
        return $this->hasOne(ucfirst(City::tableNameSuffix()),'id', 'county_id');
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function getImages()
    {
        return $this->hasMany(ucfirst(ImagesNewHouse::tableNameSuffix()), 'target_id', 'id');
    }
}
