<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\manage\model\Guest;

use app\manage\model\GuestServer;
use app\manage\model\TakeOrder;
use app\manage\model\Walk;

class GuestController extends ManageController
{

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function importAction()
    {
        //
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function assignAction()
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
    public function onServicesAction()
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
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function logAction()
    {
        //
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function logDeleteAction()
    {
        //
    }


    /**
     * @description 显示资源列表
     * @param int $pageNumber
     * @param string $name
     * @param string $city
     * @param string $address
     * @return \think\Response
     */
    public function indexAction($pageNumber = 1,$name = null, $city = null,$address = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 12;
        $param = ['name'=>'','city'=>'','address'=>''];
        $query = Guest::load();
        if ($name && $name != ''){
            $param['name'] = trim($name);
            $nameWhere = ' `name` like '.' \'%'.$name.'%\'';
            $query = $query->where($nameWhere);
        }
        if ($address && $address != ''){
            $param['address'] = trim($address);
            $nameWhere = ' `address` like '.' \'%'.$address.'%\'';
            $query = $query->where($nameWhere);
        }
        $lists = Guest::getLevelList();
        if ($city && $city != ''){
            $param['city'] = trim($city);
            if (in_array($city,array_keys($lists))){
                $where =  array_merge($where, ['city_id'=>$city]);
            }
        }
        $typeLists = Guest::getTypeList();
        $serverLists = Guest::getServiceList();

        $providerModel = clone $query;
        $count = $query->where($where)->count();
        $dataProvider = $providerModel->where($where)->page($pageNumber,$each)->select();

        $this->assign('meta_title', "楼盘清单");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('param', $param);
        $this->assign('lists', $lists);
        $this->assign('typeLists', $typeLists);
        $this->assign('serverLists', $serverLists);
        return view('guest/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $model = new Guest();
        $lists = Guest::getLevelList();
        $typeLists = Guest::getTypeList();
        $serverLists = Guest::getServiceList();
        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['Guest']) ? $_POST['Guest'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = Guest::getValidate();
                $validate->scene('create');
                if ($validate->check($data) && $model->save($data)){
                    $this->success('添加成功','create','',1);
                }else{
                    $error = $validate->getError();
                    if (empty($error)){
                        $error = $model->getError();
                    }
                    $this->error($error, 'create','',1);
                }
            }
        }
        return view('guest/create',['meta_title'=>'添加客户','lists'=>$lists, 'typeLists'=>$typeLists, 'serverLists'=>$serverLists]);
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
        $model = Guest::load()->where(['id'=>$id])->find();
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
        $lists = Guest::getLevelList();
        $typeLists = Guest::getTypeList();
        $serverLists = Guest::getServiceList();
        $model = Guest::load()->where(['id'=>$id])->where($where)->find();
        if (!$model){
            return '';
        }
        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['Building']) ? $_POST['Building'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = Guest::getValidate();
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
        return view('guest/update',[
            'meta_title'=>'添加客户',
            'model'=>$model,
            'lists'=>$lists,
            'typeLists'=>$typeLists,
            'serverLists'=>$serverLists
        ]);

    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function deleteAction($id)
    {
        $ret = ['code'=>0,'msg'=>'删除失败','delete_id'=>$id];
        if ($this->getRequest()->isAjax()){
            $result = Guest::update(['is_delete'=>'0'],['id'=>$id]);
            if ($result){
                $ret = ['code'=>1,'msg'=>'删除成功','delete_id'=>$id];
            }
        }
        return json($ret);
    }

}
