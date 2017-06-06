<?php
// +----------------------------------------------------------------------
// | 零云 [ 简单 高效 卓越 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: Sir Fu
// +----------------------------------------------------------------------
// | 版权申明：零云不是一个自由软件，是零云官方推出的商业源码，严禁在未经许可的情况下
// | 拷贝、复制、传播、使用零云的任意代码，如有违反，请立即删除，否则您将面临承担相应
// | 法律责任的风险。如果需要取得官方授权，请联系官方http://www.lingyun.net
// +----------------------------------------------------------------------
namespace app\manage\controller;


use app\common\controller\ManageController;
use app\manage\model\HomeUser;
use app\manage\model\HomeUserLog;

/**
 * 用户控制器
 * @author Sir Fu
 */
class HomeUserController extends ManageController
{


    /**
     * @description 足迹
     * @param integer $id
     * @param integer $pageNumber
     * @param string $key
     * @param string $type
     * @return string
     */
    public function logAction($id = 0, $pageNumber = 1 ,$key = null, $type = null)
    {
        $where = ['home_user_id'=>$id];
        $param = ['key'=>'','type'=>''];
        $each = 12;

        if ($key && ($key = trim($key)) != ''){
            $param['key'] = $key;
            $where[] =  ["exp"," `route` like '%".$key."%' or `url` like '%".$key."%' or `user_agent` like '%".$key."%' or `ip` like '%".$key."%' "];
        }

        $lists = HomeUserLog::getTypeList();
        if ($type && ($type = trim($type)) != ''){
            $param['type'] = $type;
            if (in_array($type,array_keys($lists))){
                $where =  array_merge($where,['user_agent_type'=>$type]);
            }
        }

        $query = HomeUserLog::load();
        $providerModel = clone $query;
        $count = $query->where($where)->count();
        $dataProvider = $providerModel->where($where)->page($pageNumber,$each)->select();

        $this->assign('meta_title', "足迹");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('param', $param);
        $this->assign('lists', $lists);
        return view('homeUser/log');
    }

    /**
     * @description 浏览
     * @param $id
     * @return string
     */
    public function viewAction($id = 0)
    {
        $id = intval($id);
        if (empty($id)){
            $id = '1';
        }
        $model = HomeUser::load()->where(['id'=>$id])->find();
        return view('homeUser/view',[
            'meta_title'=>'个人信息',
            'meta_util'=>'false',
            'model'=>$model
        ]);
    }

    /**
     * @description 清单
     * @param integer $pageNumber
     * @param string $key
     * @return string
     */
    public function indexAction($pageNumber = 1,$key = null)
    {
        $where = ['is_delete'=>'1'];
        $param = ['key'=>''];
        $each = 12;
        if ($key && ($key = trim($key)) != ''){
            $param['key'] = $key;
            $where[] =  ["exp"," `username` like '%".$key."%' or `real_name` like '%".$key."%' or `email` like '%".$key."%' or `phone` like '%".$key."%' "];
        }

        $query = HomeUser::load();
        $providerModel = clone $query;
        $count = $query->where($where)->count();
        $dataProvider = $providerModel->where($where)->page($pageNumber,$each)->select();

        $this->assign('meta_title', "用户清单");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('param', $param);
        return view('homeUser/index');
    }

    /**
     * @description 编辑
     * @param $id
     * @return string
     */
    public function updateAction($id)
    {
        $where = ['id'=>$id];
        $model = HomeUser::load()->where($where)->find();
        if (!$model){
            return '';
        }
        if ($this->getRequest()->isAjax()){
            $res = ['status'=>'n','info'=>'更新失败'];
            $passed = true;
            $validate = HomeUser::getValidate();
            $validate->scene('update');
            $data = (isset($_REQUEST['Update']) ? $_REQUEST['Update'] : []);
            if ($data){
                $field = [];
                foreach ($data as $key=>$value){
                    $value = trim($value);
                    if (!empty($value)){
                        $field[] = $key;
                    }
                }
                $validate->scene('update',$field);
                if (!$validate->check($data)){
                    $res['info'] = $validate->getError();
                    $passed = false;
                }else{

                }
            }
            if ($passed){
                $res['info'] = '更新成功';
                $res['status'] = 'y';
                $data['updated_at'] = date('Y-m-d H:i:s');
                $data['real_name'] = 'Alive House';
                if (HomeUser::update($data,$where)){
                    $res['info'] = '更新成功';
                }
            }
            return json($res);
        }
        $this->assign('meta_title', "更新信息");
        $this->assign('model', $model);
        return view('homeUser/update',[
            'meta_title'=>'更新信息',
            'meta_util'=>'false',
            'model'=>$model,
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
        if ( true || $this->getRequest()->isAjax()){
            $result = HomeUser::update(['is_delete'=>'0'],['id'=>$id],true);
            if ($result !== false){
                if (empty($result->getError())){
                    $ret['code'] = '1';
                    $ret['msg'] = '删除成功';
                }else{
                    $ret['msg'] = $result->getError();
                }
            }
        }
        return json($ret);
    }
}
