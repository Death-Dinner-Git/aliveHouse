<?php

namespace app\common\controller;

use think\Controller;
use app\common\components\Configs;
use think\response\View;
use think\Request;
use app\common\components\rbac\AccessControl;

/**
 * @description The module Index base controller
 * Class Common extends \think\Controller
 */
class BaseController extends Controller
{
    protected static $_helper;

    /**
     * @description before action function
     */
    protected function _initialize()
    {
        $_SESSION['identity'] = session('identity');
        $_SESSION['logined_at'] = session('logined_at');
        $is_ajax = false;
        if ($this->getRequest()->isAjax()){
            $is_ajax = true;
        }
        defined('IS_AJAX') or define('IS_AJAX',$is_ajax);
        config('default_module',request()->module());
        $this->assign('URL',$this->getUrl());
//        $this->assign('_csrf_param','_csrf_'.request()->module());
//        $this->assign('_csrf_token','_csrf_'.request()->module());
        if ($_SESSION['logined_at'] != strtotime($_SESSION['identity']['logined_at'])){
            $_SESSION['logined_at'] = strtotime($_SESSION['identity']['logined_at']);
            session('logined_at',$_SESSION['logined_at']);
            $_SESSION['_auth_token_'] = md5($_SESSION['identity']['id'].$_SESSION['identity']['logined_at']);
        }
    }

    /**
     * @description 获取权限检查器
     * @return \app\common\components\rbac\AccessControl
     */
    public function getAccessControl()
    {
        return AccessControl::getInstance();
    }

    /**
     * @description 当前请求路由
     * @return string
     */
    public function getCurrentUrl()
    {
        // 获取当前访问地址
        return strtolower(request()->module() . '/' . request()->controller() . '/' . request()->action());
    }

    /**
     * @description 获取默认路由
     * @return string
     */
    public function getHomeUrl()
    {
        // 获取默认路由
        return strtolower(config('default_module').'/'.config('default_controller').'/'.config('default_action'));
    }

    /**
     * @description 当前请求完整URL
     * @return string
     */
    public function getUrl()
    {
        $url = request()->url();
        return $url;
    }

    /**
     * 渲染模板输出
     * @param string    $template 模板文件
     * @param array     $vars 模板变量
     * @param array     $replace 模板替换
     * @param integer   $code 状态码
     * @param array  $header
     * @param array  $options 输出参数
     * @return \think\response\View
     */
    public function view($template = '', $vars = [], $replace = [], $code = 200,$header = [], $options = [])
    {
        $view = new View($template, $code, $header, $options);
        return $view->replace($replace)->assign($vars);
    }

    /**
     * @description 导航列表
     * @param int $userId
     * @param string $app 'back' 后台 'front'
     * @return \think\response\Json
     */
    protected function nav($userId=0, $app = 'back')
    {
        return json(\app\common\components\MenuHelper::getMenu($userId,$app));
    }

    /**
     * @description before action function
     * if is a guest return true, or return false;
     * @return bool
     */
    protected function isGuest()
    {
        //用户登录检测
        $uid = Configs::getIdentity()->isGuest();
        return $uid ? $uid : false;
    }

    /**
     * @description 删除文件
     * @param $file
     * @return bool
     */
    public function unlink($file)
    {
        if (!is_file($file)){
            return false;
        }else{
//            //$d不是static目录下的文件不给予删除
//            if (strstr($file,'/static/') === false){
//                return false;
//            }
        }
        @unlink($file);  //删除源文件
        return true;
    }

