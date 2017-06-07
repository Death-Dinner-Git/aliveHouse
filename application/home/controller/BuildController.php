<?php

namespace app\home\controller;

use app\common\controller\HomeController;

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

        ]);
    }

}
