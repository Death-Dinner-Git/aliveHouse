CREATE TABLE `hfzy_user_login_log` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
 `user_id` bigint(20) NOT NULL COMMENT '表user主键',
 `app` TINYINT(1) NULL DEFAULT '1' COMMENT '账户类型:1后台账户,前端用户',
 `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '路由',
 `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
 `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户端',
 `gets` text COLLATE utf8_unicode_ci COMMENT 'GET方法',
 `posts` text COLLATE utf8_unicode_ci COMMENT 'POST方法',
 `target` text CHARACTER SET utf8 COMMENT '目标',
 `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP',
 `created_at` datetime DEFAULT NULL COMMENT '创建时间',
 `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
 PRIMARY KEY (`id`),
 KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='登陆记录';

ALTER TABLE `hfzy_back_user` ADD `md5` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密匙' AFTER `token`;