    /**
     * @description 删除文件夹及其文件夹下所有文件
     * @param $pathStr
     * @param bool $root
     * @return bool
     */
    public function deleteFolder($pathStr,$root = true)
    {
        if (!is_dir($pathStr)) {
//            if (strstr($pathStr, '/back/') !== false){
//                $pathStr = preg_replace('/\/back\//', '/backend/web/', $pathStr, 1); //只替换一次
//            }
//            if (!is_dir($pathStr)) {
            return false;
//            }
        }

        //$d不是static目录下的文件不给予删除
        if (!(strstr($pathStr,'/uploads/') === true || $pathStr === RUNTIME_PATH)){
            return false;
        }

        if (!is_dir($pathStr)) {
            return false;
        }

        //先删除目录下的文件：
        $dh = opendir($pathStr);
        while ($file = readdir($dh)) {
            if ($file != "." && $file != "..") {
                $fullpath = $pathStr . "/" . $file;
                if (!is_dir($fullpath)) {
                    unlink($fullpath);
                } else {
                    $this->deleteFolder($fullpath);
                }
            }
        }
        closedir($dh);
        //删除当前文件夹：
        if ($root){
            if (!rmdir($pathStr)) {
                return false;
            }
        }
        return true;
    }

    /**
     * @description 自动创建存储文件夹,且删除文件夹内所有文件
     * @param string $pathStr
     * @param bool $clear
     * @return bool|mixed|string
     */
    public function getFolder($pathStr = './',$clear = false)
    {
        $pathStr = $this->getPath($pathStr);
        if (strrchr($pathStr, "/") != "/") {
            $pathStr .= "/";
        }
        if (!file_exists($pathStr)) {
            if (!mkdir($pathStr, 0777, true)) {
                return false;
            }
        } elseif ($clear) {
            if (is_dir($pathStr) && strpos($pathStr, '/static/') !== false) //$d是目录名
            {
                if ($od = opendir($pathStr)) {
                    while (($file = readdir($od)) !== false)  //读取该目录内文件
                    {
                        $delete = true;
                        $createTime = filectime($pathStr . $file);
                        //删除大于3天的文件
                        if ($createTime + 3 * 24 * 60 * 60 > time()) {
                            $delete = false;
                        }
                        if ($delete) {
                            @unlink($pathStr . $file);  //$file是文件名
                        }
                    }
                    closedir($od);
                }
            }
        }
        return $pathStr;
    }

    /**
     * @description 复制文件
     * @param $from
     * @param $to
     * @return bool
     */
    public function copy($from,$to){
        $from = $this->getPath($from);
        $to = $this->getPath($to);
        if (!file_exists($from)){
            return false;
        }
        if (!file_exists($to)){
            $this->getFolder(pathinfo($to, PATHINFO_DIRNAME));
        }
        @copy($from,$to);
        return true;
    }

    /**
     * 获取有效根目录
     * @return string
     */
    public function getWebPath(){
        $path = ROOT_PATH;
        if (strrchr($path, DIRECTORY_SEPARATOR) != DIRECTORY_SEPARATOR) {
            $path .= DIRECTORY_SEPARATOR;
        }
        return $path .'public';
    }

    /**
     * @param $path
     * @return string
     */
    public function getPath($path){
        $prefix = $this->getWebPath();
        if (strpos($path, $prefix) === false) {
            if (substr($path,0,1) == '.') {
                $path = substr($path,1);
            }
            if (substr($path,0,1) != '/') {
                $path = '/' . $path;
            }
            $path = $this->getWebPath().$path;
        }
        return $path;
    }

    /**
     * @description 数组转换成JSON(兼容中文)
     * @param $data
     * @return string
     */
    public function ch_json_encode($data)
    {
        $ret = $this->ch_urlencode($data);
        $ret = json_encode($ret);
        return urldecode($ret);
    }

    /**
     * @description 借助URL编码中转对中文转URL编码
     * @param $data
     * @return array
     */
    private function ch_urlencode($data)
    {
        if (is_array($data) || is_object($data)) {
            foreach ($data as $k => $v) {
                if (is_scalar($v)) {
                    if (is_array($data)) {
                        if (strstr($v, '\"') === false){
                            $v = str_replace('"','\"',$v);
                        }
                        $data[$k] = urlencode($v);
                    } else if (is_object($data)) {
                        if (strstr($v, '\"') === false){
                            $v = str_replace('"','\"',$v);
                        }
                        $data->$k = urlencode($v);
                    }
                } elseif (is_array($data)) {
                    if (empty($v)) {
                        $data[$k] = $v;
                    } else {
                        $data[$k] = $this->ch_urlencode($v);
                    }
                } elseif (is_object($data)) {
                    $data->$k = $this->ch_urlencode($v);
                }
            }
        }
        return $data;
    }

