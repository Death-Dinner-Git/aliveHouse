<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\common\model\Model;


/**
 * 后台默认控制器
 * @author Sir Fu
 */
class IndexController extends ManageController
{

    /**
     * 默认方法
     * @author Sir Fu
     */
    public function indexAction()
    {
        $this->assign('meta_title', "后台首页");
        return view('index');
    }

    /**
     * @description 控制面板
     * @author Sir Fu
     */
    public function homeAction()
    {
        $this->assign('meta_title', "控制面板");
        return view('home');
    }

    /**
     * @description 常见问题
     * @param $page
     * @return \think\Request
     * @author Sir Fu
     */
    public function faqAction($page = 0)
    {
        $this->assign('meta_title', "常见问题");
        if ($this->getRequest()->isAjax()){
            $ret = ['data'=>[
                [
                    'group'=>'分组一',
                    'question'=>[
                        [
                            'title'=>'标题一',
                            'item'=>[
                                'some about...',
                                'some about...',
                                'some about...'
                            ]
                        ],
                        [
                            'title'=>'标题二',
                            'item'=>[
                                'some about...',
                                'some about...',
                                'some about...'
                            ]
                        ]
                    ]
                ],
                [
                    'group'=>'分组二',
                    'question'=>[
                        [
                            'title'=>'标题一',
                            'item'=>[
                                'some about...',
                                'some about...',
                                'some about...'
                            ]
            ],
                        [
                            'title'=>'标题二',
                            'item'=>[
                                'some about...',
                                'some about...',
                                'some about...'
                            ]
                        ]
                    ]
                ],
            ]];
            return json($ret);
        }
        return view('faq');
    }

    /**
     * @description 菜单列表
     * @author Sir Fu
     */
    public function navAction()
    {
        return $this->nav();
    }
}
