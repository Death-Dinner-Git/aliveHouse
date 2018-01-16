<?php

namespace app\vr\controller;

use app\common\controller\VrController;

/**
 * 默认控制器
 * @author Sir Fu
 */
class TourController extends VrController
{
    public $identity = false;

    /**
     * 默认方法
     * @author Sir Fu
     */
    public function indexAction()
    {
        $id = isset($_REQUEST['id']) ? $_REQUEST['id'] : '11';
        $this->unUseLayout();
        return view('tour/index',[
            'id'=>$id,
        ]);
    }

}
