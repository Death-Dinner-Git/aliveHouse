<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\manage\model\News;

class NewsController extends ManageController
{

    /**
     * @return \think\response\View
     */
    public function indexAction(){
        $where = ['is_delete'=>'1'];
        $each = 20;
        $model = News::load();
        $request = $this->getRequest();
        $lang = News::Lang();
        $type = trim($request->request('type'));
        if ($type != ''){
            if (in_array($type,array_keys($lang['type']))){
                $where =  array_merge($where, ['type'=>$type]);
            }
        }
        $pass = trim($request->request('pass'));
        if ($pass != ''){
            if (in_array($pass,array_keys($lang['pass']))){
                $where =  array_merge($where, ['pass'=>$pass]);
            }
        }
        $app = trim($request->request('app'));
        if ($app != ''){
            if (in_array($app,array_keys($lang['app']))){
                $where =  array_merge($where, ['app'=>$app]);
            }
        }
        $status = trim($request->request('status'));
        if ($status != ''){
            if (in_array($status,array_keys($lang['status']))){
                $where =  array_merge($where, ['status'=>$status]);
            }
        }
        $list = $model->where($where)->order('`order` ASC')->paginate($each);
        $this->assign('meta_title', "楼市资讯");
        $this->assign('model', $model);
        $this->assign('list', $list);
        return view('news/index');
    }

    /**
     * 显示创建资源表单页.| 保存新建的资源
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $model = new News();
        if ($this->getRequest()->isPost()){
            $data = $model->filter($_POST);
            if ($data){
                $validate = News::getValidate();
                $validate->scene('create');
                $data['back_user_id'] = $this->getIdentity('id');
                $data['back_user_id'] = $this->getIdentity('id');
                $data['created_at'] = date('Y-m-d H:i:s');
                if ($validate->check($data) && $model->save($data)){
                    $type = $model->getValue('typeName',$data['type'],'default');
                    $prefix = '/static/uploads/news/'.$type.'/'.$model->id.'/';
                    //
                    $to = $prefix.pathinfo($data['url'],PATHINFO_BASENAME);
                    $from = $data['url'];
                    $model->url = $to;
                    $this->copy($from,$to);
                    $icon = pathinfo($from,PATHINFO_DIRNAME).'/'.pathinfo($from,PATHINFO_FILENAME).'_icon.'.pathinfo($from,PATHINFO_EXTENSION);
                    $to = $prefix.pathinfo($icon,PATHINFO_BASENAME);
                    $model->url_icon = $to;
                    $this->copy($icon,$to);
                    $model->isUpdate(true)->save();
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
        return view('news/create',['meta_title'=>'添加推荐','model'=>$model]);
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
        $model = News::load()->where(['id'=>$id])->find();
        return view('news/view',['model'=>$model]);
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
        $config = new News();
        $model = News::load()->where(['id'=>$id])->where($where)->find();
        if (!$model){
            return '';
        }

        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['News']) ? $_POST['News'] : []);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($data){
                $validate = News::getValidate();
                $validate->scene('update');
                if ($validate->check($data) && News::update($data,['id'=>$id])){
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
        return view('news/update',['meta_title'=>'编辑标签','model'=>$model]);
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
            $result = News::update(['is_delete'=>'0'],['id'=>$id]);
            if ($result){
                $ret = ['code'=>1,'msg'=>'删除成功','delete_id'=>$id];
            }
        }
        return json($ret);
    }

}
