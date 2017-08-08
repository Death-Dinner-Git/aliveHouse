-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2017-08-08 19:01:17
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `haofangzhiye`
--

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `hfzy_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类权限等级',
  `user_id` bigint(20) NOT NULL COMMENT '分配对象UID',
  `created_at` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_auth_item`
--

CREATE TABLE IF NOT EXISTS `hfzy_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限名',
  `type` tinyint(1) NOT NULL COMMENT '类型',
  `description` text COLLATE utf8_unicode_ci COMMENT '权限描述',
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '使用规则',
  `data` text COLLATE utf8_unicode_ci COMMENT '补充说明',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `hfzy_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限上级',
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限下级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限上下级关系';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_auth_rule`
--

CREATE TABLE IF NOT EXISTS `hfzy_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '规则名',
  `data` text COLLATE utf8_unicode_ci COMMENT '规则位置',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_back_user`
--

CREATE TABLE IF NOT EXISTS `hfzy_back_user` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员编号ID',
  `department_id` bigint(20) DEFAULT NULL COMMENT '部门表ID',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `phone_verified` tinyint(1) DEFAULT '0' COMMENT '手机号码是否已验证;"0"表示没有验证,"1"表示已验证',
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `email_verified` tinyint(1) DEFAULT '0' COMMENT '邮箱是否已验证;"0"表示没有验证,"1"表示已验证',
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `head_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `sex` enum('男','女') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `signature` varchar(32) COLLATE utf8_unicode_ci DEFAULT '什么都没有留下...' COMMENT '个性签名',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `height` int(3) DEFAULT NULL COMMENT '身高/单位CM',
  `weight` int(3) DEFAULT NULL COMMENT '体重/单位KG',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当前token',
  `md5` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密匙',
  `auth_key` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '自动密匙',
  `password_reset_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '重置密匙',
  `password_reset_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '验证码',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态;0:正常,1:异常;2:禁用;',
  `ip` text CHARACTER SET utf8 COMMENT '登录IP',
  `reg_ip` varchar(32) CHARACTER SET utf8 DEFAULT '0.0.0.0' COMMENT '注册IP',
  `reg_type` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册方式',
  `registered_at` datetime DEFAULT NULL COMMENT '注册时间',
  `logined_at` datetime DEFAULT NULL COMMENT '登录时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='前台用户表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_back_user_log`
--

CREATE TABLE IF NOT EXISTS `hfzy_back_user_log` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `back_user_id` bigint(20) NOT NULL COMMENT '表user主键',
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '路由',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户端',
  `gets` text COLLATE utf8_unicode_ci COMMENT 'GET方法',
  `posts` text COLLATE utf8_unicode_ci COMMENT 'POST方法',
  `target` text CHARACTER SET utf8 COMMENT '目标',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台访问记录';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_ban`
--

CREATE TABLE IF NOT EXISTS `hfzy_ban` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `back_user_id` bigint(20) NOT NULL COMMENT 'UID',
  `ban` tinyint(1) unsigned DEFAULT '0' COMMENT '类型;0=允许;1=禁止;',
  `created_at` datetime NOT NULL COMMENT '变更时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_building_base`
--

CREATE TABLE IF NOT EXISTS `hfzy_building_base` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `title` varchar(255) NOT NULL COMMENT '楼盘名',
  `titlePinyin` varchar(255) DEFAULT NULL COMMENT '楼盘名称拼音',
  `city_id` bigint(20) NOT NULL COMMENT '城市表ID',
  `county_id` bigint(20) DEFAULT NULL COMMENT '区县ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_building_content`
--

