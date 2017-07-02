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
        return view('house/newHouse',[
            'meta_title'=>'新房',
            'nav'=>'new-house'
        ]);
    }

    /**
     * 默认方法
     * @author Sir Fu
     */
    public function secondHandHouseAction()
    {
        return view('house/secondHandHouse',[
            'meta_title'=>'二手房',
            'nav'=>'second-house'
        ]);
    }

}
