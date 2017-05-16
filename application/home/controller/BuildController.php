<?php

namespace app\home\controller;

use app\home\controller\ManageController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class BuildController extends ManageController
{
    /**
     * 默认方法
     * @author Sir Fu
     */
    public function buildAction()
    {
        return view('build');
    }

}
