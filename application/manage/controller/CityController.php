<?php

namespace app\manage\controller;

use app\common\controller\ManageController;
use app\common\model\Region;
use app\manage\model\City;
use think\Request;

class CityController extends ManageController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function indexAction($pageNumber = 1,$name = null, $type = null,$app = null)
    {
        $where = ['is_delete'=>'1'];
        $each = 12;
        $param = ['name'=>'','type'=>'','app'=>''];
        $query = City::load();
        if ($name && $name != ''){
            $param['name'] = trim($name);
            $nameWhere = ' `name` like '.' \'%'.$name.'%\''.' or `title` like '.' \'%'.$name.'%\' ';
            $query = $query->where($nameWhere);
        }
        $typeList = City::getCityList();
        if ($type && $type != ''){
            $param['type'] = trim($type);
            if (in_array($type,array_keys($typeList))){
                $where =  array_merge($where, ['type'=>$type]);
            }
        }
        $dataProvider =$query->where($where)->page($pageNumber,$each)->select();
        $count = City::load()->where($where)->count();

        $this->assign('meta_title', "标签清单");
        $this->assign('pages', ceil(($count)/$each));
        $this->assign('dataProvider', $dataProvider);
        $this->assign('indexOffset', (($pageNumber-1)*$each));
        $this->assign('count', $count);
        $this->assign('param', $param);
        $this->assign('typeList', $typeList);
        return view('city/index');
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function createAction()
    {
        $config = new City();
        $cityList = City::getCityList();
        if ($this->getRequest()->isPost()){
            $data = (isset($_POST['City']) ? $_POST['City'] : []);
            if (empty($data['parent'])){
                $data['parent'] = null;
            }
            $region = City::getRegionByName($data['name'],$data['data']);
            if (is_object($region)){
                $helper = $this->getHelper();
                $region = $helper::toArray($region);
                foreach ($region as $key => $value){
                    switch ($key){
                        case 'id':{$data['region_id'] = $value;}break;
                        case 'level':{$data['level'] = $value;}break;
                        case 'order':{$data['order'] = $value;}break;
                        case 'code':{$data['code'] = $value;}break;
                        case 'name_en':{$data['name_en'] = $value;}break;
                        case 'short_name_en':{$data['short_name_en'] = $value;}break;
                        case 'data':{$data['data'] = !empty($data['data']) ? $data['data'] : $value;}break;
                        default:{}
                    }
                }
            }else{
                $data['region_id'] = '1';
                $data['level'] = '0';
                $data['order'] = '1';
                $data['code'] = '1';
                $data['name_en'] = 'NOT';
                $data['short_name_en'] = 'NOT';
            }

            if ($data){
                $validate = City::getValidate();
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
        return view('city/create',['meta_title'=>'添加城市','cityList'=>$cityList]);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function saveAction(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function readAction($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function editAction($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function updateAction(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function deleteAction($id)
    {
        //
    }
}
