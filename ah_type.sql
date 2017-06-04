-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2017-06-04 21:44:12
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
-- 表的结构 `ah_take_order`
--

CREATE TABLE IF NOT EXISTS `ah_take_order` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
  `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
  `guest_id` bigint(20) NOT NULL COMMENT '客户表ID',
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
-- 表的结构 `ah_type`
--

CREATE TABLE IF NOT EXISTS `ah_type` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;2=失效,1=有效;默认1;',
  `group` tinyint(1) NOT NULL DEFAULT '1' COMMENT '父级类型:0=失效,1=预定,2=客户,3=房东,4=新房,5=二手房,6=楼房,7=客服,8=;默认1;',
  `name` varchar(32) NOT NULL COMMENT '标签',
  `description` varchar(255) DEFAULT NULL COMMENT '详细描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ah_take_order`
--
ALTER TABLE `ah_take_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `back_user_id` (`back_user_id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `ah_type`
--
ALTER TABLE `ah_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ah_take_order`
--
ALTER TABLE `ah_take_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `ah_type`
--
ALTER TABLE `ah_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 限制导出的表
--

--
-- 限制表 `ah_take_order`
--
ALTER TABLE `ah_take_order`
  ADD CONSTRAINT `ah_take_order_ibfk_1` FOREIGN KEY (`back_user_id`) REFERENCES `ah_back_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ah_take_order_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `ah_guest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
