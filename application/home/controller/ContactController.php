<?php

namespace app\home\controller;

use app\common\controller\HomeController;
use app\manage\model\Contact;

/**
 * 默认控制器
 * @author Sir Fu
 */
class ContactController extends HomeController
{
    /**
     * 默认方法
     * @author Sir Fu
     */
    public function contactAction()
    {
        return view('contact/contact',[
            'meta_title'=>'联系我们',
            'nav'=>'contact'
        ]);
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $ret = ['status'=>'0','info'=>'提交失败'];
        if ($this->getRequest()->isPost()){
            $model = new Contact();
            $data = $model->filter($_POST);
            if ($data){
                $data['home_user_id'] = $this->getIdentity('id')?:'0';
                $data['back_user_id'] = isset($data['back_user_id'])? $data['back_user_id'] :'0';
                $data['created_at'] = date('Y-m-d H:i:s');
                $validate = Contact::getValidate();
                $validate->scene('create');
                if ($validate->check($data) && $model->save($data)){
                    $ret = ['status'=>'1','info'=>'提交成功'];
                }else{
                    $error = $validate->getError();
                    if (empty($error)){
                        $error = $model->getError();
                    }
                    $ret = ['status'=>'0','info'=>$error];
                }
            }
        }
        return json($ret);
    }


}
