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

}
