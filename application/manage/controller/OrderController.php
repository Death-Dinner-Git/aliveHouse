<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\manage\model\TakeOrder;


class OrderController extends ManageController
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
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function importAction()
    {
        //
    }

    /**
     * @description 显示资源列表
     * @param int $pageNumber
     * @param string $key
     * @param string $type
     * @param string $status
     * @return \think\Response
     */
    public function indexAction($pageNumber = 1,$key = null, $type = null, $status = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 12;
        $param = ['key'=>'','type'=>'','status'=>''];
        $query = TakeOrder::load();
        if ($key && $key != ''){
            $param['key'] = trim($key);
            $where[] = ['exp',"`username` like '%".$key."%' or `contact` like '%".$key."%' or `email` like '%".$key."%' or `address` like '%".$key."%'"];
        }
        $lists = TakeOrder::getHouseType();
        if (isset($typeList[0])){
            unset($typeList[0]);
        }
        if ($type && $type != ''){
            $param['type'] = trim($type);
            if (in_array($status,array_keys($lists))){
                $where = array_merge($where,['house_type'=>$type]);
            }
        }
        $statuses = TakeOrder::getDealStatus();
        if (isset($typeList[0])){
            unset($typeList[0]);
        }
        if ($status && $status != ''){
            $param['status'] = trim($status);
            if (in_array($status,array_keys($statuses))){
                $where = array_merge($where,['deal_status'=>$status]);
            }
        }

        $providerModel = clone $query;
        $count = $query->where($where)->count();
        $dataProvider = $providerModel->where($where)->page($pageNumber,$each)->select();

        $this->assign('meta_title', "我的交易清单");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('param', $param);
        $this->assign('lists', $lists);
        $this->assign('statuses', $statuses);
        return view('order/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $model = new TakeOrder();
        $lists = TakeOrder::getHouseType();
        $statuses = TakeOrder::getDealStatus();
        $guests = TakeOrder::getDealStatus();
        $goods = TakeOrder::getDealStatus();
        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['TakeOrder']) ? $_POST['TakeOrder'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = TakeOrder::getValidate();
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

        return view('order/create',[
            'meta_title'=>'添加一个交易记录',
            'meta_util'=>'false',
            'lists'=>$lists,
            'statuses'=>$statuses,
            'guests'=>$guests,
            'goods'=>$goods,
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
        $model = Ban::load()->where(['id'=>$id])->find();
        return view('order/view',['model'=>$model]);
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
        $model = new Ban();
        $modelList = Ban::getTypeList();
        $appList = Ban::getAppList();
        $model = Ban::load()->where(['id'=>$id])->where($where)->find();
        if (!$model){
            return '';
        }

        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['Ban']) ? $_POST['Ban'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = Ban::getValidate();
                $validate->scene('update');
                if ($validate->check($data) && Ban::update($data,['id'=>$id])){
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
        return view('order/update',['meta_title'=>'编辑标签','model'=>$model,'appList'=>$appList,'orderList'=>$modelList]);
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
            $result = Ban::update(['is_delete'=>'0'],['id'=>$id]);
            if ($result){
                $ret = ['code'=>1,'msg'=>'删除成功','delete_id'=>$id];
            }
        }
        return json($ret);
    }
}
