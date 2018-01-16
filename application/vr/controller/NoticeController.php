<?php

namespace app\vr\controller;

use app\common\controller\VrController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class NoticeController extends VrController
{
    /**
     * @author Sir Fu
     */
    //测试下
    public function indexAction()
    {
        return view('notice/index');
    }

}
