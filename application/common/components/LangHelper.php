<?php

namespace app\common\components;


/**
 * Class LangHelper
 * @package app\common\components
 */
class LangHelper
{
    /**
     * 单例容器
     * @var
     */
    private static $_instance;

    /**
     * 单例接口
     * @return \app\common\components\LangHelper
     */
    public static function getInstance()
    {
        if (!self::$_instance) {
            self::$_instance = new static();
        }
        return self::$_instance;
    }

    /**
     * 单例
     * LangHelper constructor.
     */
    private function __construct()
    {

    }

    /**
     * 模型语言包
     * @var array
     */
    private static $data = [
        'auth_assignment' => [],
        'auth_item' => [
            // 权限类别
            'type' => ['1' => '角色', '2' => '路由'],
        ],
        'auth_item_child' => [],
        'auth_rule' => [],
        'back_user' => [
            // 账号类型
            'department' => ['1' => '董事部门', '2' => '经理部门', '3' => '业务员部门'],
        ],
        'back_user_log' => [],
        'ban' => [
            // 禁止类别
            'ban' => ['1' => '允许', '2' => '禁止'],
        ],
        'building_base' => [],
        'building_content' => [],
        'building_detail' => [
            // 楼盘类型
            'type' => [
                '1' => '住宅',
                '2' => '公寓',
                '3' => '商铺',
                '4' => '酒店',
                '5' => '酒店式公寓',
                '6' => '别墅',
                '7' => '海景房',
                '8' => '景观房',
                '9' => '写字楼',
            ],
            // 楼盘特色
            'feature' => [
                '1' => '特色别墅',
                '2' => '养老居所',
                '3' => '高档小区',
                '4' => '景观居所',
                '5' => '宜居生态',
                '6' => '花园洋房',
                '7' => '投资地产',
                '8' => '创意地产',
                '9' => '水景地产',
                '10' => '低密居住',
            ],
            // 装修情况
            'decoration' => [
                '1' => '毛坯',
                '2' => '简易装修',
                '3' => '中档装修',
                '4' => '精装修',
            ],
            // 建筑形式
            'buildingType' => [
                '1' => '底层',
                '2' => '多层',
                '3' => '小高层',
                '4' => '高层',
            ],
            // 权重设置
            'weight' => [
                '1' => '热销',
                '2' => '优惠',
                '3' => '最新',
                '4' => '置顶',
                '5' => '推荐',
            ],
            // 销售状态
            'saleStatus' => [
                '1' => '待售',
                '2' => '预售',
                '3' => '在售',
                '4' => '尾售',
                '5' => '已售完',
                '6' => '停售',
            ],
            // 房型
            'chamber' => [
                '1' => '一室',
                '2' => '一室',
                '3' => '三室',
                '4' => '四室',
                '5' => '五室',
                '6' => '五室以上',
            ],
            // 总价范围
            'priceSumType' => [
                '1' => '30万以下',
                '2' => '30-50万',
                '3' => '50-80万',
                '4' => '80-120万',
                '5' => '120-160万',
                '6' => '160-200万',
                '7' => '200-300万',
                '8' => '300-500万',
                '9' => '500-1000万',
                '10' => '1000万以上',
            ],
            // 总价
            'priceSum' => [
                '1' => '30万以下',
                '2' => '30-50万',
                '3' => '50-80万',
                '4' => '80-120万',
                '5' => '120-160万',
                '6' => '160-200万',
                '7' => '200-300万',
                '8' => '300-500万',
                '9' => '500-1000万',
                '10' => '1000万以上',
            ],
            // 均价
            'priceAvg' => [
                '1' => '4000元以下',
                '2' => '4000-6000元',
                '3' => '6000-8000元',
                '4' => '8000-1万',
                '5' => '1-1.2万',
                '6' => '1.2-1.5万',
                '7' => '1.5-2万',
                '8' => '2-3万',
                '9' => '3万以上',
            ],
            // 状态/现房期房
            'status' => [
                '1' => '期房',
                '2' => '准现房',
                '3' => '现房',
                '4' => '成熟小区',
            ],
        ],
        'city' => [
            // 地区级别
            'level' => ['1' => '省级', '2' => '市级', '3' => '区级'],
        ],
        'client' => [
            // 类型
            'type' => ['1' => '过客', '2' => '客户'],
            // 姓别
            'sex' => ['1' => '女', '2' => '男'],
            // 客户来源
            'clientFrom' => [
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
                '23' => '其他',
            ],
            // 需求类别
            'requireType' => ['1' => '新房', '2' => '二手房', '3' => '综合投资',],
            // 接洽方式
            'askType' => [
                '1' => '网络',
                '2' => '来电',
                '3' => '去电',
                '4' => '来访',
                '5' => '短信',
                '6' => '其他',
            ],
            // 置业目的
            'buyPurpose' => [
                '1' => '居住',
                '2' => '养老',
                '3' => '休闲度假 ',
                '4' => '投资',
                '0' => '其他',
            ],
            // 客户等级
            'clientLevel' => [
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
            ],
            // 服务状态
            'serviceStatus' => [
                '1' => '已接洽,待回访',
                '2' => '已回访,待确定是否看房',
                '3' => '已确定看房,待地接',
                '4' => '已取消看房',
                '5' => '已接待,未看房',
                '6' => '已看房,未购买',
                '7' => '已购房,未反馈',
                '8' => '购房服务成功结束',
            ],
        ],
        'client_server' => [],
        'config' => [],
        'contact' => [],
        'contact_read' => [],
        'customer_service' => [],
        'delete_log' => [],
        'department' => [
            // 部门等级
            'level' => ['1' => '董事部门', '2' => '经理部门', '3' => '业务员部门'],
        ],
        'download' => [],
        'home_user' => [
            // 账号类别
            'type' => ['1' => '普通用户', '2' => '成交用户', '3' => '贵宾用户'],
            // 注册方式
            'reg_type' => ['1' => '手机', '2' => '电脑', '3' => '平板'],
        ],
        'home_user_log' => [],
        'hot' => [],
        'house_better' => [],
        'house_host' => [],
        'house_host_server' => [],
        'images' => [
            // 图片所属类别
            'type' => ['1' => '楼盘', '2' => '新房', '3' => '二手房', '4' => '家装'],
        ],
        'label' => [
            // 标签所属类别
            'type' => ['1' => '预定', '2' => '客户', '3' => '房东', '4' => '新房', '5' => '二手房', '6' => '楼盘', '7' => '客服'],
        ],
        'label_park' => [],
        'menu' => [],
        'new_house' => [],
        'notice' => [
            // 状态
            'pass' => ['1' => '待审核', '2' => '已通过', '3' => '未通过', '4' => '保存', '5' => '已推送'],
            // 是否已读
            'read' => ['1' => '未读', '2' => '已读'],
        ],
        'notice_read' => [],
        'on_links' => [],
        'opinion' => [
            // 是否已读
            'read' => ['1' => '未读', '2' => '已读'],
        ],
        'opinion_read' => [],
        'region' => [],
        'second_hand_house' => [],
        'session' => [],
        'slider' => [],
        'take_order' => [],
        'type' => [
            // 类型所属类别
            'type' => ['1' => '预定', '2' => '客户', '3' => '房东', '4' => '新房', '5' => '二手房', '6' => '楼盘', '7' => '客服'],
        ],
        'type_park' => [
            // 类型所属类别
            'type' => ['1' => '预定', '2' => '客户', '3' => '房东', '4' => '新房', '5' => '二手房', '6' => '楼盘', '7' => '客服'],
        ],
        'upload' => [],
        'user_login_log' => [
            'app' => ['1' => '后台账户', '2' => '前端用户'],
        ],
        'walk' => [],
    ];

