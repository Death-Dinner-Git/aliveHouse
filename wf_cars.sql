-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2017-05-18 11:50:55
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wf_cars`
--

-- --------------------------------------------------------

--
-- 表的结构 `wf_base_user`
--

CREATE TABLE IF NOT EXISTS `wf_base_user` (
  `id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1',
  `remark` longtext,
  `update_time` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `VERSION_NUM` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_base`
--

CREATE TABLE IF NOT EXISTS `wf_building_base` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `address` varchar(255) NOT NULL COMMENT '楼盘地址',
  `lat` varchar(255) NOT NULL COMMENT '经度(百度地图)',
  `lng` varchar(255) NOT NULL COMMENT '纬度(百度地图)',
  `name` varchar(255) NOT NULL COMMENT '楼盘名',
  `wofang_id` int(11) DEFAULT NULL COMMENT '我房网第三方Id',
  `city_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_car`
--

CREATE TABLE IF NOT EXISTS `wf_car` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `SIM` varchar(255) DEFAULT NULL COMMENT 'SIM标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `car_type` varchar(255) NOT NULL COMMENT '车型',
  `lat` varchar(255) NOT NULL COMMENT '经度(百度地图)',
  `latlng_update_time` datetime NOT NULL COMMENT '经纬度最后一次更新时间',
  `lng` varchar(255) NOT NULL COMMENT '纬度(百度地图)',
  `number_plate` varchar(255) NOT NULL COMMENT '车牌号',
  `seat_num` int(11) NOT NULL COMMENT '座位数',
  `city_id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL COMMENT '地址',
  `orientation_angle` float DEFAULT NULL COMMENT '方向角，车辆朝向'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_city`
--

CREATE TABLE IF NOT EXISTS `wf_city` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) NOT NULL COMMENT '城市名称',
  `num_price` decimal(19,2) DEFAULT NULL COMMENT '每次单价',
  `sort` int(11) NOT NULL COMMENT '排序',
  `time_price` decimal(19,2) DEFAULT NULL COMMENT '每小时单价',
  `wofang_id` int(11) DEFAULT NULL COMMENT '我房网第三方Id',
  `pid` int(11) DEFAULT NULL COMMENT '上级城市'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_config`
--

