<?php

namespace app\home\controller;

use app\common\controller\HomeController;
use app\common\model\Slider;

/**
 * 默认控制器
 * @author Sir Fu
 */
class BuildController extends HomeController
{
    /**
     * 默认方法
     * @author Sir Fu
     */
    public function buildAction()
    {
        return view('build/build',[
            'meta_title'=>'楼盘',
            'nav'=>'build'
        ]);
    }

}
