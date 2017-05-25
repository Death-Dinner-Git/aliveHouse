
CREATE TABLE `ah_guest` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `server` tinyint(1) NOT NULL DEFAULT '1' COMMENT '服务;0=已正式客户,1=待开发客户;默认1;',
 `ID_cards` VARCHAR(255) DEFAULT NULL COMMENT '身份证',
 `real_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
 `phone` VARCHAR(32) DEFAULT NULL COMMENT '手机号码',
 `nickname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
 `address` VARCHAR(32) DEFAULT NULL COMMENT '地址',
 `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
 `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
 `region_id` bigint(20) NOT NULL COMMENT '全国地区表ID',
 `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;0=过客,1=客户;默认1;',
 `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '等级;0=贵宾,1=普通;默认1;',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';


CREATE TABLE `ah_guest_server` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `guest_id` bigint(20) NOT NULL COMMENT '客户表ID',
 `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户服务表';


CREATE TABLE `ah_walk` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `guest_id` bigint(20) NOT NULL COMMENT '客户表ID',
 `on_server` tinyint(1) NOT NULL DEFAULT '1' COMMENT '跟进;0=未跟进,1=已跟进;默认1;',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户跟进表';


CREATE TABLE `ah_guest_park` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `guest_id` bigint(20) NOT NULL COMMENT '客户表ID',
 `label_id` bigint(20) NOT NULL COMMENT '标签表ID',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='';


CREATE TABLE `ah_landlord` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `ID_cards` VARCHAR(255) DEFAULT NULL COMMENT '身份证',
 `real_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
 `phone` VARCHAR(32) DEFAULT NULL COMMENT '手机号码',
 `nickname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
 `address` VARCHAR(32) DEFAULT NULL COMMENT '地址',
 `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
 `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `city_id` bigint(20) NOT NULL COMMENT '城市表ID',
 `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;0=过客,1=客户;默认1;',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房东表';


CREATE TABLE `ah_landlord_server` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `guest_id` bigint(20) NOT NULL COMMENT '房东表ID',
 `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房东服务表';


CREATE TABLE `ah_building_base` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;0=,1=;默认1;',
 `city_id` bigint(20) NOT NULL COMMENT '城市表ID',
 `name` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '楼盘名',
 `address` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '地址',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘表';


CREATE TABLE `ah_building_detail` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `building_base_id` bigint(20) NOT NULL COMMENT '楼盘表ID',
 `description` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
 `address` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
 `url` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '封面宣传',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘详情表';


CREATE TABLE `ah_new_house` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `building_base_id` bigint(20) NOT NULL COMMENT '楼盘表ID',
 `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;0=,1=;默认1;',
 `room` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '房号',
 `description` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
 `address` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '地址',
 `url` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '封面宣传',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新房表';


CREATE TABLE `ah_second_hand_house` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `landlord_id` bigint(20) NOT NULL COMMENT '房东表ID',
 `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;0=,1=;默认1;',
 `city_id` bigint(20) NOT NULL COMMENT '城市表ID',
 `address` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '地址',
 `room` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '房号',
 `description` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
 `url` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '封面宣传',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='二手房表';


CREATE TABLE `ah_house_better` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `building_base_id` bigint(20) NOT NULL COMMENT '楼盘表ID',
 `description` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
 `address` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
 `url` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '封面宣传',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房子装修表';


CREATE TABLE `ah_take_order` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
 `guest_id` bigint(20) NOT NULL COMMENT '客户表ID',
 `order_number` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
 `house_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型;1=新房,2=二手房;默认1;',
 `goods_id` bigint(20) NOT NULL COMMENT '目标商品ID',
 `deal_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '交易状态;0=失败,1=成功;默认1;',
 `money` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '交易金额',
 `description` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '备注',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易表';


CREATE TABLE `ah_slider` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
 `parent` varchar(125) NOT NULL COMMENT '父级类型',
 `data` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '类型;0:默认,1:投放,2:广告库,',
 `status` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '状态;0:预定,1:上架,2:下架,3:保存’',
 `name` varchar(50) NOT NULL COMMENT '地区名称',
 `region_id` int(20) NOT NULL DEFAULT '0' COMMENT '地区表ID',
 `level` enum('0','1','2') DEFAULT '0' COMMENT '等级;0:默认,1:省级,2:地区',
 `title` varchar(80) DEFAULT NULL COMMENT '标题',
 `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
 `target` varchar(255) DEFAULT NULL COMMENT '目标地址',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime DEFAULT NULL,
 `from_time` varchar(10) DEFAULT NULL COMMENT '开始时间',
 `end_time` varchar(10) DEFAULT NULL COMMENT '结束时间',
 `order` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '拖拽顺序',
 `province` varchar(64) DEFAULT NULL COMMENT '省',
 `city` varchar(64) DEFAULT NULL COMMENT '市',
 `county` varchar(64) DEFAULT NULL COMMENT '地区',
 PRIMARY KEY (`id`),
 KEY `parent` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告表';


CREATE TABLE `ah_hot` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `back_user_id` bigint(20) NOT NULL COMMENT '后台管理员ID',
 `parent` varchar(125) NOT NULL COMMENT '父级类型',
 `data` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '类型;0:默认,1:投放,2:广告库,',
 `status` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '状态;0:预定,1:上架,2:下架,3:保存’',
 `name` varchar(50) NOT NULL COMMENT '地区名称',
 `region_id` int(20) NOT NULL DEFAULT '0' COMMENT '地区表ID',
 `level` enum('0','1','2') DEFAULT '0' COMMENT '等级;0:默认,1:省级,2:地区',
 `title` varchar(80) DEFAULT NULL COMMENT '标题',
 `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
 `target` varchar(255) DEFAULT NULL COMMENT '目标地址',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime DEFAULT NULL,
 `from_time` varchar(10) DEFAULT NULL COMMENT '开始时间',
 `end_time` varchar(10) DEFAULT NULL COMMENT '结束时间',
 `order` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '拖拽顺序',
 `province` varchar(64) DEFAULT NULL COMMENT '省',
 `city` varchar(64) DEFAULT NULL COMMENT '市',
 `county` varchar(64) DEFAULT NULL COMMENT '地区',
 PRIMARY KEY (`id`),
 KEY `parent` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐表';


CREATE TABLE `ah_label` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时效;0=失效,1=有效;默认1;',
 `building_base_id` bigint(20) NOT NULL COMMENT '楼盘表ID',
 `description` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
 `address` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
 `url` VARCHAR(255) COLLATE utf8_general_ci NOT NULL COMMENT '封面宣传',
 `created_at` datetime NOT NULL COMMENT '创建时间',
 `updated_at` datetime NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';