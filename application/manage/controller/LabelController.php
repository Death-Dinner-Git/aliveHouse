<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\manage\model\Label;

class LabelController extends ManageController
{
    /**
     * @description 显示资源列表
     * @param int $pageNumber
     * @param string $name
     * @param string $type
     * @return \think\Response
     */
    public function indexAction($pageNumber = 1,$name = null, $type = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 10;
        $param = ['name'=>'','type'=>''];
        if ($name && $name != ''){
            $param['name'] = trim($name);
            $where =  array_merge($where, ['name'=>['like','%'.$name.'%']]);
        }
        $typeList = Label::getGroupList();
        if (isset($typeList[0])){
            unset($typeList[0]);
        }
        if ($type && $type != ''){
            $param['type'] = trim($type);
            if (in_array($type,array_keys($typeList))){
                $where =  array_merge($where, ['type'=>$type]);
            }
        }
        $dataProvider = Label::load()->where($where)->page($pageNumber,$each)->select();
        $count = Label::load()->where($where)->count();

        $this->assign('meta_title', "标签清单");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('param', $param);
        $this->assign('typeList', $typeList);
        return view('label/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $label = new Label();
        $labelList = Label::getGroupList();
        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['Label']) ? $_POST['Label'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            $result = Label::load()->where(['name'=>$data['name'],'type'=>$data['type']])->find();
            if ($data){
                if ($result){
                    $error = isset($labelList[$data['type']]) ? $labelList[$data['type']].'类型已存在此标签：'.$data['name'] : '无效标签';
                    $this->error($error , 'create','',1);
                }else{
                    $validate = Label::getValidate();
                    $validate->scene('create');
                    if ($validate->check($data) && $label->save($data)){
                        $this->success('添加成功','create','',1);
                    }else{
                        $error = $validate->getError();
                        if (empty($error)){
                            $error = $label->getError();
                        }
                        $this->error($error, 'create','',1);
                    }
                }
            }
        }
        return view('label/create',['meta_title'=>'添加标签','labelList'=>$labelList]);
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
        $model = Label::load()->where(['id'=>$id])->find();
        return view('label/view',['model'=>$model]);
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
        $label = new Label();
        $labelList = Label::getGroupList();
        $model = Label::load()->where(['id'=>$id])->where($where)->find();
        if (!$model){
            return '';
        }

        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['Label']) ? $_POST['Label'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            $result = Label::load()->where(['name'=>$data['name'],'type'=>$data['type']])->where($where)->find();
            if ($data){
                if ($result){
                    $error = isset($labelList[$data['type']]) ? $labelList[$data['type']].'类型已存在此标签：'.$data['name'] : '无效标签';
                    $this->error($error , 'create','',1);
                }else{
                    $validate = Label::getValidate();
                    $validate->scene('update');
                    if ($validate->check($data) && Label::update($data,['id'=>$id])){
                        $this->success('更新成功','create','',1);
                    }else{
                        $error = $validate->getError();
                        if (empty($error)){
                            $error = $label->getError();
                        }
                        $this->error($error, 'create','',1);
                    }
                }
            }
        }
        return view('label/update',['meta_title'=>'编辑标签','labelList'=>$labelList,'model'=>$model]);
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
        if ( $this->getRequest()->isAjax()){
            $result = Label::update(['is_delete'=>'0'],['id'=>$id]);
            if ($result){
                $ret = ['code'=>1,'msg'=>'删除成功','delete_id'=>$id];
            }
        }
        return json($ret);
    }
}
