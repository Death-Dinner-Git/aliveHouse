<?php

class GetAction extends FenxiaoAction
{
    // 全部数据
    private $data = [
        // 需求类别
        'requireType' => [
            '1' => '新房',
            '2' => '二手房',
            '3' => '综合投资',
        ],
        // 是否来过海南
        'inHainan' => [
            '1' => '是',
            '0' => '否',
            '3' => '未知',
        ],
        // 报备状态
        'baobeiStatus' => [
            '1' => "无效客户",
            '2' => "报备客户",
            '3' => "初步确认，可带看",
            '4' => "发起约看",
            '5' => "确认带看",
            '6' => "成交客户",
            '7' => "确认成交",
            '9' => "退房客户",
            '10' => "带看无效"
        ],
        // 接洽方式
        'askType' => [
            '2' => '网络',
            '4' => '来电',
            '6' => '去电',
            '3' => '来访',
            '11' => '短信',
            '5' => '其他',
        ],
        // 客服回访类别
        'serviceAskType' => [
            '1' => '客户异常',
            '2' => '例行回访',
            '6' => '出车回访',
            '7' => '成交回访',
            '8' => '退房',
            '9' => '冲突客户回访',
            '5' => '其他',
        ],
        // 客户等级
        'clientLevel' => [
            '3' => '重要客户',
            '2' => '近期看房',
            '1' => '暂未确定',
            '5' => '看房客户',
            '6' => '成交客户',
            '7' => '退房客户',
            '4' => '放弃客户',
            '11'=>'A级',
            '12'=>'B级',
            '13'=>'C级',
            '14'=>'D级'
        ],
        // 联动部客户等级
        'clientLevelM' => [
            '6' => '成交客户',
            '11' => 'A级',
            '12' => 'B级',
            '13' => 'C级',
            '14' => 'D级',
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
        // 置业目的
        'buyPurpose' => [
            '1' => '居住',
            '2' => '养老',
            '3' => '休闲度假 ',
            '4' => '投资',
            '0' => '其他',
        ],
        // 物业类型
        'feature' => [
            '1' => '住宅',
            '2' => '公寓',
            '3' => '海景房',
            '4' => '别墅',
            '5' => '酒店式公寓',
            '6' => '产权式酒店',
            '7' => '写字楼',
            '8' => '商铺',
        ],
        // 预算总价
        'totalPrice' => [
            '1' => '30万元以下',
            '2' => '30-50万元',
            '3' => '50-80万元',
            '4' => '80-120万元',
            '5' => '120-160万元',
            '6' => '160-200万元',
            '7' => '200-300万元',
            '8' => '300万元以上',],
        // 预算单价
        'unitPrice' => [
            '1' => '5000元/㎡以下',
            '2' => '5000-8000元/㎡',
            '3' => '8000-1万元/㎡',
            '4' => '1万-1.2万元/㎡',
            '5' => '1.2万-1.5万元/㎡',
            '6' => '1.5万-2万元/㎡',
            '7' => '2万以上/㎡',
        ],
        // 置业面积
        'budgetArea' => [
            '1' => '50㎡以内',
            '2' => '50-80㎡',
            '3' => '80-120㎡',
            '4' => '120-160㎡',
            '5' => '160-200㎡',
            '6' => '200㎡以上',
        ],
        // 装修状况
        'decoration' => [
            '1' => '毛坯',
            '2' => '简易装修',
            '3' => '中档装修',
            '4' => '精装修',
        ],
        // 推荐楼盘类别
        'buildingRecommend' => [
            '1' => '用户意向',
            '2' => '系统推荐',
            '3' => '置业顾问',
        ],
        // 欲看楼盘看房状态
        'buildingSeeStatus' => [
            '4' => '安排看房',
            '1' => '未看房',
            '2' => '已看房,未成交',
            '3' => '已成交',
        ],
        // 来琼方式
        'wayHainan' => [
            '1' => '飞机',
            '2' => '火车',
            '3' => '大巴',
            '4' => '不详',
        ],
        // 票务安排
        'ticket' => [
            '1' => '我司代订',
            '2' => '自订',
            '3' => '不详',
        ],
        // 看房状态 //出车用途
        'seeStatus' => [
            8 => '客户看房',
            9 => '客户自驾',
            10 => '踩盘用车',
            11 => '客户售后',
            12 => '接机',
            13 => '送客机场',
            14 => '送客火车站',
            15 => '接客火车站',
        ],
        // 用车 - 目的类型
        'aimType' => [
            '1' => '市区',
            '2' => '机场',
            '3' => '酒店',
            '4' => '楼盘',
            '5' => '其他',
        ],
        // 出车状态
        'outCarStatus' => [
            '5' => '待出车',
            '6' => '正在预约',
            '7' => '正在出车',
            '8' => '出车完毕',
            '4' => '取消出车',
        ],
        // 付款方式
        'payWay' => [
            '1' => '一次性',
            '2' => '按揭',
            '3' => '分期付款',
        ],
        // 售后需求
        'afterService' => [
            '1' => '委托装修设计',
            '2' => '委托出租',
            '3' => '委托出售',
            '4' => '托管保养',
            '5' => '搬家入住',
            '6' => '户口入户',
            '7' => '法律顾问',
            '8' => '购车服务',
            '9' => '租车服务',
            '10' => '接机/订机票/酒店',
            '11' => '旅游咨询/旅游接待',
        ],
        // 代理商参数
        'joinState' => [
            1 => "非合作代理",
            2 => "暂未确定",
            3 => "合作代理",
        ],
        // 客户状态
        'agentStatus' => [
            1 => "已推荐,有成交",
            2 => "已推荐,未成交",
            3 => "暂未成交",
        ],
        // 签约状态
        'agreement' => [
            1 => "未签定",
            2 => "已签定",
        ],
        // 银行
        'card' => [
            1 => "交通银行",
            2 => "工商银行",
            3 => "建设银行",
            4 => "农业银行",
            5 => "中国银行",
            6 => "深圳发展银行",
            7 => "民生银行",
            20 => "其他",
        ],
        // 代理商后台回访类型
        'agentVisit' => [
            2 => '催办佣金',
            3 => '物料支持',
            4 => '项目推送',
            5 => '拜访邀约',
            6 => '投诉建议',
            7 => '确认申诉',
            8 => '当天客户到访',
            9 => '推盘',
            10 => '情感维护',
            11 => '预约上门',
            12 => '要事沟通',
            1 => '其他',
        ],
    ];

    public function _initialize()
    {
//        parent::_initialize();
    }

    /**
     * @description 全部数据
     * @return array
     */
    public function all()
    {
        return $this->data;
    }

    /**
     * @description 客户来源
     * @param null $type
     * @return array
     */
    public function clientFrom($type = null)
    {
        $ret = [];
        // 分销
        $ret[1] = [
            '11' => '我房400',
            '7' => '我房商桥',
            '9' => '我房互动',
            '22' => '房盟400',
            '23' => '房盟商桥',
            '24' => '房盟互动',
            '33' => '搜房发帖',
            '34' => '安居客发帖',
            '20' => '站外发帖',
            '29' => '我房发帖',
            '3' => '朋友介绍',
            '4' => '客户转介绍',
            '15' => '售楼处',
            '6' => '房展会',
            '8' => '户外宣传',
            '12' => '短信促销',
            '21' => '二手房',
            '1' => '我房网',
            '26' => '我房问答',
            '27' => '一号通来电',
            '28' => '高铁站',
            35 => '机场站',
            36 => '机场站',
            '37' => '58发帖',
            '30' => '高铁外',
            '32' => '百度寻客',
            '19' => '其他'
        ];
        // 渠道
        $ret[2] = [
            '10' => '二级代理',
            '3' => '朋友介绍',
            '16' => '看房游',
            '17' => '渠道活动',
            '18' => '自主开发',
            '33' => '搜房发帖',
            '34' => '安居客发帖',
            '20' => '站外发帖',
            '29' => '我房发帖',
            '21' => '二手房'
        ];
        // 案场
        $ret[3] = [
            '10' => '二级代理',
            '15' => '售楼处',
            '25' => '售楼处来电',
            '11' => '我房400',
            '22' => '房盟400',
            '3' => '朋友介绍',
            '4' => '客户转介绍',
            '8' => '户外宣传',
            '7' => '我房商桥',
            '9' => '我房互动',
            '23' => '房盟商桥',
            '24' => '房盟互动',
            '6' => '房展会',
            '33' => '搜房发帖',
            '34' => '安居客发帖',
            '12' => '短信促销',
            '20' => '站外发帖',
            '29' => '我房发帖',
            '1' => '我房网',
            '27' => '一号通来电',
            '31' => '甲方客户',
            '19' => '其他'
        ];

        // 所有
        $ret[0] = array_merge($ret[1], $ret[2], $ret[3]);

        if (isset($ret[$type])) {
            $ret = $ret[$type];
        }else{
            $ret = $ret[0];
        }

        return $ret;
    }

    /**
     * @description 需求类别
     * @return array
     */
    public function requireType()
    {
        return $this->data['requireType'];
    }

    /**
     * @description 是否来过海南
     * @return array
     */
    public function inHainan()
    {
        return $this->data['inHainan'];
    }

    /**
     * @description 省份
     * @return array
     */
    public function province()
    {
        $ret = [];

        $model = M("City");// 城市
        $where['level'] = '1';
        $list = $model->where($where)->getField('id,name');

        if (!empty($list)) {
            foreach ($list as $key =>$value) {
                $ret[] = ['id' => $key, 'name' => $value];
            }
        }

        return $ret;
    }

    /**
     * @description 城市
     * @param null $pid
     * @return array
     */
    public function city($pid = null)
    {
        $ret = [];

        if ($pid === null || !is_numeric($pid)) {
            $pid = '4';
        }

        $model = M("City");// 城市
        $where['pid'] = $pid;
        $list = $model->where($where)->getField('id,name');

        if (!empty($list)) {
            foreach ($list as $key =>$value) {
                $ret[] = ['id' => $key, 'name' => $value];
            }
        }
        return $ret;
    }

    /**
     * @description 编辑人员
     * @param null $key
     * @return array
     */
    public function roleUser($key = null)
    {
        $ret = [];

        if ($key !== null && is_numeric($key)) {
            $where['id'] = $key;
        }
        $model = M('RoleUser');
        $where['status'] = '5';
        $where['roleId'] = ['in', ['1', '3']];
        $list = $model->where($where)->getField('id,trueName');

        if (!empty($list)) {
            foreach ($list as $key =>$value) {
                $ret[] = ['id' => $key, 'name' => $value];
            }
        }

        return $ret;
    }

    /**
     * @description  分销客服
     * @param null $key
     * @return array
     */
    public function fenxiaoKefu($key = null)
    {
        $ret = [];

        if ($key !== null && is_numeric($key)) {
            $where['id'] = $key;
        }
        $model = M('RoleUser');
        $where['status'] = '5';
        $where['roleId'] = '';
        $list = M('RoleUser')->where('status=5 and roleId=6')->select();
        $list = $model->where($where)->getField('id,trueName');

        if (!empty($list)) {
            foreach ($list as $key =>$value) {
                $ret[] = ['id' => $key, 'name' => $value];
            }
        }

        return $ret;
    }

    /**
     * @description 接洽方式
     * @return array
     */
    public function askType()
    {
        return $this->data['askType'];
    }

    /**
     * @description 客服回访类别
     * @return array
     */
    public function serviceAskType()
    {
        return $this->data['serviceAskType'];
    }

    /**
     * @description 客户等级
     * @return array
     */
    public function clientLevel()
    {
        return $this->data['clientLevel'];
    }

    /**
     * @description 联动部客户等级
     * @return array
     */
    public function clientLevelM()
    {
        return $this->data['clientLevelM'];
    }

    /**
     * @description 服务状态
     * @return array
     */
    public function serviceStatus()
    {
        return $this->data['serviceStatus'];
    }

    /**
     * @description 置业目的
     * @return array
     */
    public function buyPurpose()
    {
        return $this->data['buyPurpose'];
    }

    /**
     * @description 物业类型
     * @return array
     */
    public function feature()
    {
        return $this->data['feature'];
    }

    /**
     * @description 预算总价
     * @return array
     */
    public function totalPrice()
    {
        return $this->data['totalPrice'];
    }

    /**
     * @description 预算单价
     * @return array
     */
    public function unitPrice()
    {
        return $this->data['unitPrice'];
    }

    /**
     * @description 置业面积
     * @return array
     */
    public function budgetArea()
    {
        return $this->data['budgetArea'];
    }

    /**
     * @description 装修状况
     * @return array
     */
    public function decoration()
    {
        return $this->data['decoration'];
    }

    /**
     * @description 推荐楼盘类别
     * @return array
     */
    public function buildingRecommend()
    {
        return $this->data['buildingRecommend'];
    }

    /**
     * @description 欲看楼盘看房状态
     * @return array
     */
    public function buildingSeeStatus()
    {
        return $this->data['buildingSeeStatus'];
    }

    /**
     * @description 来琼方式
     * @return array
     */
    public function wayHainan()
    {
        return $this->data['wayHainan'];
    }

    /**
     * @description 票务安排
     * @return array
     */
    public function ticket()
    {
        return $this->data['ticket'];
    }

    /**
     * @description 看房状态
     * @return array
     */
    public function seeStatus()
    {
        return $this->data['seeStatus'];
    }

    /**
     * @description 用车 - 目的类型
     * @return array
     */
    public function aimType()
    {
        return $this->data['aimType'];
    }

    /**
     * @description 出车状态
     * @return array
     */
    public function outCarStatus()
    {
        return $this->data['outCarStatus'];
    }

    /**
     * @description 付款方式
     * @return array
     */
    public function payWay()
    {
        return $this->data['payWay'];
    }

    /**
     * @description 售后需求
     * @return array
     */
    public function afterService()
    {
        return $this->data['afterService'];
    }

    /**
     * @description 代理商参数
     * @return array
     */
    public function joinState()
    {
        return $this->data['joinState'];
    }

    /**
     * @description 客户状态
     * @return array
     */
    public function agentStatus()
    {
        return $this->data['agentStatus'];
    }

    /**
     * @description 签约状态
     * @return array
     */
    public function agreement()
    {
        return $this->data['agreement'];
    }

    /**
     * @description 银行
     * @return array
     */
    public function card()
    {
        return $this->data['card'];
    }

    /**
     * @description 代理商后台回访类型
     * @return array
     */
    public function agentVisit()
    {
        return $this->data['agentVisit'];
    }

}

?>