<?php

namespace app\vr\controller;

use app\common\controller\VrController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class SetController extends VrController
{
    /**
     * @author Sir Fu
     */
    public function userAction()
    {
        return view('set/user');
    }

}
