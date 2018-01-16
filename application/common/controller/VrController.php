<?php

namespace app\common\controller;

use app\common\controller\BaseController;

class VrController extends BaseController
{

    //模块身份标识
    public $identity = 'vr';

    /**
     * 初始化方法
     * @author Sir Fu
     */
    protected function _initialize()
    {
        parent::_initialize();
        if ($this->getRequest()->ip() != '127.0.0.1') {
            config('app_debug', false);
        }

        // 初始化
        $this->init();

        // 设置SESSION
        $this->setSession();

        // 登录检测,未登录，跳转到登录
        if ($this->identity !== false){
            $this->isUser();
        }

        // 默认使用布局
        $this->useLayoutIndex();

        if (defined('IS_AJAX')){
            if (!IS_AJAX){
            }
        }
    }

    public function useLayoutIndex(){
        // 要使用布局
        $this->view->engine->layout('common@layouts/vr-index');
    }

    public function useLayoutMain(){
        // 不使用布局
        $this->view->engine->layout('common@layouts/vr-main');
    }

    public function unUseLayout(){
        // 不使用布局
        $this->view->engine->layout(false);
    }

    /**
     * @param null $key
     * @return string|array|null
     */
    protected function getUser($key = null)
    {
        if ($this->identity === false){
            return null;
        }
        return $this->getIdentity($key);
    }

}
