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
     * @param string $name
     * @param string $city
     * @param string $address
     * @return \think\Response
     */
    public function indexAction($name = null, $city = null,$address = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 12;
        /**
         * @var $model \app\manage\model\Guest
         */
        $model = Guest::load();
        $request = $this->getRequest();
        $key = trim($request->request('keyword'));
        if ($key != ''){
            $where[] = ['exp',"`name` like '%".$key."%' "];
        }
        $address = trim($request->request('address'));
        if ($address != ''){
            $where[] = ['exp',"`address` like '%".$address."%' "];
        }
        $lists = Guest::getLevelList();
        $city = trim($request->request('city'));
        if ($city != ''){
            if (in_array($city,array_keys($lists))){
                $where =  array_merge($where, ['city_id'=>$city]);
            }
        }

        $list = $model->where($where)->order('id DESC')->paginate($each);

        $this->assign('meta_title', "客户清单");
        $this->assign('model', $model);
        $this->assign('list', $list);
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
        if ($this->getRequest()->isPost()){
            $data = $model->filter($_POST);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = $model::getValidate();
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
        return view('guest/create',[
            'meta_title'=>'添加客户',
            'meta_util'=>'false',
            'model'=>$model
        ]);
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
