<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\manage\model\BuildingBase;
use app\manage\model\City;
use app\manage\model\BuildingDetail;

class BuildController extends ManageController
{

    public function hotAction(){}

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
        $query = BuildingBase::load();
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
        $lists = City::getCityList();
        if ($city && $city != ''){
            $param['city'] = trim($city);
            if (in_array($city,array_keys($lists))){
                $where =  array_merge($where, ['city_id'=>$city]);
            }
        }

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
        return view('build/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $model = new BuildingBase();
        $lists = City::getCityList();
        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['Building']) ? $_POST['Building'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = BuildingBase::getValidate();
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
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function deleteAction($id)
    {
        $ret = ['code'=>0,'msg'=>'删除失败','delete_id'=>$id];
        if ($this->getRequest()->isAjax()){
            $result = BuildingBase::update(['is_delete'=>'0'],['id'=>$id]);
            if ($result){
                $ret = ['code'=>1,'msg'=>'删除成功','delete_id'=>$id];
            }
        }
        return json($ret);
    }

}
