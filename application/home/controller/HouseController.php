<?php

namespace app\home\controller;

use app\home\controller\ManageController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class HouseController extends ManageController
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