    /**
     * 排序语言包
     * @var array
     */
    private static $order = [
        // 月
        'mouth' => [
            '1' => '本月',
            '2' => '下月',
            '3' => '三月内',
            '4' => '六月内',
            '5' => '前三月',
            '6' => '前六月',
        ],
        // 周
        'week' => [
            '1' => '本周',
            '2' => '下周',
            '3' => '三周内',
        ],
        // 天
        'day' => [
            '1' => '今日',
            '2' => '明天',
            '3' => '后天',
            '4' => '五天以内',
            '5' => '一周以内',
        ],
    ];

    /**
     * @param null $table
     * @return array
     */
    public function get($table = null)
    {
        $ret = [];
        if (is_string($table) && $table != '') {
            $ret = isset(self::$data[$table]) ? self::$data[$table] : [];
            if (!is_array($ret)) {
                $ret = [];
            }
        }
        return $ret;
    }

    /**
     * @param null $table
     * @param null $field
     * @return array
     */
    public function getField($table = null, $field = null)
    {
        $ret = [];
        if (is_string($table) && $table != '' && is_string($field) && $field != '') {
            $ret = isset(self::$data[$table][$field]) ? self::$data[$table][$field] : [];
            if (!is_array($ret)) {
                $ret = [];
            }
        }
        return $ret;
    }

    /**
     * @param null $table
     * @param null $field
     * @param null $key
     * @return string
     */
    public function getValue($table = null, $field = null, $key = null)
    {
        $ret = '';
        $key = (string)($key);
        if (is_string($table) && $table != '' && is_string($field) && $field != '' && is_string($key) && $key != '') {
            $ret = isset(self::$data[$table][$field][$key]) ? self::$data[$table][$field][$key] : '';
            if (!is_string($ret)) {
                $ret = '';
            }
        }
        return $ret;
    }


    /**
     * @param null $type
     * @return array
     */
    public function getOrder($type = null)
    {
        $ret = [];
        if (is_string($type) && $type != '') {
            $ret = isset(self::$order[$type]) ? self::$order[$type] : [];
            if (!is_array($ret)) {
                $ret = [];
            }
        }
        return $ret;
    }

}
