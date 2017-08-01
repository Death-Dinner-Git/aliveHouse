<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\manage\model\NewHouse;
use app\manage\model\SecondHandHouse;
use app\manage\model\Images;
use app\manage\model\City;

class HouseController extends ManageController
{

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function superAction()
    {
        //
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function servicesAction()
    {
        //
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function transferAction()
    {
        //
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function receiveAction()
    {
        //
    }

    /**
     * @description 显示资源列表
     * @param string $name
     * @param string $type
     * @param string $app
     * @return \think\Response
     */
    public function indexAction($name = null, $type = null,$app = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 12;
        $param = ['name'=>'','type'=>'','app'=>''];
        $model = NewHouse::load();
        if ($name && $name != ''){
            $param['name'] = trim($name);
            $nameWhere = ' `name` like '.' \'%'.$name.'%\''.' or `title` like '.' \'%'.$name.'%\' ';
            $model->where($nameWhere);
        }
        $typeLists = NewHouse::getTypeList();
        if (isset($lists[0])){
            unset($lists[0]);
        }
        if ($type && $type != ''){
            $param['type'] = trim($type);
            if (in_array($type,array_keys($lists))){
                $where =  array_merge($where, ['type'=>$type]);
            }
        }
        $cityLists = \app\manage\model\City::getCityList();

        $list = $model->where($where)->order('id DESC')->paginate($each);

        $this->assign('param', $param);
        $this->assign('typeLists', $typeLists);
        $this->assign('cityLists', $cityLists);
        $this->assign('list', $list);
        return view('house/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @param $type int
     * @return \think\Response
     */
    public function createAction($type = 1)
    {
        $model = new NewHouse();
        if ($this->getRequest()->isPost()){
            //
            $base = $model->filter($_POST);
            $base['is_delete'] = '1';
            $base['updated_at'] = date('Y-m-d H:i:s');
            $base['created_at'] = date('Y-m-d H:i:s');
            if ($base){
                $validate = NewHouse::getValidate();
                $validate->scene('create');
                if ($validate->check($base) && $model->save($base)){
                    $prefix = '/static/uploads/house/'.$model->id.'/';
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
        $cityLists = City::getCityList();
        return view('house/create',['meta_title'=>'添加房源','model'=>$model,'cityLists'=>$cityLists]);
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
        $model = NewHouse::load()->where(['id'=>$id])->find();
        return view('house/view',['model'=>$model]);
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
        $model = new NewHouse();
        $lists = NewHouse::getTypeList();
        $model = NewHouse::load()->where(['id'=>$id])->where($where)->find();
        if (!$model){
            return '';
        }

        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['NewHouse']) ? $_POST['NewHouse'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = NewHouse::getValidate();
                $validate->scene('update');
                if ($validate->check($data) && NewHouse::update($data,['id'=>$id])){
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
        return view('house/update',['meta_title'=>'编辑标签','model'=>$model,'lists'=>$lists]);
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
            $result = NewHouse::update(['is_delete'=>'0'],$where);
            if ($result){
                $ret = ['status'=>1,'info'=>'删除成功'];
            }
        }
        if (empty($id)){
            $ret = ['status'=>1,'info'=>'删除成功'];
        }
        return json($ret);
    }
}
