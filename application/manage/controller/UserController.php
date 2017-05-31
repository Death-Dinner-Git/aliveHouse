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
use app\manage\model\BackUser;
use app\manage\model\Identity;
use app\manage\model\Department;

/**
 * 用户控制器
 * @author Sir Fu
 */
class UserController extends ManageController
{
    /**
     * @description 数据
     * @return mixed
     */
    public function indexAction()
    {
        $model = Identity::load()->where(['id'=>'100'])->find();
        return view('user/index',['meta_title'=>'个人信息','model'=>$model]);
    }

    /**
     * @description 日志
     * @return string
     */
    public function logAction()
    {
        $this->assign('meta_title', "日志信息");
        return view('user/layer');
    }

    /**
     * @description 新增
     * @param $id
     * @return string
     */
    public function resetPasswordAction($id)
    {
        $model = Identity::load()->where(['id'=>$id])->find();
        return view('user/reset',['meta_title'=>'修改密码','model'=>$model]);
    }

    /**
     * @description 清单
     * @param bool $super
     * @param integer $pageNumber
     * @return string
     */
    public function listAction($super = false,$pageNumber = 1)
    {
        $where = [];
        $each = 10;
        $key = '';
        $type = '';
        if (request()->request('key')){
            $key = trim(request()->request('key'));
            $where =  array_merge($where, ['real_name'=>$key]);
        }
        $typeList = BackUser::getDepartmentList();
        if ($super == 'true' || request()->request('department_id')){
            $type = $super == 'true' ? '1' : request()->request('department_id');
            if (in_array($type,array_keys($typeList))){
                $where =  array_merge($where, ['department_id'=>$type]);
            }
        }
        $dataProvider = BackUser::load()->where($where)->page($pageNumber,$each)->select();
        $count = BackUser::load()->where($where)->count();

        $this->assign('meta_title', "账号管理");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('key', $key);
        $this->assign('type', $type);
        $this->assign('typeList', $typeList);
        $this->assign('super', $super);
        return view('user/list');
    }

    /**
     * @description 编辑
     * @param $id
     * @param $target
     * @return string
     */
    public function updateAction($id,$target = null)
    {
        $where = ['id'=>$id];
        $model = Identity::load()->where($where)->find();
        if (!$model){
            return '';
        }
        if ($this->getRequest()->isAjax()){
            $res = ['status'=>'n','info'=>'更新失败'];
            $passed = true;
            $validate = Identity::getValidate();
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
                $data['real_name'] = '小符';
                if (Identity::update($data,$where)){
                    $res['info'] = '更新成功';
                }
            }
            return json($res);
        }
        $this->assign('meta_title', "更新信息");
        $this->assign('departmentList', Identity::getDepartmentList());
        $this->assign('model', $model);
        return view('user/update');
    }

    /**
     * @description 删除
     * @param $id
     * @return string
     */
    public function deleteAction($id = 0)
    {
        return json(['code'=>1,'msg'=>'删除成功','delete_id'=>$id]);
    }
}
