<?php

// 用户登录扩展配置定义文件
return [

    // Identity 位置
    'default_user_model'            => '\app\manage\model\Identity',
    // 登录路由
    'loginUrl'                        => 'manage/login/login',
    // 退出路由
    'logoutUrl'                       => 'manage/login/logout',
    // 注册路由
    'registerUrl'                     => 'manage/login/register',
    // 当前用户对象SESSION　key
    '_identity'                       => '__IDENTITY__',
    // 当前用户 自动登录 SESSION　key
    '_auth_key'                       => '__AUTH_KEY__',
    // 当前用户 登录有效期 SESSION　key
    '_duration'                       => '__DURATION__',
    // 当前用户 登录 默认有效期时间
    '_default_duration'              => '1440',
    // 记住我 当前用户 登录 默认有效期时间
    '_rememberMe_duration'          => 60*60*24*7,
    // 重置密码 默认有效期时间
    '_passwordResetTokenExpire'    => 60*60*2,
    // 登录成功 返回URL
    '_manage_url'                    => '__MANAGE_URL__',
    // 是否自动登录
    '_auto_login'                    => true,

];
