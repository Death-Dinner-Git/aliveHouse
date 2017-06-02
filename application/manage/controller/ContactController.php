<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\manage\model\Contact;
use app\manage\model\CustomerService;

class ContactController extends ManageController
{

    public function servicesAction(){}


    /**
     * @description 显示资源列表
     * @param int $pageNumber
     * @param string $key
     * @param string $status
     * @return \think\Response
     */
    public function indexAction($pageNumber = 1,$key = null, $status = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 12;
        $param = ['key'=>'','status'=>''];
        $query = Contact::load();
        if ($key && $key != ''){
            $param['key'] = trim($key);
            $nameWhere = [' `username` like '.' \'%'.$key.'%\''.'or `contact` like '.' \'%'.$key.'%\''.'or `email` like '.' \'%'.$key.'%\''.'or `address` like '.' \'%'.$key.'%\''];
            $where =  array_merge($where, $nameWhere);
        }
        $lists = Contact::getReadType();
        if (isset($typeList[0])){
            unset($typeList[0]);
        }
        if ($status && $status != ''){
            $param['status'] = trim($status);
            if (in_array($status,array_keys($lists))){
                $where =  array_merge($where, ['readed'=>$status]);
            }
        }

        $providerModel = clone $query;
        $count = $query->where($where)->count();
        $dataProvider = $providerModel->where($where)->page($pageNumber,$each)->select();

        $this->assign('meta_title', "联系清单");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('param', $param);
        $this->assign('lists', $lists);
        return view('contact/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $model = new Contact();
        $lists = CustomerService::getService();
        $hotLists = CustomerService::getService(true);
        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['Building']) ? $_POST['Building'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = Contact::getValidate();
                $validate->scene('create');
                if ($validate->check($data) && $model->save($data)){
                    $this->success('提交成功','create','',1);
                }else{
                    $error = $validate->getError();
                    if (empty($error)){
                        $error = $model->getError();
                    }
                    $this->error($error, 'create','',1);
                }
            }
        }
        return view('contact/create',[
            'meta_title'=>'联系我们',
            'lists'=>$lists,
            'hotLists'=>$hotLists,
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
        $model = Contact::load()->where(['id'=>$id])->find();
        return view('config/view',[
            'meta_title'=>'详情',
            'model'=>$model
        ]);
    }

    /**
     * 设置状态
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function readAction($id)
    {
        $ret = ['code'=>0,'msg'=>'设置失败','delete_id'=>$id];
        if ($this->getRequest()->isAjax()){
            $where = ['id'=>$id];
            $model = Contact::load()->where($where)->find();
            $read = $model->readed == '2' ? '1' : '2' ;
            $result = Contact::update(['readed'=>$read],$where);
            if ($result){
                $ret = ['code'=>1,'msg'=>'设置成功','readed'=>$read];
            }
        }
        return json($ret);
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
            $result = Contact::update(['is_delete'=>'0'],['id'=>$id]);
            if ($result){
                $ret = ['code'=>1,'msg'=>'删除成功','delete_id'=>$id];
            }
        }
        return json($ret);
    }


}
