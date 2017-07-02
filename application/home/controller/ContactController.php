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
        return view('contact/contact',[
            'meta_title'=>'联系我们',
            'nav'=>'contact'
        ]);
    }

}
