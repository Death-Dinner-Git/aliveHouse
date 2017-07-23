<?php

// 全局扩展配置定义文件

defined('__URL__') or define('__URL__',$_SERVER['REQUEST_URI']);

return [
    // 当前请求地址
    'url'                   => __URL__,
];
