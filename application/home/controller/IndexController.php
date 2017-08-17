<?php

namespace app\home\controller;

use app\common\controller\HomeController;
use app\common\model\Slider;
use app\common\model\HandHouse;
use app\common\model\House;
use app\common\model\News;

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
        $list = [];
        $where = ['type'=>'2'];
        $slider = Slider::getSlider($where);
        foreach ($slider as $item){
            $list[] = [
                'title'=>$item['title'],
                'desc'=>$item['description'],
                'target'=>$item['target'],
                'url'=>$item['url'],
            ];
        }
        if (empty($list)){
            $where = ['type'=>'1'];
            $slider = Slider::getSlider($where);
            foreach ($slider as $item){
                $list[] = [
                    'title'=>$item['title'],
                    'desc'=>$item['description'],
                    'target'=>$item['target'],
                    'url'=>$item['url'],
                ];
            }
        }
        if (empty($list)){
            $list[] = [
                'title'=>'',
                'desc'=>'',
                'target'=>'',
                'url'=>'/static/uploads/theme/home/theme-banner.jpg',
            ];
        }
        $slider = json_encode($list);

        //二手房
        $handHouseModel = HandHouse::load();
        $handHouse = $handHouseModel->where([])->select();

        //新房
        $houseModel = House::load();
        $house = $houseModel->where([])->select();

        // 资讯
        $newsModel = News::load();
        $news = $newsModel->where([])->select();

        return view('index/index',[
            'meta_title'=>'首页',
            'slider'=>$slider,
            'handHouse'=>$handHouse,
            'house'=>$house,
            'news'=>$news,
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

    /**
     * @description The APP 全局MISS路由，一个父级操作.
     * @return string
     */
    public function missAction()
    {
        return view('index/index');
    }

}
