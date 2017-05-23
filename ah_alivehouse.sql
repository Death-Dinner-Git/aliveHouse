-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2017-05-23 21:02:13
-- 服务器版本： 10.1.9-MariaDB-log
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ah_alivehouse`
--

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_auth_assignment`
--

DROP TABLE IF EXISTS `ah_back_auth_assignment`;
CREATE TABLE IF NOT EXISTS `ah_back_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类权限等级',
  `back_user_id`  bigint(20) NOT NULL COMMENT '分配对象UID',
  `created_at` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_auth_item`
--

DROP TABLE IF EXISTS `ah_back_auth_item`;
CREATE TABLE IF NOT EXISTS `ah_back_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限名',
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci COMMENT '权限描述',
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '使用规则',
  `data` text COLLATE utf8_unicode_ci COMMENT '补充说明',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_auth_item_child`
--

DROP TABLE IF EXISTS `ah_back_auth_item_child`;
CREATE TABLE IF NOT EXISTS `ah_back_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限上级',
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限下级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_auth_rule`
--

DROP TABLE IF EXISTS `ah_back_auth_rule`;
CREATE TABLE IF NOT EXISTS `ah_back_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '规则名',
  `data` text COLLATE utf8_unicode_ci COMMENT '规则位置',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_ban`
--

DROP TABLE IF EXISTS `ah_back_ban`;
CREATE TABLE IF NOT EXISTS `ah_back_ban` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `back_user_id` bigint(20) NOT NULL COMMENT 'UID',
  `ban` tinyint(1) DEFAULT '0' COMMENT '类型;0，允许；1，禁止；',
  `created_at` datetime NOT NULl COMMENT '变更时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_config`
--

