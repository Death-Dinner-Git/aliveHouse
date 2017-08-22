<?php

namespace app\phone\controller;

use app\common\controller\PhoneController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class IndexController extends PhoneController
{
    /**
     * 默认方法
     * @author Sir Fu
     */
    public function indexAction()
    {
        return json([]);
    }

    /**
     * @description The APP 全局MISS路由，一个父级操作.
     * @return string
     */
    public function missAction()
    {
        return json([]);
    }

}
