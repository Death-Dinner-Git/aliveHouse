<?php

namespace app\common\controller;

use app\common\controller\BaseController;

class HomeController extends BaseController
{
    /**
     * 初始化方法
     * @author Sir Fu
     */
    protected function _initialize()
    {
        parent::_initialize();
        $this->view->engine->layout('common@layouts/default-index');
    }
}
