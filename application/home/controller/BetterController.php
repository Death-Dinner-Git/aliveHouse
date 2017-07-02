<?php

namespace app\home\controller;

use app\common\controller\HomeController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class BetterController extends HomeController
{
    /**
     * 默认方法
     * @author Sir Fu
     */
    public function betterAction()
    {
        return view('better/better',[
            'meta_title'=>'家装',
            'nav'=>'better'
        ]);
    }

}
