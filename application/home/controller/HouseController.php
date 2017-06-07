<?php

namespace app\home\controller;

use app\common\controller\HomeController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class HouseController extends HomeController
{
    /**
     * 默认方法
     * @author Sir Fu
     */
    public function newHouseAction()
    {
        return view('newHouse');
    }

    /**
     * 默认方法
     * @author Sir Fu
     */
    public function secondHandHouseAction()
    {
        return view('secondHandHouse');
    }

}
