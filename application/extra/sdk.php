<?php


if (!defined('THINK_PATH')) exit();

//定义回调URL通用的URL

define('URL_CALLBACK','/home/sdk/login?type=');

return [

    // 新浪微博配置
    'sina' => [
        // 应用注册成功后分配的 APP ID
        'app_key'    => '',
        // 应用注册成功后分配的KEY
        'app_secret' => '',
        // 定义回调URL通用的URL
        'callback'   => URL_CALLBACK . 'sina',
    ],

    // 腾讯QQ登录配置
    'qq' => [
        // 应用注册成功后分配的 APP ID
        'app_key'    => '',
        // 应用注册成功后分配的KEY
        'app_secret' => '',
        // 定义回调URL通用的URL
        'callback'   => URL_CALLBACK . 'qq',
    ],

    // 微博配置
    'wechat' => [
        // 应用注册成功后分配的 APP ID
        'app_key'    => '',
        // 应用注册成功后分配的KEY
        'app_secret' => '',
        // 定义回调URL通用的URL
        'callback'   => URL_CALLBACK . 'wechat',
    ],

];