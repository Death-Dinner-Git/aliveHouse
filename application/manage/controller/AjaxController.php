<?php

namespace app\manage\controller;

use app\common\controller\ManageController;

class AjaxController extends ManageController
{

    /**
     * @description 获取城市
     * @param null $level
     * @param null $name
     * @return \think\response\Json
     */
    public function getCityAction($level=null,$name=null)
    {
        $ret = [];
        $where = [];
        if ($name|| ($name = $this->getRequest()->get('name'))){
            $where = array_merge($where,['name'=>$name]);
        }
        if ($level|| ($level = $this->getRequest()->get('level'))){
            $where = array_merge($where,['level'=>$level]);
        }
        $cityList = \app\manage\model\City::getCityList($where);
        if (!empty($cityList)){
            foreach ($cityList as $key => $value){
                $ret[] = ['id'=>$key,'name'=>$value];
            }
        }
        return json($ret);
    }

    /**
     * @description 上传器
     * @return \think\response\Json
     */
    public function uploaderAction()
    {
        $images = [];
        foreach ($_FILES as $key=>$value){
            //是否是多传,否则是单传
            if(is_array($value['name'])){
                foreach ($value['name'] as $index => $item) {
                    $retItem = ['src'=>'/static/uploads/theme/new-house-max-bg.jpg','icon'=>'/static/images/upload-img.png','name'=>$value['name'][$index]];
                    $images[] = $retItem;
                }
            }else{
                $retItem = ['src'=>'/static/uploads/theme/new-house-max-bg.jpg','icon'=>'/static/images/upload-img.png','name'=>$value['name']];
                $images[] = $retItem;
            }
        }
        $ret = ['code'=>'1','msg'=>'成功','images'=>$images,'file'=>$_FILES];
        return json($ret);
    }

    /**
     * @description 手机
     * @return \think\response\Json
     */
    public function phoneAction()
    {
        $ret = ['code'=>'1','param'=>$_REQUEST];
        return json($ret);
    }

}