DROP TABLE IF EXISTS `ah_back_config`;
CREATE TABLE IF NOT EXISTS `ah_back_config` (
  `id` bigint(20) unsigned NOT NULL COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) DEFAULT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time`  datetime NOT NULL COMMENT '更新时间',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

--
-- 转存表中的数据 `ah_back_config`
--

INSERT INTO `ah_back_config` (`id`, `title`, `name`, `value`, `group`, `type`, `options`, `tip`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, '站点开关', 'TOGGLE_WEB_SITE', '1', 1, 'toggle', '0:关闭\r\n1:开启', '站点关闭后将不能访问', 1378898976, 1406992386, 1, 1),
(2, '网站标题', 'WEB_SITE_TITLE', '[ WF ]', 1, 'text', '', '网站标题前台显示标题', 1378898976, 1379235274, 2, 1),
(3, '网站口号', 'WEB_SITE_SLOGAN', '我房网 出车系统', 1, 'text', '', '网站口号、宣传标语、一句话介绍', 1434081649, 1434081649, 3, 1),
(4, '网站LOGO', 'WEB_SITE_LOGO', '', 1, 'picture', '', '网站LOGO', 1407003397, 1407004692, 4, 1),
(5, '网站反色LOGO', 'WEB_SITE_LOGO_INVERSE', '', 1, 'picture', '', '匹配深色背景上的LOGO', 1476700797, 1476700797, 5, 1),
(6, '网站描述', 'WEB_SITE_DESCRIPTION', '我房网 出车系统', 1, 'textarea', '', '网站搜索引擎描述', 1378898976, 1379235841, 6, 1),
(7, '网站关键字', 'WEB_SITE_KEYWORD', '我房网 出车系统', 1, 'textarea', '', '网站搜索引擎关键字', 1378898976, 1381390100, 7, 1),
(8, '版权信息', 'WEB_SITE_COPYRIGHT', 'Copyright © 海南我房地产顾问有限公司 All rights reserved.', 1, 'text', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 科斯克网络科技”', 1406991855, 1406992583, 8, 1),
(9, '网站备案号', 'WEB_SITE_ICP', 'XXX 号', 1, 'text', '', '设置在网站底部显示的备案号，如“苏ICP备1502009号"', 1378900335, 1415983236, 9, 1),
(10, '站点统计', 'WEB_SITE_STATISTICS', '', 1, 'textarea', '', '支持百度、Google、cnzz等所有Javascript的统计代码', 1378900335, 1415983236, 10, 1),
(11, '公司名称', 'COMPANY_TITLE', '海南我房地产顾问有限公司', 3, 'text', '', '', 1481014715, 1481014715, 1, 1),
(12, '公司地址', 'COMPANY_ADDRESS', '海南省海口市琼山区府城街道金霖花园别墅B7幢一楼', 3, 'text', '', '', 1481014768, 1481014768, 2, 1),
(13, '公司邮箱', 'COMPANY_EMAIL', 'service@wofang.com', 3, 'text', '', '', 1481014914, 1481014914, 3, 1),
(14, '公司电话', 'COMPANY_PHONE', 'XXX', 3, 'text', '', '', 1481014961, 1481014961, 4, 1),
(15, '公司QQ', 'COMPANY_QQ', 'XXX', 3, 'text', '', '', 1481015016, 1481015016, 5, 1),
(16, '公司QQ群', 'COMPANY_QQQUN', 'XXX', 3, 'text', '', '', 1481015198, 1481015198, 6, 1),
(17, '网站二维码', 'QR_CODE', '', 3, 'picture', '', '', 1481009623, 1481009623, 7, 1),
(18, 'IOS二维码', 'QR_IOS', '', 3, 'picture', '', '', 1481009623, 1481009623, 8, 1),
(19, '安卓二维码', 'QR_ANDROID', '', 3, 'picture', '', '', 1481009921, 1481009921, 9, 1),
(20, '微信二维码', 'QR_WEIXIN', '', 3, 'picture', '', '', 1481009959, 1481009959, 10, 1),
(21, '文件上传大小', 'UPLOAD_FILE_SIZE', '2', 5, 'num', '', '文件上传大小单位：MB', 1428681031, 1428681031, 1, 1),
(22, '图片上传大小', 'UPLOAD_IMAGE_SIZE', '0.5', 5, 'num', '', '图片上传大小单位：MB', 1428681071, 1428681071, 2, 1),
(23, '后台多标签', 'ADMIN_TABS', '0', 5, 'toggle', '0:关闭\r\n1:开启', '', 1453445526, 1453445526, 3, 1),
(24, '分页数量', 'ADMIN_PAGE_ROWS', '10', 5, 'num', '', '分页时每页的记录数', 1434019462, 1434019481, 4, 1),
(25, '后台主题', 'ADMIN_THEME', 'admin', 5, 'select', 'admin:默认主题\r\naliyun:阿里云风格', '后台界面主题', 1436678171, 1436690570, 5, 1),
(26, '导航分组', 'NAV_GROUP_LIST', 'top:顶部导航\nmain:主导航\nbottom:底部导航\nwap_bottom:Wap底部导航', 5, 'array', '', '导航分组', 1458382037, 1458382061, 6, 1),
(27, '配置分组', 'CONFIG_GROUP_LIST', '1:基本\r\n3:扩展\r\n5:系统\r\n7:部署', 5, 'array', '', '配置分组', 1379228036, 1426930700, 7, 1),
(28, '开发模式', 'DEVELOP_MODE', '1', 7, 'toggle', '1:开启\r\n0:关闭', '开发模式下会显示菜单管理、配置管理、数据字典等开发者工具', 1432393583, 1432393583, 1, 1),
(29, '页面Trace', 'APP_TRACE', '0', 7, 'toggle', '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_menu`
--

DROP TABLE IF EXISTS `ah_back_menu`;
CREATE TABLE IF NOT EXISTS `ah_back_menu` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `parent` int(11) DEFAULT NULL COMMENT '上级',
  `route` varchar(256) DEFAULT NULL COMMENT '路由',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `type` enum('1','2') DEFAULT '1' COMMENT '菜单类型',
  `data` text COMMENT '补充'
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='菜单表';

--
-- 转存表中的数据 `ah_back_menu`
--