CREATE TABLE IF NOT EXISTS `wf_config` (
  `id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) DEFAULT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_department`
--

CREATE TABLE IF NOT EXISTS `wf_department` (
  `id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1',
  `remark` longtext,
  `update_time` datetime NOT NULL,
  `isGroup` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `orders` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `wofang_id` int(11) DEFAULT NULL COMMENT '我房网第三方Id',
  `lat` varchar(255) DEFAULT NULL COMMENT '经度(百度地图)',
  `lng` varchar(255) DEFAULT NULL COMMENT '纬度(百度地图)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_driver`
--

CREATE TABLE IF NOT EXISTS `wf_driver` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_delete` int(11) DEFAULT '1' COMMENT '删除标识 默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `head_portrait` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `real_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `rongyun_token` varchar(255) DEFAULT NULL COMMENT '融云token',
  `sex` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL COMMENT '用户 APP端专用token UUID随机字符',
  `base_user_id` bigint(20) DEFAULT NULL,
  `driving_license` varchar(255) DEFAULT NULL COMMENT '驾照类型',
  `level` int(11) DEFAULT '5' COMMENT '司机评价级别，默认等级5',
  `car_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `orderNum` int(11) DEFAULT '0' COMMENT '司机评价级别，默认等级5',
  `status` varchar(255) DEFAULT NULL COMMENT '当前状态',
  `baseId` bigint(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL COMMENT '司机签到时经纬度',
  `mobilephone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临时司机表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_feedback`
--

CREATE TABLE IF NOT EXISTS `wf_feedback` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `level` int(11) NOT NULL COMMENT '评价级别',
  `take_car_order_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_gps`
--

CREATE TABLE IF NOT EXISTS `wf_gps` (
  `id` bigint(20) NOT NULL,
  `SIM` varchar(255) NOT NULL COMMENT 'SIM标识',
  `alarm_flag` varchar(255) DEFAULT NULL COMMENT '报警标志',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `lng` varchar(255) DEFAULT NULL COMMENT '纬度',
  `lat` varchar(255) DEFAULT NULL COMMENT '经度',
  `high` varchar(255) DEFAULT NULL COMMENT '高度',
  `speed` float DEFAULT NULL COMMENT '速度',
  `orientation` float DEFAULT NULL COMMENT '方向',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` longtext COMMENT '备注字段',
  `is_delete` int(11) DEFAULT '1' COMMENT '删除标识 默认为1',
  `update_time` datetime DEFAULT NULL COMMENT '更新的时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_manager`
--

CREATE TABLE IF NOT EXISTS `wf_manager` (
  `id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1',
  `remark` longtext,
  `update_time` datetime NOT NULL,
  `identification_cards` varchar(255) DEFAULT NULL,
  `manager_type` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `base_user_id` bigint(20) NOT NULL,
  `token` varchar(255) DEFAULT NULL COMMENT '用户 APP端专用token UUID随机字符',
  `wofang_id` int(11) DEFAULT NULL COMMENT '我房网第三方Id',
  `department_id` bigint(20) NOT NULL,
  `head_portrait` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别    0：女 ；/ 1：男',
  `rongyun_token` varchar(255) DEFAULT NULL COMMENT '融云token'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_menu`
--

CREATE TABLE IF NOT EXISTS `wf_menu` (
  `id` int(20) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `type` enum('1','2') DEFAULT '1' COMMENT '菜单类型',
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_notice`
--

CREATE TABLE IF NOT EXISTS `wf_notice` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `app_user_id` bigint(20) DEFAULT NULL,
  `content` longtext COMMENT '内容',
  `readed` int(11) NOT NULL DEFAULT '0' COMMENT '是否阅读  0:未读  1:已读',
  `title` varchar(255) DEFAULT NULL COMMENT '通知标题'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知';

-- --------------------------------------------------------

--
-- 表的结构 `wf_opinion`
--

CREATE TABLE IF NOT EXISTS `wf_opinion` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `base_id` bigint(20) DEFAULT NULL COMMENT '反馈者的baseId',
  `content` longtext COMMENT '内容',
  `readed` int(11) NOT NULL DEFAULT '0' COMMENT '是否阅读  0:未读  1:已读',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '是否阅读  0:司机 1:销售顾问'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_out_car`
--

CREATE TABLE IF NOT EXISTS `wf_out_car` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `customer_num` int(11) DEFAULT NULL COMMENT '客户人数',
  `oil_cost` varchar(255) DEFAULT NULL COMMENT '加油费用',
  `out_car_time` datetime NOT NULL COMMENT '出车时间',
  `request_id` int(11) DEFAULT NULL COMMENT '派车要求id',
  `sign_time` datetime DEFAULT NULL COMMENT '签到时间',
  `used_id` int(11) DEFAULT NULL COMMENT '派车用途id',
  `wofang_id` int(11) DEFAULT NULL COMMENT '我房网第三方Id',
  `build_id` bigint(20) DEFAULT NULL,
  `end_city_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `start_city_id` bigint(20) DEFAULT NULL,
  `take_car_order_id` bigint(20) DEFAULT NULL,
  `back_mileage` float DEFAULT NULL COMMENT '返程行驶公里数',
  `from_mileage` float DEFAULT NULL COMMENT '去程行驶公里数',
  `back_date` datetime DEFAULT NULL COMMENT '还车时间',
  `back_org_date` datetime DEFAULT NULL COMMENT '还车时间',
  `back_org_mileage` float DEFAULT NULL COMMENT '回公司公里数',
  `other_money` decimal(19,2) DEFAULT NULL COMMENT '其他费用',
  `sum_money` decimal(19,2) DEFAULT NULL COMMENT '总费用',
  `sign_mileage` float DEFAULT NULL COMMENT '出车公里数',
  `start_address` varchar(255) DEFAULT NULL COMMENT '始发地',
  `start_lat` varchar(255) DEFAULT NULL COMMENT '始发经度(百度地图)',
  `start_lng` varchar(255) DEFAULT NULL COMMENT '始发纬度(百度地图)',
  `driverTime` decimal(19,2) DEFAULT NULL COMMENT '驾驶时间',
  `order_money` decimal(19,2) DEFAULT NULL COMMENT '派车总费用',
  `pre_outCar_id` bigint(20) DEFAULT NULL COMMENT '上一个派车单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出车表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_regionprice`
--

CREATE TABLE IF NOT EXISTS `wf_regionprice` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `num_price` decimal(19,2) DEFAULT NULL COMMENT '接单价',
  `time_price` decimal(19,2) DEFAULT NULL COMMENT '每小时单价',
  `city_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域时费表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_repair_car`
--

CREATE TABLE IF NOT EXISTS `wf_repair_car` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `end_time` datetime NOT NULL COMMENT '维护结束时间',
  `fee` decimal(19,2) DEFAULT NULL COMMENT '维护费用',
  `project` varchar(255) DEFAULT NULL COMMENT '维护项目',
  `reason` longtext COMMENT '维护原因',
  `repairType` varchar(255) NOT NULL COMMENT '维护类型',
  `shop_name` varchar(255) DEFAULT NULL COMMENT '维护店名称',
  `start_time` datetime NOT NULL COMMENT '维护开始时间',
  `car_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `manager_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维护车辆表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_session`
--

CREATE TABLE IF NOT EXISTS `wf_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='session存储表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_take_car_order`
--

CREATE TABLE IF NOT EXISTS `wf_take_car_order` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `booking_time` datetime NOT NULL COMMENT '预约出行时间',
  `driver_mileage` int(11) DEFAULT NULL COMMENT '行驶公里数',
  `driver_time` int(11) DEFAULT NULL COMMENT '行驶分钟数',
  `end_lat` varchar(255) DEFAULT NULL COMMENT '终点经度(百度地图)',
  `end_lng` varchar(255) DEFAULT NULL COMMENT '终点纬度(百度地图)',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `order_status` varchar(255) NOT NULL COMMENT '订单状态',
  `order_type` varchar(255) NOT NULL COMMENT '订单类型',
  `out_car_id` bigint(20) DEFAULT NULL COMMENT '出车单id',
  `out_car_time` datetime DEFAULT NULL COMMENT '下车时间',
  `start_lat` varchar(255) NOT NULL COMMENT '始发经度(百度地图)',
  `start_lng` varchar(255) NOT NULL COMMENT '始发纬度(百度地图)',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `VERSION_NUM` bigint(20) NOT NULL COMMENT '版本号',
  `car_id` bigint(20) DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `feedback_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) NOT NULL,
  `end_address` varchar(255) DEFAULT NULL COMMENT '目的地',
  `order_num` varchar(255) NOT NULL COMMENT '订单编号',
  `start_address` varchar(255) NOT NULL COMMENT '始发地',
  `num_price` decimal(19,2) DEFAULT NULL COMMENT '每次单价',
  `order_money` decimal(19,2) DEFAULT NULL COMMENT '订单总金额',
  `time_price` decimal(19,2) DEFAULT NULL COMMENT '每小时单价',
  `city_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `building_base_id` bigint(20) DEFAULT NULL,
  `salesMileage_mileage` float DEFAULT NULL COMMENT '销售顾问填写公里数',
  `driver_start_mileage` float DEFAULT NULL COMMENT '行驶公里数-开始',
  `customerNum` int(11) DEFAULT NULL COMMENT '人数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打车表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_trajectory`
--

CREATE TABLE IF NOT EXISTS `wf_trajectory` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '1' COMMENT '删除标识  默认值1',
  `remark` longtext COMMENT '备注字段',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `lat` varchar(255) NOT NULL COMMENT '经度(百度地图)',
  `lng` varchar(255) NOT NULL COMMENT '纬度(百度地图)',
  `car_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轨迹表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_user`
--

CREATE TABLE IF NOT EXISTS `wf_user` (
  `id` int(20) NOT NULL COMMENT '自增ID',
  `uid` int(32) DEFAULT NULL COMMENT '会员编号ID',
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `mobile_verified` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '手机号码是否已验证;"0"表示没有验证,"1"表示已验证',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `email_verified` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '邮箱是否已验证;"0"表示没有验证,"1"表示已验证',
  `username` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `head_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `real_name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(2) COLLATE utf8_unicode_ci DEFAULT '男' COMMENT '性别',
  `signature` varchar(30) COLLATE utf8_unicode_ci DEFAULT '什么都没有留下...' COMMENT '个性签名',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `height` int(3) DEFAULT NULL COMMENT '身高/单位CM',
  `weight` int(3) DEFAULT NULL COMMENT '体重/单位KG',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当前token',
  `auth_key` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '自动密匙',
  `password_reset_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '重置密匙',
  `password_reset_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '验证码',
  `score` int(11) unsigned DEFAULT '0' COMMENT '积分',
  `money` int(11) unsigned DEFAULT '0' COMMENT '金额',
  `status` enum('0','1','-1') COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态',
  `ip` text CHARACTER SET utf8 COMMENT '登录IP',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_type` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册方式',
  `registered_at` int(11) unsigned DEFAULT NULL COMMENT '注册时间',
  `logined_at` int(11) unsigned DEFAULT NULL COMMENT '登录时间',
  `updated_at` int(11) unsigned DEFAULT NULL COMMENT '更新信息与时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='前台用户表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wf_base_user`
--
ALTER TABLE `wf_base_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_base`
--
ALTER TABLE `wf_building_base`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_4hpaactld6gcf99wpyt2b48ov` (`city_id`) USING BTREE;

--
-- Indexes for table `wf_car`
--
ALTER TABLE `wf_car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_c1artw0xj3u21eevfasqra42y` (`city_id`) USING BTREE;

--
-- Indexes for table `wf_city`
--
ALTER TABLE `wf_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_config`
--
ALTER TABLE `wf_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `wf_department`
--
ALTER TABLE `wf_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_driver`
--
ALTER TABLE `wf_driver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_feedback`
--
ALTER TABLE `wf_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_6ysq2wd9rusg7i9l1w2smcqli` (`take_car_order_id`) USING BTREE;

--
-- Indexes for table `wf_gps`
--
ALTER TABLE `wf_gps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_manager`
--
ALTER TABLE `wf_manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_bmb4xpgjx4s8ulajdjgnb2hy8` (`token`) USING BTREE,
  ADD UNIQUE KEY `UK_f31xy8pd7drc8x1178tb6wjww` (`rongyun_token`) USING BTREE,
  ADD KEY `FK_4wmivjq41y91odd22sa1bphoa` (`base_user_id`) USING BTREE,
  ADD KEY `FK_kgbkwh4hrhrsn0j2ehgebruic` (`department_id`) USING BTREE;

--
-- Indexes for table `wf_menu`
--
ALTER TABLE `wf_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_notice`
--
ALTER TABLE `wf_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_opinion`
--
ALTER TABLE `wf_opinion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_out_car`
--
ALTER TABLE `wf_out_car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1dsr7y82qdsfsvn16s02ttdsr` (`build_id`) USING BTREE,
  ADD KEY `FK_qleyu1g5rj3pxbfeci8059a3m` (`end_city_id`) USING BTREE,
  ADD KEY `FK_3bate1hrbq2iswt4dhuohtxfn` (`manager_id`) USING BTREE,
  ADD KEY `FK_kxakuhpaglif4ex8vbhl741p4` (`start_city_id`) USING BTREE,
  ADD KEY `FK_7udxiuiudnje5e9h9i2mqkqs5` (`take_car_order_id`) USING BTREE;

--
-- Indexes for table `wf_regionprice`
--
ALTER TABLE `wf_regionprice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_rwclm7i128qolb5dj6ck9o7ty` (`city_id`) USING BTREE;

--
-- Indexes for table `wf_repair_car`
--
ALTER TABLE `wf_repair_car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_kdbew63dr5rwmsqyxbyhfprkj` (`car_id`) USING BTREE,
  ADD KEY `FK_bxc5cr88hf19vgh219x9rgyby` (`city_id`) USING BTREE,
  ADD KEY `FK_hfpfbrtg1sqq87bfr1a2ad92y` (`manager_id`) USING BTREE;

--
-- Indexes for table `wf_session`
--
ALTER TABLE `wf_session`
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `wf_take_car_order`
--
ALTER TABLE `wf_take_car_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ep9jhirl4dyquokfvu1twd27d` (`car_id`) USING BTREE,
  ADD KEY `FK_iuqixnvug1qfswenwa6rlax5g` (`driver_id`) USING BTREE,
  ADD KEY `FK_83u86596gkffbv424wi7a0d53` (`feedback_id`) USING BTREE,
  ADD KEY `FK_jx47sdscnp27gd85cganxyoqa` (`manager_id`) USING BTREE,
  ADD KEY `FK_dcygieopgqdae8x2hb5q3ithf` (`city_id`) USING BTREE,
  ADD KEY `FK_krred6g6y4fjnv6duluqdkk8s` (`department_id`) USING BTREE,
  ADD KEY `FK_ktirg19xxo8fnetd5nq2d80si` (`building_base_id`) USING BTREE;

--
-- Indexes for table `wf_trajectory`
--
ALTER TABLE `wf_trajectory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_eeg8jx3prd5asixwyikdiprdp` (`car_id`) USING BTREE;

--
-- Indexes for table `wf_user`
--
ALTER TABLE `wf_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wf_base_user`
--
ALTER TABLE `wf_base_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_base`
--
ALTER TABLE `wf_building_base`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_car`
--
ALTER TABLE `wf_car`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_city`
--
ALTER TABLE `wf_city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_config`
--
ALTER TABLE `wf_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID';
--
-- AUTO_INCREMENT for table `wf_department`
--
ALTER TABLE `wf_department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_driver`
--
ALTER TABLE `wf_driver`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `wf_feedback`
--
ALTER TABLE `wf_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_gps`
--
ALTER TABLE `wf_gps`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_manager`
--
ALTER TABLE `wf_manager`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_menu`
--
ALTER TABLE `wf_menu`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_notice`
--
ALTER TABLE `wf_notice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_opinion`
--
ALTER TABLE `wf_opinion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_out_car`
--
ALTER TABLE `wf_out_car`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_regionprice`
--
ALTER TABLE `wf_regionprice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_repair_car`
--
ALTER TABLE `wf_repair_car`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_take_car_order`
--
ALTER TABLE `wf_take_car_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_trajectory`
--
ALTER TABLE `wf_trajectory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_user`
--
ALTER TABLE `wf_user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- 限制导出的表
--

--
-- 限制表 `wf_building_base`
--
ALTER TABLE `wf_building_base`
  ADD CONSTRAINT `wf_building_base_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `wf_city` (`id`);

--
-- 限制表 `wf_car`
--
ALTER TABLE `wf_car`
  ADD CONSTRAINT `wf_car_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `wf_city` (`id`);

--
-- 限制表 `wf_feedback`
--
ALTER TABLE `wf_feedback`
  ADD CONSTRAINT `wf_feedback_ibfk_1` FOREIGN KEY (`take_car_order_id`) REFERENCES `wf_take_car_order` (`id`);

--
-- 限制表 `wf_manager`
--
ALTER TABLE `wf_manager`
  ADD CONSTRAINT `wf_manager_ibfk_1` FOREIGN KEY (`base_user_id`) REFERENCES `wf_base_user` (`id`),
  ADD CONSTRAINT `wf_manager_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `wf_department` (`id`);

--
-- 限制表 `wf_out_car`
--
ALTER TABLE `wf_out_car`
  ADD CONSTRAINT `wf_out_car_ibfk_1` FOREIGN KEY (`build_id`) REFERENCES `wf_building_base` (`id`),
  ADD CONSTRAINT `wf_out_car_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `wf_manager` (`id`),
  ADD CONSTRAINT `wf_out_car_ibfk_3` FOREIGN KEY (`take_car_order_id`) REFERENCES `wf_take_car_order` (`id`),
  ADD CONSTRAINT `wf_out_car_ibfk_4` FOREIGN KEY (`start_city_id`) REFERENCES `wf_city` (`id`),
  ADD CONSTRAINT `wf_out_car_ibfk_5` FOREIGN KEY (`end_city_id`) REFERENCES `wf_city` (`id`);

--
-- 限制表 `wf_regionprice`
--
ALTER TABLE `wf_regionprice`
  ADD CONSTRAINT `wf_regionprice_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `wf_city` (`id`);

--
-- 限制表 `wf_repair_car`
--
ALTER TABLE `wf_repair_car`
  ADD CONSTRAINT `wf_repair_car_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `wf_city` (`id`),
  ADD CONSTRAINT `wf_repair_car_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `wf_manager` (`id`),
  ADD CONSTRAINT `wf_repair_car_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `wf_car` (`id`);

--
-- 限制表 `wf_take_car_order`
--
ALTER TABLE `wf_take_car_order`
  ADD CONSTRAINT `wf_take_car_order_ibfk_1` FOREIGN KEY (`feedback_id`) REFERENCES `wf_feedback` (`id`),
  ADD CONSTRAINT `wf_take_car_order_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `wf_city` (`id`),
  ADD CONSTRAINT `wf_take_car_order_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `wf_car` (`id`),
  ADD CONSTRAINT `wf_take_car_order_ibfk_5` FOREIGN KEY (`manager_id`) REFERENCES `wf_manager` (`id`),
  ADD CONSTRAINT `wf_take_car_order_ibfk_6` FOREIGN KEY (`department_id`) REFERENCES `wf_department` (`id`),
  ADD CONSTRAINT `wf_take_car_order_ibfk_7` FOREIGN KEY (`building_base_id`) REFERENCES `wf_building_base` (`id`);

--
-- 限制表 `wf_trajectory`
--
ALTER TABLE `wf_trajectory`
  ADD CONSTRAINT `wf_trajectory_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `wf_car` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
