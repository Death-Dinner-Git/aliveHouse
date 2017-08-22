<?php

namespace app\common\controller;

use app\common\controller\BaseController;

class PhoneController extends BaseController
{
    /**
     * 初始化方法
     * @author Sir Fu
     */
    protected function _initialize()
    {
        parent::_initialize();
        if ($this->getRequest()->ip() != '127.0.0.1'){
            config('app_debug',false);
        }
        // 前台模板
        $this->view->engine->layout('common@layouts/default-index');
        // 初始化
        $this->init('user');

        $this->setSession('user');

//        // 登录检测,未登录，跳转到登录
//        $this->isUser();

        // 获取当前访问地址
        $currentUrl = $this->getCurrentUrl();

        //兼容iframe
        $url = $this->getUrl();
        // 权限检测，首页不需要权限
        if (!$this->accessCheck()) {
            if (!('home/index/index' === strtolower($currentUrl) || $url === '/')) {
                $this->error('拒绝访问', url('home/Index/index'), [], '1');
            }
        }
    }

    /**
     * @param null $key
     * @return string|array|null
     */
    protected function getUser($key = null)
    {
        return $this->getIdentity($key , 'user');
    }

}
