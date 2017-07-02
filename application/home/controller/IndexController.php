<?php

namespace app\home\controller;

use app\common\controller\HomeController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class IndexController extends HomeController
{
    /**
     * 默认方法
     * @author Sir Fu
     */
    public function indexAction()
    {
        // 临时选择其他模板的布局功能
//        $this->view->engine->layout('layouts/index');
        return view('index/index',[
            'meta_title'=>'首页'
        ]);
    }

    /**
     * 默认方法
     * @author Sir Fu
     */
    public function homeAction()
    {
        return view('index/index-box');
    }

}