INSERT INTO `ah_back_menu` (`id`, `name`, `parent`, `route`, `order`, `type`, `data`) VALUES
(1, '后台首页', NULL, '/index/home', 0, '1', '{"li_class":"","a_class":"Index-Home","i_class":"fa fa-circle-o"}'),
(2, '我的面板', NULL, NULL, 1, '1', '{"li_class":"","a_class":"User","i_class":"fa fa-circle-o"}'),
(3, '账号管理', NULL, NULL, 2, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(4, '数据统计', NULL, NULL, 3, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(5, '行驶记录', NULL, NULL, 4, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(6, '维护管理', NULL, NULL, 5, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(7, '车辆管理', NULL, NULL, 6, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(8, '工资结算', NULL, NULL, 7, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(9, '网站维护', NULL, NULL, 8, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(10, '系统配置', NULL, NULL, 9, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(11, '意见反馈', NULL, '/about/contact', 10, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(12, '友情链接', NULL, '/on-links/links', 11, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(28, '个人信息', 2, '/user/index', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(29, '修改密码', 2, '/user/reset-password', 1, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(30, '日志信息', 2, '/user/log', 2, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(36, '超级管理', 3, '/manage/super', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(37, '账号管理', 3, '/manage/item', 1, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(44, '数据统计', 4, '/data/view', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(51, '行驶记录', 5, '/travel/log', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(60, '维护列表', 6, '/warranty/index', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(70, '安排出车', 7, '/car/out', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(71, '抢单管理', 7, '/car/transaction', 1, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(72, '点评管理', 7, '/car/comments', 2, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(73, '车辆管理', 7, '/car/update', 3, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(74, '司机管理', 7, '/car/driver', 4, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(80, '工资结算', 8, '/settlement/index', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(81, '区域时费', 8, '/settlement/tip', 1, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(90, '网站主题', 9, '/maintain/theme', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(91, '数据库管理', 9, '/maintain/database', 1, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(92, '生成页面', 9, '/maintain/page', 2, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(93, '更新缓存', 9, '/maintain/cache', 3, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(100, '基本设置', 10, '/settings/primary', 0, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(101, '站点管理', 10, '/settings/site', 1, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(102, '安全设置', 10, '/settings/safety', 2, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(103, '短信接口设置', 10, '/settings/message', 3, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(104, '推送接口设置', 10, '/settings/push', 4, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(105, '邮箱设置', 10, '/settings/email', 5, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(106, '系统日志管理', 10, '/settings/log', 6, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(107, '防采集管理', 10, '/settings/defend', 7, '1', '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}');

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_on_links`
--

DROP TABLE IF EXISTS `ah_back_on_links`;
CREATE TABLE IF NOT EXISTS `ah_back_on_links` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `sort` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_session`
--

DROP TABLE IF EXISTS `ah_back_session`;
CREATE TABLE IF NOT EXISTS `ah_back_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'ID',
  `session_expire` int(11) NOT NULL COMMENT 'SESSION_ID',
  `session_data` blob COMMENT '数据',
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `update_time` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='session存储表';

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_upload`
--

DROP TABLE IF EXISTS `ah_back_upload`;
CREATE TABLE IF NOT EXISTS `ah_back_upload` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `back_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) DEFAULT '' COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) DEFAULT '' COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` bigint(20)  NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time`  datetime NOT NULL COMMENT '上传时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `sort` bigint(20) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_user`
--

DROP TABLE IF EXISTS `ah_back_user`;
CREATE TABLE IF NOT EXISTS `ah_back_user` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `uid` bigint(32) DEFAULT NULL COMMENT '会员编号ID',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `phone_verified` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '手机号码是否已验证;"0"表示没有验证,"1"表示已验证',
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `email_verified` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '邮箱是否已验证;"0"表示没有验证,"1"表示已验证',
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `head_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `sex` varchar(2) COLLATE utf8_unicode_ci DEFAULT '男' COMMENT '性别',
  `signature` varchar(32) COLLATE utf8_unicode_ci DEFAULT '什么都没有留下...' COMMENT '个性签名',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `height` int(3) DEFAULT NULL COMMENT '身高/单位CM',
  `weight` int(3) DEFAULT NULL COMMENT '体重/单位KG',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当前token',
  `auth_key` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '自动密匙',
  `password_reset_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '重置密匙',
  `password_reset_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '验证码',
  `status` enum('0','1','-1') COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态',
  `ip` text CHARACTER SET utf8 COMMENT '登录IP',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_type` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册方式',
  `registered_at` datetime DEFAULT NULL COMMENT '注册时间',
  `logined_at` datetime DEFAULT NULL COMMENT '登录时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='前台用户表';

-- --------------------------------------------------------

--
-- 表的结构 `ah_home_user`
--

DROP TABLE IF EXISTS `ah_home_user`;
CREATE TABLE IF NOT EXISTS `ah_home_user` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `uid` bigint(32) DEFAULT NULL COMMENT '会员编号ID',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `phone_verified` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '手机号码是否已验证;"0"表示没有验证,"1"表示已验证',
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `email_verified` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '邮箱是否已验证;"0"表示没有验证,"1"表示已验证',
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `head_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `sex` varchar(2) COLLATE utf8_unicode_ci DEFAULT '男' COMMENT '性别',
  `signature` varchar(32) COLLATE utf8_unicode_ci DEFAULT '什么都没有留下...' COMMENT '个性签名',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `height` int(3) DEFAULT NULL COMMENT '身高/单位CM',
  `weight` int(3) DEFAULT NULL COMMENT '体重/单位KG',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当前token',
  `auth_key` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '自动密匙',
  `password_reset_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '重置密匙',
  `password_reset_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '验证码',
  `status` enum('0','1','-1') COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态',
  `ip` text CHARACTER SET utf8 COMMENT '登录IP',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_type` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册方式',
  `registered_at` datetime DEFAULT NULL COMMENT '注册时间',
  `logined_at` datetime DEFAULT NULL COMMENT '登录时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='前台用户表';

-- --------------------------------------------------------

--
-- 表的结构 `ah_back_user_log`
--

DROP TABLE IF EXISTS `ah_back_user_log`;
CREATE TABLE IF NOT EXISTS `ah_back_user_log` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `back_user_id` bigint(20) NOT NULL COMMENT '表user主键',
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '路由',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户端',
  `gets` text COLLATE utf8_unicode_ci COMMENT 'GET方法',
  `posts` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'POST方法',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台访问记录';

--
-- 表的结构 `ah_home_user_log`
--

DROP TABLE IF EXISTS `ah_home_user_log`;
CREATE TABLE IF NOT EXISTS `ah_home_user_log` (
  `id` bigint(20) NOT NULL COMMENT '自增ID',
  `home_user_id` bigint(20) NOT NULL COMMENT '表user主键',
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '路由',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户端',
  `gets` text COLLATE utf8_unicode_ci COMMENT 'GET方法',
  `posts` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'POST方法',
  `target` text COLLATE utf8_unicode_ci NOT NULL COMMENT '目标',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='前天访问记录';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ah_back_auth_assignment`
--
ALTER TABLE `ah_back_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`back_user_id`),
  ADD KEY `ah_back_auth_assignment_ibfk_2` (`back_user_id`);

--
-- Indexes for table `ah_back_auth_item`
--
ALTER TABLE `ah_back_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `ah_back_auth_item_child`
--
ALTER TABLE `ah_back_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `ah_back_auth_rule`
--
ALTER TABLE `ah_back_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `ah_back_ban`
--
ALTER TABLE `ah_back_ban`
  ADD PRIMARY KEY (`item_name`,`back_user_id`),
  ADD KEY `ah_back_ban_assignment_ibfk_2` (`back_user_id`);

--
-- Indexes for table `ah_back_config`
--
ALTER TABLE `ah_back_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ah_back_menu`
--
ALTER TABLE `ah_back_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ah_back_on_links`
--
ALTER TABLE `ah_back_on_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ah_back_session`
--
ALTER TABLE `ah_back_session`
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `ah_back_upload`
--
ALTER TABLE `ah_back_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ah_back_user`
--
ALTER TABLE `ah_back_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `ah_home_user`
--
ALTER TABLE `ah_home_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `ah_back_user_log`
--
ALTER TABLE `ah_back_user_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`);

--
-- Indexes for table `ah_home_user_log`
--
ALTER TABLE `ah_home_user_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_user_id` (`home_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ah_back_config`
--
ALTER TABLE `ah_back_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `ah_back_menu`
--
ALTER TABLE `ah_back_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `ah_back_on_links`
--
ALTER TABLE `ah_back_on_links`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `ah_back_upload`
--
ALTER TABLE `ah_back_upload`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `ah_back_user`
--
ALTER TABLE `ah_back_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `ah_back_user_log`
--
ALTER TABLE `ah_back_user_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `ah_back_user_log`
--
ALTER TABLE `ah_home_user_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID';

--
-- 限制表 `ah_back_auth_assignment`
--
ALTER TABLE `ah_back_auth_assignment`
  ADD CONSTRAINT `ah_back_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `ah_back_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ah_back_auth_assignment_ibfk_2` FOREIGN KEY (`back_user_id`) REFERENCES `ah_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `ah_back_auth_item`
--
ALTER TABLE `ah_back_auth_item`
  ADD CONSTRAINT `ah_back_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `ah_back_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `ah_back_auth_item_child`
--
ALTER TABLE `ah_back_auth_item_child`
  ADD CONSTRAINT `ah_back_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `ah_back_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ah_back_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `ah_back_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `ah_back_ban`
--
ALTER TABLE `ah_back_ban`
  ADD CONSTRAINT `ah_back_ban_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `ah_back_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ah_back_ban_ibfk_2` FOREIGN KEY (`back_user_id`) REFERENCES `ah_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
