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
use app\manage\model\Identity;

/**
 * 用户控制器
 * @author Sir Fu
 */
class HomeUserController extends ManageController
{

    /**
     * @description 日志
     * @return string
     */
    public function logAction()
    {
        $this->assign('meta_title', "日志信息");
        return view('homeUser/layer');
    }

    /**
     * @description 新增
     * @param $id
     * @return string
     */
    public function resetPasswordAction($id = 0)
    {
        $id = intval($id);
        if (empty($id)){
            $id = '1';
        }
        $model = Identity::load()->where(['id'=>$id])->find();
        return view('homeUser/reset',['meta_title'=>'修改密码','model'=>$model]);
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
        $model = Identity::load()->where(['id'=>$id])->find();
        return view('homeUser/view',['meta_title'=>'个人信息','model'=>$model]);
    }

    /**
     * @description 清单
     * @param bool $super
     * @param integer $pageNumber
     * @return string
     */
    public function indexAction($super = false,$pageNumber = 1)
    {
        $where = [];
        $each = 10;
        $key = '';
        $type = '';
        if (request()->request('key')){
            $key = trim(request()->request('key'));
            $where =  array_merge($where, ['real_name'=>$key]);
        }
        $typeList = HomeUser::getRegList();
        if ($super == 'true' || request()->request('department_id')){
            $type = $super == 'true' ? '1' : request()->request('department_id');
            if (in_array($type,array_keys($typeList))){
                $where =  array_merge($where, ['department_id'=>$type]);
            }
        }
        $dataProvider = HomeUser::load()->where($where)->page($pageNumber,$each)->select();
        $count = HomeUser::load()->where($where)->count();

        $this->assign('meta_title', "账号管理");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('key', $key);
        $this->assign('type', $type);
        $this->assign('typeList', $typeList);
        $this->assign('super', $super);
        return view('homeUser/index');
    }

    /**
     * @description Register Home Page
     * @return \think\response\View
     */
    public function registerAction(){
        $identity = new Identity();
        $token = request()->request('__token__');
        $data = (isset($_POST['Register']) ? $_POST['Register'] : []);
        $departmentList = Identity::getDepartmentList();
        if ( request()->isPost() && $token && $data){
            // 调用当前模型对应的Identity验证器类进行数据验证
//            $data['__token__'] = $token;
            $validate = Identity::getValidate();
            $validate->scene('register');
            if($validate->check($data)){ //注意，在模型数据操作的情况下，验证字段的方式，直接传入对象即可验证
                $res = $identity->signUp($data);
                if($res){
                    if ($res instanceof Identity){
                        $this->success('注册成功','login');
                    }else{
                        $this->error($res, 'register','',1);
                    }
                }
            }else{
                $this->error($validate->getError(), 'register','',1);
            }
        }
        return view('homeUser/create',['meta_title'=>'会员注册','departmentList'=>$departmentList]);
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
        return view('homeUser/update');
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
