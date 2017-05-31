-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2017-06-01 00:52:15
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
-- 表的结构 `ah_menu`
--

CREATE TABLE IF NOT EXISTS `ah_menu` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `parent` int(11) DEFAULT NULL COMMENT '上级',
  `route` varchar(256) DEFAULT NULL COMMENT '路由',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `type` tinyint(1) DEFAULT '1' COMMENT '菜单类型',
  `data` text COMMENT '补充'
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='菜单表';

--
-- 转存表中的数据 `ah_menu`
--

INSERT INTO `ah_menu` (`id`, `name`, `parent`, `route`, `order`, `type`, `data`) VALUES
(1, '控制面板', NULL, '/manage/index/home', 0, 1, '{"li_class":"","a_class":"Index-Home","i_class":"fa fa-circle-o"}'),
(2, '业务服务', NULL, NULL, 1, 1, '{"li_class":"","a_class":"User","i_class":"fa fa-circle-o"}'),
(3, '个人信息', NULL, NULL, 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(4, '信息录入', NULL, NULL, 3, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(5, '房源管理', NULL, NULL, 4, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(6, '客户管理', NULL, NULL, 5, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(7, '反馈管理', NULL, NULL, 6, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(8, '交易管理', NULL, NULL, 7, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(9, '员工管理', NULL, NULL, 8, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(10, '网站维护', NULL, NULL, 9, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(11, '系统配置', NULL, NULL, 10, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(12, '常见问题', NULL, NULL, 11, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(30, '数据统计', 2, '/manage/data/index', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(31, '跟进服务', 2, '/manage/services/onServices', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(32, '客户抢接', 2, '/manage/guest/index', 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(33, '房源抢接', 2, '/manage/house/index', 3, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(34, '反馈抢接', 2, '/manage/contact/index', 4, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(50, '我的信息', 3, '/manage/user/view', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(51, '修改密码', 3, '/manage/user/resetPassword', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(52, '日志信息', 3, '/manage/user/log', 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(70, '客户录入', 4, '/manage/data/view', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(71, '房东录入', 4, '/manage/guest/import', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(72, '新房录入', 4, '/manage/guest/import', 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(73, '二手房录入', 4, '/manage/guest/import', 3, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(74, '出租录入', 4, '/manage/guest/import', 4, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(75, '楼盘录入', 4, '/manage/guest/import', 5, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(76, '录入清单', 4, '/manage/guest/import', 6, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(90, '我的房源', 5, '/manage/guest/import', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(91, '新房录入', 5, '/manage/guest/import', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(92, '二手房录入', 5, '/manage/guest/import', 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(93, '出租录入', 5, '/manage/guest/import', 3, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(94, '房源抢接', 5, '/manage/guest/import', 4, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(95, '房源转接', 5, '/manage/guest/import', 5, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(96, '房源接收', 5, '/manage/guest/import', 6, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(110, '我的客户', 6, '/manage/guest/import', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(111, '客户录入', 6, '/manage/guest/import', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(112, '房东录入', 6, '/manage/guest/import', 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(113, '客户分配', 6, '/manage/guest/import', 3, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(114, '客户抢接', 6, '/manage/guest/import', 4, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(115, '客户转接', 6, '/manage/guest/import', 5, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(116, '房源接收', 6, '/manage/guest/import', 6, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(130, '我的反馈', 7, '/manage/guest/import', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(131, '反馈抢接', 7, '/manage/guest/import', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(132, '反馈分配', 7, '/manage/guest/import', 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(150, '我的交易', 8, '/manage/guest/import', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(151, '交易清单', 8, '/manage/guest/import', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(170, '管理员清单', 9, '/manage/guest/import', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(171, '添加管理员', 9, '/manage/guest/import', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(190, '企业信息', 10, '/manage/guest/import', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(191, '新房资讯', 10, '/manage/guest/import', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(192, '二手房资讯', 10, '/manage/guest/import', 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(193, '出租资讯', 10, '/manage/guest/import', 3, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(194, '楼盘资讯', 10, '/manage/guest/import', 4, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(195, '楼市资讯', 10, '/manage/guest/import', 5, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(196, '客户反馈', 10, '/manage/guest/import', 6, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(197, '友情链接', 10, '/manage/guest/import', 7, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(198, '日记管理', 10, '/manage/guest/import', 8, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(199, '网站主题', 10, '/manage/maintain/theme', 9, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(200, '生成页面', 10, '/manage/maintain/page', 10, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(201, '数据库管理', 10, '/manage/maintain/database', 11, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(202, '清理缓存', 10, '/manage/maintain/cache', 12, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(210, '基本设置', 11, '/manage/config/index', 0, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(211, '站点管理', 11, '/manage/settings/site', 1, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(212, '安全设置', 11, '/manage/settings/safety', 2, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(213, '短信接口设置', 11, '/manage/settings/message', 3, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(214, '推送接口设置', 11, '/manage/settings/push', 4, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(215, '邮箱设置', 11, '/manage/settings/email', 5, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(216, '系统日志管理', 11, '/manage/settings/log', 6, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}'),
(217, '防采集管理', 11, '/manage/settings/defend', 7, 1, '{"li_class":"","a_class":"Back","i_class":"fa fa-circle-o"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ah_menu`
--
ALTER TABLE `ah_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ah_menu`
--
ALTER TABLE `ah_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=199;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
