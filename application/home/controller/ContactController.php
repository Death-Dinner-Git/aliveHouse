<?php

namespace app\home\controller;

use app\common\controller\HomeController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class ContactController extends HomeController
{
    /**
     * 默认方法
     * @author Sir Fu
     */
    public function contactAction()
    {
        return view('contact');
    }

}
