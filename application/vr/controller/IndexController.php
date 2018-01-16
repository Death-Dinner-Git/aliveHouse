<?php

namespace app\vr\controller;

use app\common\controller\VrController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class IndexController extends VrController
{
    /**
     * 首页
     * @author Sir Fu
     */
    public function indexAction()
    {
        return view('index/index');
    }

    /**
     * view
     * @author Sir Fu
     */
    public function viewAction()
    {
        return view('index/view');
    }

    /**
     * 用户
     * @author Sir Fu
     */
    public function userAction()
    {
        return view('index/user');
    }

    /**
     * @author Sir Fu
     */
    public function faqAction()
    {
        return view('index/faq');
    }
}
