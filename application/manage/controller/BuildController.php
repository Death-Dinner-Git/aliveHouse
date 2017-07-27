<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\manage\model\BuildingBase;
use app\manage\model\City;
use app\manage\model\BuildingDetail;
use app\manage\model\BuildingContent;
use app\manage\model\Images;

class BuildController extends ManageController
{

    public function hotAction(){}

    /**
     * @description 显示资源列表
     * @param string $name
     * @param string $city
     * @param string $address
     * @return \think\Response
     */
    public function indexAction($name = null, $city = null,$address = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 12;
        $param = ['name'=>'','city'=>'','address'=>''];
        $model = BuildingBase::load();
        if ($name && $name != ''){
            $param['name'] = trim($name);
            $nameWhere = ' `name` like '.' \'%'.$name.'%\'';
            $model->where($nameWhere);
        }
        if ($address && $address != ''){
            $param['address'] = trim($address);
            $nameWhere = ' `address` like '.' \'%'.$address.'%\'';
            $model->where($nameWhere);
        }
        $cityLists = City::getCityList();
        if ($city && $city != ''){
            $param['city'] = trim($city);
            if (in_array($city,array_keys($cityLists))){
                $where =  array_merge($where, ['city_id'=>$city]);
            }
        }
        $helper = BuildingBase::getHelper();
        $build = BuildingBase::load()->where(['id'=>'40'])->find();
        var_dump($build->toArray());
        var_dump($build->getCity->toArray());
        var_dump($build->getBuildingDetail->toArray());
        var_dump($build->getBuildingContent->toArray());
        var_dump($helper::toArray($build->getImages));

        $list = $model->where($where)->order('id DESC')->paginate($each);

        $this->assign('meta_title', "楼盘清单");
        $this->assign('param', $param);
        $this->assign('cityLists', $cityLists);
        $this->assign('list', $list);
        return view('build/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $lists = City::getCityList();
        if ($this->getRequest()->isPost()){
            //
            $model = new BuildingBase();
            $base = $model->filter($_POST);
            $base['is_delete'] = '1';
            $base['updated_at'] = date('Y-m-d H:i:s');
            $base['created_at'] = date('Y-m-d H:i:s');
            if ($base){
                $validate = BuildingBase::getValidate();
                $validate->scene('create');
                if ($validate->check($base) && $model->save($base)){
                    $prefix = '/static/uploads/buildingDetail/'.$model->id.'/';
                    //
                    $detailModel = new BuildingDetail();
                    $detail = $detailModel->filter($_POST);
                    $detail['building_base_id'] = $model->id;
                    $to = $prefix.pathinfo($detail['logo'],PATHINFO_BASENAME);
                    $detail['logo'] = $to;
                    $this->copy($detail['logo'],$to);
                    $detail['updated_at'] = date('Y-m-d H:i:s');
                    $detail['created_at'] = date('Y-m-d H:i:s');
                    //
                    $contentModel = new BuildingContent();
                    $content = $contentModel->filter($_POST);
                    $content['building_base_id'] = $model->id;
                    $ImagesModel = new Images();
                    $urls = isset($_POST['url']) ? explode('|',$_POST['url']) : [];
                    $images = [];
                    foreach ($urls as $url){
                        $item = [];
                        $item['target_id'] = $model->id;
                        $item['type'] = '1';
                        $to = $prefix.pathinfo($url,PATHINFO_BASENAME);
                        $item['url'] = $to;
                        $this->copy($url,$to);
                        $icon = pathinfo($url,PATHINFO_DIRNAME).'/'.pathinfo($url,PATHINFO_FILENAME).'_icon.'.pathinfo($url,PATHINFO_EXTENSION);
                        $to = $prefix.pathinfo($icon,PATHINFO_BASENAME);
                        $item['url_icon'] = $to;
                        $this->copy($icon,$to);
                        $item['url_title'] = $model->title;
                        $item['created_at'] = $model->created_at;
                        $images[] = $item;
                    }
                    $detailModel->save($detail);
                    $contentModel->save($content);
                    $ImagesModel->saveAll($images);
                    $this->success('添加成功','create',$model,1);
                }else{
                    $error = $validate->getError();
                    if (empty($error)){
                        $error = $model->getError();
                    }
                    $this->error($error, 'create','',1);
                }
            }
        }
        return view('build/create',['meta_title'=>'添加楼盘','meta_util'=>'false','lists'=>$lists,]);
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function viewAction($id)
    {
        $this->assign('meta_title', "详情");
        $model = BuildingBase::load()->where(['id'=>$id])->find();
        return view('config/view',['model'=>$model]);
    }

    /**
     * 保存更新的资源
     *
     * @param  int  $id
     * @return \think\Response|string
     */
    public function updateAction($id)
    {
        $where = ['is_delete'=>'1'];
        $lists = City::getCityList();
        $model = BuildingBase::load()->where(['id'=>$id])->where($where)->find();
        if (!$model){
            return '';
        }

        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['Building']) ? $_POST['Building'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = BuildingBase::getValidate();
                $validate->scene('update');
                if ($validate->check($data) && $model::update($data,['id'=>$id])){
                    $this->success('更新成功','create','',1);
                }else{
                    $error = $validate->getError();
                    if (empty($error)){
                        $error = $model->getError();
                    }
                    $this->error($error, 'create','',1);
                }
            }
        }
        return view('build/update',['meta_title'=>'更新楼盘','model'=>$model,'lists'=>$lists,]);
    }

    /**
     * 删除指定资源
     * @return \think\response\Json
     */
    public function deleteAction()
    {
        $id = isset($_POST['id']) ? $_POST['id'] : [];
        $ret = ['status'=>0,'info'=>'删除失败'];
        if ($this->getRequest()->isAjax()){
            $where['id'] = ['in',implode(',',$id)];
            $result = BuildingBase::update(['is_delete'=>'0'],$where);
            if ($result){
                $ret = ['status'=>1,'info'=>'删除成功'];
            }
        }
        if (empty($id)){
            $ret = ['status'=>1,'info'=>'删除成功'];
        }
        return json($ret);
    }

    /**
     * 图片上传
     * @return \think\response\Json
     */
    public function uploadAction(){
        $config = [];
        if (isset($_REQUEST['file'])){
            $config['fileField'] = $_REQUEST['file'];
        }
        $ret = \app\common\components\Uploader::action($config);

        return json($ret);
    }

}
