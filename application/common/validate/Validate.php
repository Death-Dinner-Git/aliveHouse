<?php

namespace app\common\validate;

use think\Loader;


class Validate extends \think\Validate
{

    /**
     * 实例化（分层）模型
     * @param string $name         Model名称
     * @param string $layer        业务层名称
     * @param bool   $appendSuffix 是否添加类名后缀
     * @param string $common       公共模块名
     * @return Object| \think\Validate
     * @throws \think\exception\ClassNotFoundException
     */
    public static function load($name = '', $layer = 'model', $appendSuffix = false, $common = 'common')
    {
        if ($name === ''){
            $name = get_called_class();
        }
        return Loader::model($name,$layer,$appendSuffix,$common);
    }

}