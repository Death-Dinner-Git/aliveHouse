<?php

return [
    //'配置项'=>'配置值'
    'URL_MODEL' => 0, // 如果你的环境不支持PATHINFO 请设置为3
    'DB_TYPE' => 'mysql',
    'DB_HOST' => 'localhost,localhost',
    'DB_NAME' => 'wofang',
    'DB_USER' => 'wofang_local,wofang_local',
    'DB_PWD' => 'wf123456,wf123456',
    'DB_PORT' => '3306',
    'DB_PREFIX' => 'wf_',
    'DB_RW_SEPARATE' => true,
    'DB_DEPLOY_TYPE' => 1,
    'URL_HTML_SUFFIX' => '',
    'FTP_IMAGES' => false,
    'FTP_IMAGES_SERVER' => '10.241.211.156',
    'FTP_IMAGES_USERNAME' => 'wofang.com',
    'FTP_IMAGES_PWD' => 'wo!*fang#com|mypwww',
    'FTP_IMAGES_PORT' => '3012',
    'FTP_IMAGES_PASV' => true,
    'FTP_IMAGES_SSL' => false,
    'FTP_IMAGES_TIMEOUT' => 60,
    'TMPL_PARSE_STRING' => [
        '__WWWURL__' => 'http://www.wf.com',
        '__STATICSURL__' => 'http://statics.wf.com',
        '__IMAGEURL__' => 'http://images.wofangwang.com',
        '__TEMPURL__' => "http://temp.wf.com",
        '__NEWSURL__' => "http://www.wf.com/news",
        '__SITEDOMAIN__' => ".wf.com",
        '__SALEHOUSEURL__' => "http://sale.wf.com",
        '__HIREHOUSEURL__' => "http://hire.wf.com",
        '__GUANJIAURL__' => "http://guanjia.wf.com",
        '__SHOPURL__' => "http://shop.wf.com",
    ]
];