    /**
     * @description 数组转换成字符串(兼容中文),为了保存！
     * @param array $data
     * @param bool $line
     * @return array|string
     */
    public function arrayToString($data = [], $line = false)
    {
        $format = '';
        if ($line){
            $format = PHP_EOL;
        }
        if (!is_array($data)){
            return '';
        }
        $ret = self::arrayImplode($data, $format);
        return $ret;
    }

    /**
     * @param $data
     * @param string $format
     * @return array|string
     */
    private function arrayImplode($data, $format = '')
    {
        $encode = false;
        if (is_array($data)) {
            $encode = true;
            foreach ($data as $k => $v) {
                if (!is_scalar($v)) {
                    if (is_array($v)) {
                        $data[$k] = self::arrayImplode($v, $format);
                    } elseif (is_object($data)) {
                        $data->$k = self::arrayImplode($v, $format);
                    }
                }
            }
        }
        if ($encode) {
            $tmp = '';
            foreach ($data as $kk => $vv) {
                if (substr($vv, 0, 1) == '[') {
                    $tmp .= "'" . $kk . "' => " . $vv . ", ".$format;
                } else {
                    $tmp .= "'" . $kk . "' => '" . $vv . "', ".$format;
                }
            }
            $data = "[".$format . rtrim($tmp, ", ".$format) .$format. "]".$format;
        }
        return $data;
    }

//    /**
//     * @description before action function
//     * @param $name
//     * @return string
//     */
//    public function _empty($name)
//    {
//        return $this->showEmpty($name);
//    }
//
//    /**
//     * @description show some message when The module action error or empty
//     * @param $name
//     * @return string
//     */
//    protected function showEmpty($name)
//    {
//        return '<div style="width: 100%;height: 600px;display: flex;"><div style="margin: auto;">Would be stop run,when you run "'.$name.'" function in the module. </div></div></div>';
//    }
//
//    /**
//     * @description The APP 全局MISS路由，一个父级操作.
//     * @return string
//     */
//    public function missAction()
//    {
//        return '<div style="width: 100%;height: 600px;display: flex;"><div style="margin: auto;">Would be stop run,because your request route could be matched by the default route preg. </div></div></div>';
//    }

    /**
     * Redirects the browser to the home page.
     *
     * You can use this method in an action by returning the [[Response]] directly:
     *
     * ```php
     * // stop executing this action and redirect to home page
     * $this->goHome();
     */
    public function goHome()
    {
        $this->redirect($this->getHomeUrl());
    }

    /**
     * Redirects the browser to the last visited page.
     *
     * You can use this method in an action by returning the [[Response]] directly:
     *
     * ```php
     * // stop executing this action and redirect to last visited page
     * $this->goBack();
     * ```
     *
     * For this function to work you have to [[User::setReturnUrl()|set the return URL]] in appropriate places before.
     *
     * @param string|array $defaultUrl the default return URL in case it was not set previously.
     * If this is null and the return URL was not set previously, [[Application::homeUrl]] will be redirected to.
     * Please refer to [[User::setReturnUrl()]] on accepted format of the URL.
     * @param array $params
     * @param int $code
     */
    public function goBack($defaultUrl = null,$params = [],$code = 302)
    {
        if ($defaultUrl){
            $this->redirect($defaultUrl,$params,$code);
        }

        $backUrl = (array) session(config('identity._manage_url'));
        if (!empty($backUrl)){
            $index = count($backUrl);
            $this->success('正在恢复...',$backUrl[$index-1],1);
        }

        $this->goHome();
    }

