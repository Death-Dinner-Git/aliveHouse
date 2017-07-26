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
        $config = [];
        if (isset($_REQUEST['file'])){
            $config['fileField'] = $_REQUEST['file'];
        }
        $res = \app\common\components\Uploader::action($config);

        //是否是多传,否则是单传
        if (isset($res['code'])){
            if ($res['code'] == '1'){
                $retItem = [
                    'src'=>$res['url'],
                    'icon'=>$res['url_icon'],
                    'name'=>$res['tmp_name']
                ];
                $images[] = $retItem;
            }
            $ret['code'] = $res['code'];
            $ret['msg'] = $res['msg'];
        }else{
            foreach ($res as $key=>$value){
                if ($value['code'] == '1'){
                    $retItem = [
                        'src'=>$value['url'],
                        'icon'=>$value['url_icon'],
                        'name'=>$value['tmp_name']
                    ];
                    $images[] = $retItem;
                }
                $ret['code'] = $value['code'];
                $ret['msg'] = $value['msg'];
            }
        }
        $ret['images'] = $images;
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