CREATE TABLE IF NOT EXISTS `hfzy_building_content` (
  `building_base_id` bigint(20) NOT NULL COMMENT '楼盘ID',
  `content` text COMMENT '楼盘介绍'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘介绍表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_building_detail`
--

CREATE TABLE IF NOT EXISTS `hfzy_building_detail` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `building_base_id` bigint(20) NOT NULL COMMENT '楼盘表ID',
  `description` varchar(255) DEFAULT NULL COMMENT '详细描述',
  `reason` varchar(255) DEFAULT NULL COMMENT '推荐理由',
  `feature` varchar(150) DEFAULT NULL COMMENT '楼盘特色',
  `featureExtra` varchar(150) DEFAULT NULL COMMENT '其他楼盘特色',
  `decoration` varchar(150) DEFAULT NULL COMMENT '装修情况',
  `decorationExtra` varchar(150) DEFAULT NULL COMMENT '其他装修情况',
  `saleStatus` varchar(150) DEFAULT NULL COMMENT '销售状态',
  `priceMin` int(7) unsigned DEFAULT NULL COMMENT '楼盘起价',
  `priceMax` int(7) unsigned DEFAULT NULL COMMENT '楼盘最高价',
  `priceAvg` int(7) unsigned DEFAULT NULL COMMENT '楼盘均价',
  `priceSum` varchar(150) DEFAULT NULL COMMENT '单套总价',
  `priceSumType` varchar(150) DEFAULT NULL COMMENT '单套总价范围',
  `status` varchar(150) DEFAULT NULL COMMENT '现房期房',
  `buildingType` varchar(150) DEFAULT NULL COMMENT '建筑形式',
  `buildingTypeExtra` varchar(150) DEFAULT NULL COMMENT '其他建筑形式',
  `buildingArea` float(11,0) DEFAULT NULL COMMENT '占地面积',
  `houseArea` float(11,0) DEFAULT NULL COMMENT '建筑面积',
  `areaMax` int(20) DEFAULT NULL COMMENT '单套最大面积',
  `areaMin` int(20) DEFAULT NULL COMMENT '单套最小面积',
  `buildingNum` int(11) DEFAULT '0' COMMENT '总栋数',
  `houseNum` int(11) DEFAULT '0' COMMENT '总套数',
  `parkingNum` int(11) DEFAULT '0' COMMENT '停车位',
  `started_at` datetime DEFAULT NULL COMMENT '开盘日期',
  `joined_at` datetime DEFAULT NULL COMMENT '入住日期',
  `weight` varchar(150) DEFAULT NULL COMMENT '权重设置',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `url` varchar(255) DEFAULT NULL COMMENT '楼盘封面',
  `url_icon` varchar(255) DEFAULT NULL COMMENT '楼盘封面缩略图',
  `adTitle` varchar(255) DEFAULT NULL COMMENT '楼盘广告语',
  `FAR` float DEFAULT NULL COMMENT '容积率',
  `poolRate` float DEFAULT NULL COMMENT '绿化率',
  `structure` varchar(255) DEFAULT NULL COMMENT '结构',
  `wall` varchar(255) DEFAULT NULL COMMENT '外墙',
  `builders` varchar(50) DEFAULT NULL COMMENT '承建商',
  `developer` varchar(50) DEFAULT NULL COMMENT '开发商',
  `investor` varchar(50) DEFAULT NULL COMMENT '投资商',
  `contacter` varchar(50) DEFAULT NULL COMMENT '现场接待人',
  `contacterTel` varchar(50) DEFAULT NULL COMMENT '现场接待人',
  `saleTel` varchar(50) DEFAULT NULL COMMENT '售楼处电话',
  `saleAddress` varchar(50) DEFAULT NULL COMMENT '售楼处地址',
  `propertyName` varchar(50) DEFAULT NULL COMMENT '物业公司',
  `propertyFee` varchar(50) DEFAULT NULL COMMENT '物业费',
  `created_by` varchar(20) DEFAULT NULL COMMENT '创建者',
  `created_at` datetime NOT NULL COMMENT '修改时间',
  `updated_by` varchar(20) DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘详情表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_city`
--

CREATE TABLE IF NOT EXISTS `hfzy_city` (
  `id` bigint(20) NOT NULL,
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `region_id` double NOT NULL COMMENT '地区父级',
  `parent` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `level` tinyint(1) DEFAULT '2' COMMENT '等级;0=全国,1=省级,2=市级,3=县级',
  `order` bigint(20) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `short_name_en` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='省市县行政区';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_client`
--

CREATE TABLE IF NOT EXISTS `hfzy_client` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `cardId` varchar(32) DEFAULT NULL COMMENT '身份证',
  `userName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `tel` varchar(32) DEFAULT '' COMMENT '联系方式',
  `address` varchar(32) DEFAULT NULL COMMENT '地址',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;0=过客,1=客户;默认1;',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '等级;0=贵宾,1=普通;默认1;',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别',
  `province_id` bigint(20) DEFAULT '0' COMMENT '省份',
  `city_id` bigint(20) DEFAULT '0' COMMENT '城市',
  `county_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '区/县',
  `clientFrom` tinyint(2) DEFAULT '14' COMMENT '客户来源',
  `agentName` varchar(64) DEFAULT NULL COMMENT '置业人员名称',
  `agentTel` varchar(32) DEFAULT NULL COMMENT '置业人员联系方式',
  `otherName` varchar(32) DEFAULT NULL COMMENT '其他名称',
  `otherPhone` varchar(64) DEFAULT NULL COMMENT '其他手机号码',
  `qq` varchar(32) DEFAULT NULL COMMENT 'QQ',
  `birth` varchar(32) DEFAULT '' COMMENT '生日',
  `job` varchar(32) DEFAULT '' COMMENT '工作',
  `feature` varchar(1000) DEFAULT '' COMMENT '客户需求',
  `notes` varchar(1000) DEFAULT '' COMMENT '备注',
  `requireType` tinyint(4) DEFAULT '0' COMMENT '需求类别',
  `inHainan` tinyint(4) DEFAULT '0' COMMENT '是否来过海南',
  `askType` tinyint(4) DEFAULT '0' COMMENT '接洽方式',
  `askDate` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `lastVisitDate` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '第一次回访时间',
  `nextVisitDate` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '最近一次回访日期',
  `visitNum` int(4) NOT NULL DEFAULT '0' COMMENT '回访次数',
  `category` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '客户分类',
  `serviceStatus` tinyint(6) NOT NULL DEFAULT '0' COMMENT '服务状态',
  `serviceAt` datetime DEFAULT NULL COMMENT '服务时间',
  `belongUserId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '权属人',
  `belongUser` varchar(50) NOT NULL DEFAULT '' COMMENT '权属人名',
  `firstUserId` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '第一次添加人',
  `firstUser` varchar(50) NOT NULL DEFAULT '' COMMENT '第一次添加人名',
  `arrangeId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '看房安排',
  `arrangeUser` varchar(50) NOT NULL DEFAULT '' COMMENT '看房安排者',
  `changeClient` tinyint(1) NOT NULL DEFAULT '0' COMMENT '改变客户',
  `delReason` varchar(255) NOT NULL DEFAULT '' COMMENT '删除原因',
  `belongPid` int(6) unsigned NOT NULL COMMENT '权属上级',
  `updatedBy` varchar(50) NOT NULL DEFAULT '0' COMMENT '更新者',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `createdBy` varchar(50) NOT NULL DEFAULT '' COMMENT '添加者',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `agentNextId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '经纪人id',
  `visitHouseAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '看房时间',
  `isBargain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已成交，2未成交',
  `agentAt` int(6) NOT NULL DEFAULT '0' COMMENT '确定时间',
  `fitmentId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '家装',
  `seeItem` varchar(255) NOT NULL DEFAULT '' COMMENT '看房项目',
  `buyCity` varchar(100) NOT NULL DEFAULT '' COMMENT '购买城市',
  `clientPoint` varchar(1000) NOT NULL DEFAULT '' COMMENT '客户关注',
  `showAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_client_server`
--

CREATE TABLE IF NOT EXISTS `hfzy_client_server` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `client_id` bigint(20) NOT NULL COMMENT '客户表ID',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户服务表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_config`
--

CREATE TABLE IF NOT EXISTS `hfzy_config` (
  `id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `app` tinyint(1) unsigned DEFAULT '0' COMMENT '应用;0=后台;1=前台;',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) DEFAULT NULL COMMENT '配置标识',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_contact`
--

CREATE TABLE IF NOT EXISTS `hfzy_contact` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系人',
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系方式',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系地址',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '联系内容',
  `home_user_id` bigint(20) DEFAULT NULL COMMENT '前端用户表ID',
  `back_user_id` bigint(20) DEFAULT NULL COMMENT '后台业务员ID',
  `readed` tinyint(1) DEFAULT '0' COMMENT '是否阅读; 0=未读 ,1=已读',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='联系我们';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_contact_read`
--

CREATE TABLE IF NOT EXISTS `hfzy_contact_read` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `assign` tinyint(1) unsigned DEFAULT '1' COMMENT '分配;0=分配;1=自由;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `contact_id` bigint(20) NOT NULL COMMENT '联系我们表ID',
  `content` longtext COMMENT '通知信息内容',
  `remark` longtext COMMENT '备注',
  `reback` longtext COMMENT '回馈',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联系我们审阅表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_customer_service`
--

CREATE TABLE IF NOT EXISTS `hfzy_customer_service` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '等级;0=普通客服;1=金牌客服;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `duration` int(11) DEFAULT NULL COMMENT '有效时间',
  `start_at` varchar(10) DEFAULT NULL COMMENT '开始时间',
  `end_at` varchar(10) DEFAULT NULL COMMENT '结束时间',
  `order` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '拖拽顺序',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客服推荐表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_delete_log`
--

CREATE TABLE IF NOT EXISTS `hfzy_delete_log` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `table_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '目标表类型',
  `back_user_id` bigint(20) DEFAULT NULL COMMENT '后台业务员ID',
  `delete_id` bigint(20) NOT NULL COMMENT '被操作ID',
  `remark` longtext COLLATE utf8_unicode_ci COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='删除记录表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_department`
--

CREATE TABLE IF NOT EXISTS `hfzy_department` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `remark` longtext COLLATE utf8_unicode_ci COMMENT '备注',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `parent` bigint(20) DEFAULT NULL COMMENT '上级',
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '编号',
  `order` bigint(20) DEFAULT '0' COMMENT '顺序',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '等级;0=无效;1=默认;',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_download`
--

CREATE TABLE IF NOT EXISTS `hfzy_download` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '资源描述',
  `url` text COLLATE utf8_unicode_ci NOT NULL COMMENT '资源地址',
  `fileName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '资源名称',
  `tb_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '目标表名',
  `tb_id` text COLLATE utf8_unicode_ci NOT NULL COMMENT '表的id',
  `tb_category` text COLLATE utf8_unicode_ci NOT NULL COMMENT '类别信息',
  `created_at` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='赛事、福利、新闻 删除记录表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_home_user`
--

CREATE TABLE IF NOT EXISTS `hfzy_home_user` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `code` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员编号ID',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `phone_verified` tinyint(1) unsigned DEFAULT '0' COMMENT '手机号码是否已验证;"0"表示没有验证,"1"表示已验证',
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `email_verified` tinyint(1) unsigned DEFAULT '0' COMMENT '邮箱是否已验证;"0"表示没有验证,"1"表示已验证',
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `head_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `sex` enum('男','女') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `signature` varchar(32) COLLATE utf8_unicode_ci DEFAULT '什么都没有留下...' COMMENT '个性签名',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `height` int(3) DEFAULT NULL COMMENT '身高/单位CM',
  `weight` int(3) DEFAULT NULL COMMENT '体重/单位KG',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当前token',
  `auth_key` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '自动密匙',
  `password_reset_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '重置密匙',
  `password_reset_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '验证码',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态;0:正常,1:异常;2:禁用;',
  `ip` text CHARACTER SET utf8 COMMENT '登录IP',
  `reg_ip` varchar(32) CHARACTER SET utf8 DEFAULT '0.0.0.0' COMMENT '注册IP',
  `reg_type` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册方式',
  `registered_at` datetime DEFAULT NULL COMMENT '注册时间',
  `logined_at` datetime DEFAULT NULL COMMENT '登录时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='前台用户表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_home_user_log`
--

CREATE TABLE IF NOT EXISTS `hfzy_home_user_log` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `home_user_id` bigint(20) NOT NULL COMMENT '表user主键',
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '路由',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户端',
  `user_agent_type` tinyint(1) DEFAULT '1' COMMENT '客户类型;1=PC,2=Android,3=IOS;默认1',
  `gets` text COLLATE utf8_unicode_ci COMMENT 'GET方法',
  `posts` text COLLATE utf8_unicode_ci COMMENT 'POST方法',
  `target` text COLLATE utf8_unicode_ci COMMENT '目标',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='前天访问记录';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_hot`
--

CREATE TABLE IF NOT EXISTS `hfzy_hot` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `is_passed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核;0=未通过,1=审核中,2=已通过;默认1;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '父级类型:0=默认,1=首页,2=新房,3=二手房,4=出租,5=楼房,6=客服,7=交易,;默认1;',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `target` varchar(255) DEFAULT NULL COMMENT '目标地址',
  `title` varchar(80) DEFAULT NULL COMMENT '标题',
  `start_at` varchar(10) DEFAULT NULL COMMENT '开始时间',
  `end_at` varchar(10) DEFAULT NULL COMMENT '结束时间',
  `order` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '拖拽顺序',
  `app` tinyint(1) NOT NULL DEFAULT '1' COMMENT '应用;0=后台;1=前台;',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态;0=失效,1=预定,2=上架,3=下架;默认1;',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_house_better`
--

CREATE TABLE IF NOT EXISTS `hfzy_house_better` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `is_passed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核;0=未通过,1=审核中,2=已通过;默认1;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '父级类型:0=默认,1=首页,2=新房,3=二手房,4=楼房,5=联系我们;默认1;',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `target` varchar(255) DEFAULT NULL COMMENT '目标地址',
  `title` varchar(80) DEFAULT NULL COMMENT '标题',
  `start_at` varchar(10) DEFAULT NULL COMMENT '开始时间',
  `end_at` varchar(10) DEFAULT NULL COMMENT '结束时间',
  `order` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '拖拽顺序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态;0=失效,1=预定,1=上架,2=下架;默认1;',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家装广告表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_house_host`
--

CREATE TABLE IF NOT EXISTS `hfzy_house_host` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `ID_cards` varchar(255) DEFAULT NULL COMMENT '身份证',
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `address` varchar(32) DEFAULT NULL COMMENT '地址',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `city_id` bigint(20) NOT NULL COMMENT '城市表ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;0=过客,1=客户;默认1;',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房东表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_house_host_server`
--

CREATE TABLE IF NOT EXISTS `hfzy_house_host_server` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `house_host_id` bigint(20) NOT NULL COMMENT '房东表ID',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房东服务表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_images`
--

CREATE TABLE IF NOT EXISTS `hfzy_images` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `target_id` bigint(20) NOT NULL COMMENT '目标索引',
  `type` tinyint(1) NOT NULL COMMENT '父级类型:1=楼盘,2=新房,3=二手房,4=装修；默认1;',
  `url` varchar(255) NOT NULL COMMENT '图片地址',
  `url_icon` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `url_title` varchar(255) DEFAULT NULL COMMENT '图片广告标题',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片表';

-- --------------------------------------------------------

--
-- 替换视图以便查看 `hfzy_images_building`
--
CREATE TABLE IF NOT EXISTS `hfzy_images_building` (
`id` bigint(20)
,`target_id` bigint(20)
,`type` tinyint(1)
,`url` varchar(255)
,`url_icon` varchar(255)
,`url_title` varchar(255)
,`created_at` datetime
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `hfzy_images_hand_house`
--
CREATE TABLE IF NOT EXISTS `hfzy_images_hand_house` (
`id` bigint(20)
,`target_id` bigint(20)
,`type` tinyint(1)
,`url` varchar(255)
,`url_icon` varchar(255)
,`url_title` varchar(255)
,`created_at` datetime
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `hfzy_images_home_better`
--
CREATE TABLE IF NOT EXISTS `hfzy_images_home_better` (
`id` bigint(20)
,`target_id` bigint(20)
,`type` tinyint(1)
,`url` varchar(255)
,`url_icon` varchar(255)
,`url_title` varchar(255)
,`created_at` datetime
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `hfzy_images_new_house`
--
CREATE TABLE IF NOT EXISTS `hfzy_images_new_house` (
`id` bigint(20)
,`target_id` bigint(20)
,`type` tinyint(1)
,`url` varchar(255)
,`url_icon` varchar(255)
,`url_title` varchar(255)
,`created_at` datetime
);

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_label`
--

CREATE TABLE IF NOT EXISTS `hfzy_label` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '父级类型:0=失效,1=预定,2=客户,3=房东,4=新房,5=二手房,6=楼房,7=客服,8=;默认1;',
  `name` varchar(32) NOT NULL COMMENT '标签',
  `description` varchar(255) DEFAULT NULL COMMENT '标签备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_label_park`
--

CREATE TABLE IF NOT EXISTS `hfzy_label_park` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `label_id` bigint(20) NOT NULL COMMENT '标签表ID',
  `target_id` bigint(20) NOT NULL COMMENT '目标表ID;根据type值外联',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '父级类型:0=失效,1=预定,2=客户,3=房东,4=新房,5=二手房,6=楼房,7=客服,8=;默认1;',
  `name` varchar(32) NOT NULL COMMENT '标签',
  `description` varchar(255) NOT NULL COMMENT '详细描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签关系表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_menu`
--

CREATE TABLE IF NOT EXISTS `hfzy_menu` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `parent` int(11) DEFAULT NULL COMMENT '上级',
  `route` varchar(256) DEFAULT NULL COMMENT '路由',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `type` tinyint(1) DEFAULT '1' COMMENT '菜单类型',
  `data` text COMMENT '补充'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_new_house`
--

CREATE TABLE IF NOT EXISTS `hfzy_new_house` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `building_base_id` bigint(20) NOT NULL COMMENT '楼盘表ID',
  `title` varchar(255) NOT NULL COMMENT '介绍/标题',
  `city_id` bigint(20) DEFAULT NULL COMMENT '城市',
  `county_id` bigint(20) DEFAULT NULL COMMENT '区域/县级',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '房源类型;1新房2二手房;默认1;',
  `room` varchar(255) NOT NULL COMMENT '房号',
  `hall` tinyint(2) DEFAULT NULL COMMENT '大厅',
  `kitchen` tinyint(2) DEFAULT NULL COMMENT '厨房',
  `toilet` tinyint(2) DEFAULT NULL COMMENT '独卫',
  `veranda` tinyint(2) DEFAULT NULL COMMENT '阳台',
  `url` varchar(255) NOT NULL COMMENT '封面宣传',
  `url_icon` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `floorsType` tinyint(2) DEFAULT NULL COMMENT '所在楼层类型',
  `onFloor` int(11) DEFAULT NULL COMMENT '位于楼层',
  `floors` int(11) DEFAULT NULL COMMENT '共计楼层',
  `face` tinyint(2) DEFAULT NULL COMMENT '房屋朝向',
  `houseType` tinyint(2) DEFAULT NULL COMMENT '房屋类型',
  `fitment` tinyint(2) DEFAULT NULL COMMENT '装修情况',
  `eachPrice` int(11) DEFAULT NULL COMMENT '房屋单价(元/平方米)',
  `price` int(11) DEFAULT NULL COMMENT '售价',
  `years` int(11) DEFAULT NULL COMMENT '建筑年代',
  `area` int(11) DEFAULT NULL COMMENT '建筑面积',
  `description` text NOT NULL COMMENT '详细描述',
  `supporting` varchar(255) DEFAULT NULL COMMENT '配套设施',
  `traffic` text COMMENT '交通状况',
  `around` text COMMENT '周边环境',
  `houseLabel` varchar(255) DEFAULT NULL COMMENT '房源标签',
  `isTop` tinyint(1) DEFAULT NULL COMMENT '置顶',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `saleStatus` tinyint(1) DEFAULT NULL COMMENT '销售状态',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `tel` varchar(255) DEFAULT NULL COMMENT '手机/固话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `weChat` varchar(255) DEFAULT NULL COMMENT '微信',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `created_by` bigint(20) NOT NULL COMMENT '创建者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新房表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_notice`
--

CREATE TABLE IF NOT EXISTS `hfzy_notice` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '推送标题',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '推送内容',
  `is_passed` tinyint(1) unsigned DEFAULT '1' COMMENT '状态;0=无效;1=待审核,2=已通过,3=未通过,4=保存,5=已推送;',
  `order` bigint(20) NOT NULL COMMENT '顺序',
  `remark` longtext COLLATE utf8_unicode_ci COMMENT '备注',
  `readed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否阅读; 0=未读 ,1=已读',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `start_at` datetime NOT NULL COMMENT '开始时间',
  `end_at` datetime NOT NULL COMMENT '截止时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='通知信息表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_notice_read`
--

CREATE TABLE IF NOT EXISTS `hfzy_notice_read` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `notice_id` bigint(20) NOT NULL COMMENT '通知信息表ID',
  `content` longtext COMMENT '通知信息内容',
  `remark` longtext COMMENT '备注',
  `reback` longtext COMMENT '回馈',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知信息审阅表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_on_links`
--

CREATE TABLE IF NOT EXISTS `hfzy_on_links` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `app` tinyint(1) unsigned DEFAULT '0' COMMENT '应用;0=后台;1=前台;',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `sort` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_opinion`
--

CREATE TABLE IF NOT EXISTS `hfzy_opinion` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `remark` longtext COMMENT '备注',
  `home_user_id` bigint(20) DEFAULT NULL COMMENT '前端用户表ID',
  `back_user_id` bigint(20) DEFAULT NULL COMMENT '后台业务员ID',
  `content` longtext COMMENT '内容',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '联系人',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '联系方式',
  `readed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否阅读;0=未读,1=已读',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_opinion_read`
--

CREATE TABLE IF NOT EXISTS `hfzy_opinion_read` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `assign` tinyint(1) unsigned DEFAULT '1' COMMENT '分配;0=分配;1=自由;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `opinion_id` bigint(20) NOT NULL COMMENT '意见表ID',
  `content` longtext COMMENT '意见内容',
  `remark` longtext COMMENT '备注',
  `reback` longtext COMMENT '回馈',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见审阅表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_region`
--

CREATE TABLE IF NOT EXISTS `hfzy_region` (
  `id` double NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent` double NOT NULL,
  `level` double NOT NULL,
  `order` double NOT NULL,
  `name_en` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `short_name_en` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='省市县行政区';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_second_hand_house`
--

CREATE TABLE IF NOT EXISTS `hfzy_second_hand_house` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `house_host_id` bigint(20) NOT NULL COMMENT '房东表ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;0=,1=;默认1;',
  `city_id` bigint(20) NOT NULL COMMENT '城市表ID',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `room` varchar(255) NOT NULL COMMENT '房号',
  `description` varchar(255) NOT NULL COMMENT '详细描述',
  `url` varchar(255) NOT NULL COMMENT '封面宣传',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='二手房表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_session`
--

CREATE TABLE IF NOT EXISTS `hfzy_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'ID',
  `session_expire` int(11) NOT NULL COMMENT 'SESSION_ID',
  `session_data` blob COMMENT '数据',
  `uid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `update_time` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='session存储表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_slider`
--

CREATE TABLE IF NOT EXISTS `hfzy_slider` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `is_passed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核;0=未通过,1=审核中,2=已通过;默认1;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '父级类型:0=默认,1=首页,2=新房,3=二手房,4=出租,5=楼房,6=联系我们,;默认1;',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `target` varchar(255) DEFAULT NULL COMMENT '目标地址',
  `title` varchar(80) DEFAULT NULL COMMENT '标题',
  `start_at` varchar(10) DEFAULT NULL COMMENT '开始时间',
  `end_at` varchar(10) DEFAULT NULL COMMENT '结束时间',
  `order` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '拖拽顺序',
  `app` tinyint(1) NOT NULL DEFAULT '1' COMMENT '应用;0=后台;1=前台;',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态;0=失效,1=预定,1=上架,2=下架;默认1;',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_take_order`
--

CREATE TABLE IF NOT EXISTS `hfzy_take_order` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `client_id` bigint(20) NOT NULL COMMENT '客户表ID',
  `order_code` varchar(255) NOT NULL COMMENT '订单号',
  `house_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;1=新房,2=二手房;默认1;',
  `goods_id` bigint(20) NOT NULL COMMENT '目标商品ID',
  `deal_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '交易状态;0=失败,1=成功;默认1;',
  `money` varchar(255) NOT NULL COMMENT '交易金额',
  `description` varchar(255) NOT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_type`
--

CREATE TABLE IF NOT EXISTS `hfzy_type` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '父级类型:0=失效,1=预定,2=客户,3=房东,4=新房,5=二手房,6=楼房,7=客服,8=;默认1;',
  `name` varchar(32) NOT NULL COMMENT '类型名',
  `description` varchar(255) DEFAULT NULL COMMENT '类型备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_type_park`
--

CREATE TABLE IF NOT EXISTS `hfzy_type_park` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `type_id` bigint(20) NOT NULL COMMENT '标签表ID',
  `target_id` bigint(20) NOT NULL COMMENT '目标表ID;根据type值外联',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '父级类型:0=失效,1=预定,2=客户,3=房东,4=新房,5=二手房,6=楼房,7=客服,8=;默认1;',
  `name` varchar(32) NOT NULL COMMENT '标签',
  `description` varchar(255) NOT NULL COMMENT '详细描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型关系表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_upload`
--

CREATE TABLE IF NOT EXISTS `hfzy_upload` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) unsigned DEFAULT '1' COMMENT '时效;0=无效;1=有效;',
  `back_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) DEFAULT '' COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) DEFAULT '' COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` bigint(20) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `created_at` datetime NOT NULL COMMENT '上传时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间',
  `sort` bigint(20) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_user_login_log`
--

CREATE TABLE IF NOT EXISTS `hfzy_user_login_log` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `user_id` bigint(20) NOT NULL COMMENT '表user主键',
  `app` tinyint(1) DEFAULT '1' COMMENT '账户类型:1后台账户,前端用户',
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '路由',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户端',
  `gets` text COLLATE utf8_unicode_ci COMMENT 'GET方法',
  `posts` text COLLATE utf8_unicode_ci COMMENT 'POST方法',
  `target` text CHARACTER SET utf8 COMMENT '目标',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='登陆记录';

-- --------------------------------------------------------

--
-- 表的结构 `hfzy_walk`
--

CREATE TABLE IF NOT EXISTS `hfzy_walk` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `client_id` bigint(20) NOT NULL COMMENT '客户表ID',
  `on_server` tinyint(1) NOT NULL DEFAULT '1' COMMENT '跟进;0=未跟进,1=已跟进;默认1;',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户跟进表';

-- --------------------------------------------------------

--
-- 视图结构 `hfzy_images_building`
--
DROP TABLE IF EXISTS `hfzy_images_building`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hfzy_images_building` AS (select `hfzy_images`.`id` AS `id`,`hfzy_images`.`target_id` AS `target_id`,`hfzy_images`.`type` AS `type`,`hfzy_images`.`url` AS `url`,`hfzy_images`.`url_icon` AS `url_icon`,`hfzy_images`.`url_title` AS `url_title`,`hfzy_images`.`created_at` AS `created_at` from `hfzy_images` where (`hfzy_images`.`type` = '1'));

-- --------------------------------------------------------

--
-- 视图结构 `hfzy_images_hand_house`
--
DROP TABLE IF EXISTS `hfzy_images_hand_house`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hfzy_images_hand_house` AS (select `hfzy_images`.`id` AS `id`,`hfzy_images`.`target_id` AS `target_id`,`hfzy_images`.`type` AS `type`,`hfzy_images`.`url` AS `url`,`hfzy_images`.`url_icon` AS `url_icon`,`hfzy_images`.`url_title` AS `url_title`,`hfzy_images`.`created_at` AS `created_at` from `hfzy_images` where (`hfzy_images`.`type` = '3'));

-- --------------------------------------------------------

--
-- 视图结构 `hfzy_images_home_better`
--
DROP TABLE IF EXISTS `hfzy_images_home_better`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hfzy_images_home_better` AS (select `hfzy_images`.`id` AS `id`,`hfzy_images`.`target_id` AS `target_id`,`hfzy_images`.`type` AS `type`,`hfzy_images`.`url` AS `url`,`hfzy_images`.`url_icon` AS `url_icon`,`hfzy_images`.`url_title` AS `url_title`,`hfzy_images`.`created_at` AS `created_at` from `hfzy_images` where (`hfzy_images`.`type` = '4'));

-- --------------------------------------------------------

--
-- 视图结构 `hfzy_images_new_house`
--
DROP TABLE IF EXISTS `hfzy_images_new_house`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hfzy_images_new_house` AS (select `hfzy_images`.`id` AS `id`,`hfzy_images`.`target_id` AS `target_id`,`hfzy_images`.`type` AS `type`,`hfzy_images`.`url` AS `url`,`hfzy_images`.`url_icon` AS `url_icon`,`hfzy_images`.`url_title` AS `url_title`,`hfzy_images`.`created_at` AS `created_at` from `hfzy_images` where (`hfzy_images`.`type` = '2'));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hfzy_auth_assignment`
--
ALTER TABLE `hfzy_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `hfzy_auth_assignment_ibfk_2` (`user_id`) USING BTREE;

--
-- Indexes for table `hfzy_auth_item`
--
ALTER TABLE `hfzy_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `hfzy_auth_item_child`
--
ALTER TABLE `hfzy_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `hfzy_auth_rule`
--
ALTER TABLE `hfzy_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `hfzy_back_user`
--
ALTER TABLE `hfzy_back_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `uid` (`code`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `hfzy_back_user_log`
--
ALTER TABLE `hfzy_back_user_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_ban`
--
ALTER TABLE `hfzy_ban`
  ADD PRIMARY KEY (`item_name`,`back_user_id`),
  ADD KEY `hfzy_back_ban_assignment_ibfk_2` (`back_user_id`);

--
-- Indexes for table `hfzy_building_base`
--
ALTER TABLE `hfzy_building_base`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `back_user_id` (`created_by`) USING BTREE;

--
-- Indexes for table `hfzy_building_content`
--
ALTER TABLE `hfzy_building_content`
  ADD PRIMARY KEY (`building_base_id`);

--
-- Indexes for table `hfzy_building_detail`
--
ALTER TABLE `hfzy_building_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building_base_id` (`building_base_id`);

--
-- Indexes for table `hfzy_city`
--
ALTER TABLE `hfzy_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `parent` (`parent`),
  ADD KEY `level` (`level`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `hfzy_client`
--
ALTER TABLE `hfzy_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hfzy_client_server`
--
ALTER TABLE `hfzy_client_server`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_config`
--
ALTER TABLE `hfzy_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `hfzy_contact`
--
ALTER TABLE `hfzy_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`),
  ADD KEY `home_user_id` (`home_user_id`);

--
-- Indexes for table `hfzy_contact_read`
--
ALTER TABLE `hfzy_contact_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `hfzy_customer_service`
--
ALTER TABLE `hfzy_customer_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_delete_log`
--
ALTER TABLE `hfzy_delete_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`),
  ADD KEY `delete_id` (`delete_id`);

--
-- Indexes for table `hfzy_department`
--
ALTER TABLE `hfzy_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hfzy_download`
--
ALTER TABLE `hfzy_download`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`) USING BTREE;

--
-- Indexes for table `hfzy_home_user`
--
ALTER TABLE `hfzy_home_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `uid` (`code`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `hfzy_home_user_log`
--
ALTER TABLE `hfzy_home_user_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_user_id` (`home_user_id`);

--
-- Indexes for table `hfzy_hot`
--
ALTER TABLE `hfzy_hot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_house_better`
--
ALTER TABLE `hfzy_house_better`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_house_host`
--
ALTER TABLE `hfzy_house_host`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hfzy_house_host_server`
--
ALTER TABLE `hfzy_house_host_server`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_host_id` (`house_host_id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_images`
--
ALTER TABLE `hfzy_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target_id`,`type`);

--
-- Indexes for table `hfzy_label`
--
ALTER TABLE `hfzy_label`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hfzy_label_park`
--
ALTER TABLE `hfzy_label_park`
  ADD PRIMARY KEY (`id`),
  ADD KEY `label_id` (`label_id`),
  ADD KEY `target_id` (`target_id`);

--
-- Indexes for table `hfzy_menu`
--
ALTER TABLE `hfzy_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hfzy_new_house`
--
ALTER TABLE `hfzy_new_house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building_base_id` (`building_base_id`),
  ADD KEY `back_user_id` (`created_by`);

--
-- Indexes for table `hfzy_notice`
--
ALTER TABLE `hfzy_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_notice_read`
--
ALTER TABLE `hfzy_notice_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`),
  ADD KEY `notice_id` (`notice_id`);

--
-- Indexes for table `hfzy_on_links`
--
ALTER TABLE `hfzy_on_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hfzy_opinion`
--
ALTER TABLE `hfzy_opinion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_user_id` (`home_user_id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_opinion_read`
--
ALTER TABLE `hfzy_opinion_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`),
  ADD KEY `opinion_id` (`opinion_id`);

--
-- Indexes for table `hfzy_region`
--
ALTER TABLE `hfzy_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `parent` (`parent`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `hfzy_second_hand_house`
--
ALTER TABLE `hfzy_second_hand_house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_host_id` (`house_host_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `hfzy_session`
--
ALTER TABLE `hfzy_session`
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `hfzy_slider`
--
ALTER TABLE `hfzy_slider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_take_order`
--
ALTER TABLE `hfzy_take_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `hfzy_type`
--
ALTER TABLE `hfzy_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hfzy_type_park`
--
ALTER TABLE `hfzy_type_park`
  ADD PRIMARY KEY (`id`),
  ADD KEY `label_id` (`type_id`),
  ADD KEY `target_id` (`target_id`);

--
-- Indexes for table `hfzy_upload`
--
ALTER TABLE `hfzy_upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `hfzy_user_login_log`
--
ALTER TABLE `hfzy_user_login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `hfzy_walk`
--
ALTER TABLE `hfzy_walk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hfzy_back_user`
--
ALTER TABLE `hfzy_back_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `hfzy_back_user_log`
--
ALTER TABLE `hfzy_back_user_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `hfzy_building_base`
--
ALTER TABLE `hfzy_building_base`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_building_detail`
--
ALTER TABLE `hfzy_building_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_city`
--
ALTER TABLE `hfzy_city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hfzy_client`
--
ALTER TABLE `hfzy_client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_client_server`
--
ALTER TABLE `hfzy_client_server`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_config`
--
ALTER TABLE `hfzy_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID';
--
-- AUTO_INCREMENT for table `hfzy_contact`
--
ALTER TABLE `hfzy_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_contact_read`
--
ALTER TABLE `hfzy_contact_read`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_customer_service`
--
ALTER TABLE `hfzy_customer_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_delete_log`
--
ALTER TABLE `hfzy_delete_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_download`
--
ALTER TABLE `hfzy_download`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_home_user`
--
ALTER TABLE `hfzy_home_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `hfzy_home_user_log`
--
ALTER TABLE `hfzy_home_user_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `hfzy_hot`
--
ALTER TABLE `hfzy_hot`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_house_better`
--
ALTER TABLE `hfzy_house_better`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_house_host`
--
ALTER TABLE `hfzy_house_host`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_house_host_server`
--
ALTER TABLE `hfzy_house_host_server`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_images`
--
ALTER TABLE `hfzy_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID';
--
-- AUTO_INCREMENT for table `hfzy_label`
--
ALTER TABLE `hfzy_label`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_label_park`
--
ALTER TABLE `hfzy_label_park`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_menu`
--
ALTER TABLE `hfzy_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_new_house`
--
ALTER TABLE `hfzy_new_house`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_notice`
--
ALTER TABLE `hfzy_notice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_notice_read`
--
ALTER TABLE `hfzy_notice_read`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_on_links`
--
ALTER TABLE `hfzy_on_links`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_opinion`
--
ALTER TABLE `hfzy_opinion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_opinion_read`
--
ALTER TABLE `hfzy_opinion_read`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_region`
--
ALTER TABLE `hfzy_region`
  MODIFY `id` double NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hfzy_second_hand_house`
--
ALTER TABLE `hfzy_second_hand_house`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_slider`
--
ALTER TABLE `hfzy_slider`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_take_order`
--
ALTER TABLE `hfzy_take_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_type`
--
ALTER TABLE `hfzy_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_type_park`
--
ALTER TABLE `hfzy_type_park`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_upload`
--
ALTER TABLE `hfzy_upload`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `hfzy_user_login_log`
--
ALTER TABLE `hfzy_user_login_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `hfzy_walk`
--
ALTER TABLE `hfzy_walk`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 限制导出的表
--

--
-- 限制表 `hfzy_auth_assignment`
--
ALTER TABLE `hfzy_auth_assignment`
  ADD CONSTRAINT `hfzy_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `hfzy_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hfzy_auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_auth_item`
--
ALTER TABLE `hfzy_auth_item`
  ADD CONSTRAINT `hfzy_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `hfzy_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `hfzy_auth_item_child`
--
ALTER TABLE `hfzy_auth_item_child`
  ADD CONSTRAINT `hfzy_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `hfzy_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hfzy_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `hfzy_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_back_user`
--
ALTER TABLE `hfzy_back_user`
  ADD CONSTRAINT `hfzy_back_user_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `hfzy_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_back_user_log`
--
ALTER TABLE `hfzy_back_user_log`
  ADD CONSTRAINT `hfzy_back_user_log_ibfk_1` FOREIGN KEY (`back_user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_ban`
--
ALTER TABLE `hfzy_ban`
  ADD CONSTRAINT `hfzy_ban_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `hfzy_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hfzy_ban_ibfk_2` FOREIGN KEY (`back_user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_building_base`
--
ALTER TABLE `hfzy_building_base`
  ADD CONSTRAINT `hfzy_building_base_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `hfzy_city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hfzy_building_base_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_building_content`
--
ALTER TABLE `hfzy_building_content`
  ADD CONSTRAINT `hfzy_building_content_ibfk_1` FOREIGN KEY (`building_base_id`) REFERENCES `hfzy_building_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_building_detail`
--
ALTER TABLE `hfzy_building_detail`
  ADD CONSTRAINT `hfzy_building_detail_ibfk_1` FOREIGN KEY (`building_base_id`) REFERENCES `hfzy_building_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_city`
--
ALTER TABLE `hfzy_city`
  ADD CONSTRAINT `hfzy_city_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `hfzy_region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_client_server`
--
ALTER TABLE `hfzy_client_server`
  ADD CONSTRAINT `hfzy_client_server_ibfk_1` FOREIGN KEY (`back_user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hfzy_client_server_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `hfzy_client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_contact`
--
ALTER TABLE `hfzy_contact`
  ADD CONSTRAINT `hfzy_contact_ibfk_1` FOREIGN KEY (`back_user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hfzy_contact_ibfk_2` FOREIGN KEY (`home_user_id`) REFERENCES `hfzy_home_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_contact_read`
--
ALTER TABLE `hfzy_contact_read`
  ADD CONSTRAINT `hfzy_contact_read_ibfk_1` FOREIGN KEY (`back_user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hfzy_contact_read_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `hfzy_contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_customer_service`
--
ALTER TABLE `hfzy_customer_service`
  ADD CONSTRAINT `hfzy_customer_server_ibfk_1` FOREIGN KEY (`back_user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_delete_log`
--
ALTER TABLE `hfzy_delete_log`
  ADD CONSTRAINT `hfzy_delete_log_ibfk_1` FOREIGN KEY (`back_user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_download`
--
ALTER TABLE `hfzy_download`
  ADD CONSTRAINT `hfzy_download_ibfk_1` FOREIGN KEY (`back_user_id`) REFERENCES `hfzy_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hfzy_home_user_log`
--
ALTER TABLE `hfzy_home_user_log`
  ADD CONSTRAINT `hfzy_home_user_log_ibfk_1` FOREIGN KEY (`home_user_id`) REFERENCES `hfzy_home_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