    /**
     * Returns the URL that the browser should be redirected to after successful login.
     *
     * This method reads the return URL from the session. It is usually used by the login action which
     * may call this method to redirect the browser to where it goes after successful authentication.
     *
     * @param string|array $defaultUrl the default return URL in case it was not set previously.
     * If this is null and the return URL was not set previously, [[Application::homeUrl]] will be redirected to.
     * Please refer to [[setReturnUrl()]] on accepted format of the URL.
     * @return string the URL that the user should be redirected to after login.
     */
    public function getReturnUrl($defaultUrl = null)
    {
        if ($defaultUrl){
            return $defaultUrl;
        }

        $backUrl = (array) session(config('identity._manage_url'));
        if (!empty($backUrl)){
            $index = count($backUrl);
            return $backUrl[$index-1];
        }

        return $this->getHomeUrl();
    }

    /**
     * Remembers the URL in the session so that it can be retrieved back later by [[getReturnUrl()]].
     * @param string|array $url the URL that the user should be redirected to after login.
     * If an array is given, [[UrlManager::createUrl()]] will be called to create the corresponding URL.
     * The first element of the array should be the route, and the rest of
     * the name-value pairs are GET parameters used to construct the URL. For example,
     *
     * ```php
     * ['admin/index', 'ref' => 1]
     * ```
     */
    public function setReturnUrl($url = null)
    {
        if (!$url){
            $url = request()->url();
        }
        if ( stristr($url,$this->getLoginUrl()) ||  stristr($url,$this->getRegisterUrl()) || stristr($url,$this->getLogoutUrl()) ){
            return;
        }
        $path = session(config('identity._manage_url'));
        $path = (array) $path;
        if (end($path) != $url){
            $path[] = $url;
        }
        if (count($path) >3){
            unset($path[0]);
            $path = array_values($path);
        }
        session(config('identity._manage_url'),$path);
    }

    /**
     * @description Returns the URL what can be login in the login page.
     * @param null $defaultUrl
     * @return mixed|null|string
     */
    public function getLoginUrl($defaultUrl = null)
    {
        if ($defaultUrl){
            return $defaultUrl;
        }

        if (config('identity.loginUrl')){
            return config('identity.loginUrl');
        }
        return null;
    }

    /**
     * @description Returns the URL what can be logout in the login page.
     * @param null $defaultUrl
     * @return mixed|null|string
     */
    public function getLogoutUrl($defaultUrl = null)
    {
        if ($defaultUrl){
            return $defaultUrl;
        }

        if (config('identity.logoutUrl')){
            return config('identity.logoutUrl');
        }
        return null;
    }

    /**
     * @description Returns the URL what can be Register in the Register page.
     * @param null $defaultUrl
     * @return mixed|null|string
     */
    public function getRegisterUrl($defaultUrl = null)
    {
        if ($defaultUrl){
            return $defaultUrl;
        }

        if (config('identity.registerUrl')){
            return config('identity.registerUrl');
        }
        return null;
    }

    public function HttpException($statusCode = null, $message = null, array $headers = [], $code = null){
        if (empty($statusCode)){
            $statusCode = '404';
        }
        if (empty($code)){
            $code = $statusCode;
        }
        if (empty($message)){
            $message = '请求不存在';
        }
        if (empty($headers)){
            $headers = ['code'=>$code,'msg'=>$message,'info'=>$message];
        }
        throw new \think\Exception\HttpException($statusCode,$message,null,$headers,$code);
    }


    /**
     * @return \app\common\components\Helper
     */
    public static function getHelper(){
        if (!self::$_helper){
            self::$_helper = \app\common\components\Helper::getInstance();
        }
        return self::$_helper;
    }

    /**
     * @return Request
     */
    public function getRequest(){
        return \think\Request::instance();
    }

    public function _after(){

    }

    public function __destruct()
    {
        $this->_after();
        $this -> setReturnUrl();
    }
}