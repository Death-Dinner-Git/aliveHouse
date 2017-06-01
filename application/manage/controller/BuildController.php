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
     * @return \think\Response
     */
    public function indexAction($pageNumber = 1,$name = null, $city = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 12;
        $param = ['name'=>'','city'=>'','app'=>''];
        $query = BuildingBase::load();
        if ($name && $name != ''){
            $param['name'] = trim($name);
            $nameWhere = ' `name` like '.' \'%'.$name.'%\''.' or `title` like '.' \'%'.$name.'%\' ';
            $query = $query->where($nameWhere);
        }
        $cityList = City::getCityList();
        if ($city && $city != ''){
            $param['city'] = trim($city);
            if (in_array($city,array_keys($cityList))){
                $where =  array_merge($where, ['city'=>$city]);
            }
        }
        $dataProvider =$query->where($where)->page($pageNumber,$each)->select();
        $count = BuildingBase::load()->where($where)->count();

        $this->assign('meta_title', "楼盘清单");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('param', $param);
        $this->assign('cityList', $cityList);
        return view('build/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $config = new BuildingBase();
        $configList = BuildingBase::getTypeList();
        $appList = BuildingBase::getAppList();
        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['BuildingBase']) ? $_POST['BuildingBase'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = BuildingBase::getValidate();
                $validate->scene('create');
                if ($validate->check($data) && $config->save($data)){
                    $this->success('添加成功','create','',1);
                }else{
                    $error = $validate->getError();
                    if (empty($error)){
                        $error = $config->getError();
                    }
                    $this->error($error, 'create','',1);
                }
            }
        }
        return view('config/create',['meta_title'=>'添加配置','appList'=>$appList,'configList'=>$configList]);
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
        $config = new BuildingBase();
        $configList = BuildingBase::getTypeList();
        $appList = BuildingBase::getAppList();
        $model = BuildingBase::load()->where(['id'=>$id])->where($where)->find();
        if (!$model){
            return '';
        }

        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['BuildingBase']) ? $_POST['BuildingBase'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = BuildingBase::getValidate();
                $validate->scene('update');
                if ($validate->check($data) && BuildingBase::update($data,['id'=>$id])){
                    $this->success('更新成功','create','',1);
                }else{
                    $error = $validate->getError();
                    if (empty($error)){
                        $error = $config->getError();
                    }
                    $this->error($error, 'create','',1);
                }
            }
        }
        return view('config/update',['meta_title'=>'编辑标签','model'=>$model,'appList'=>$appList,'configList'=>$configList]);
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
