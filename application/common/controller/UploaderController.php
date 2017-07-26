<?php

namespace app\common\controller;

use app\common\controller\BaseController;

class UploaderController extends BaseController
{
    private $webPath;              //网站根目录
    private $fileField;            //文件域名
    private $file;                 //文件上传对象
    private $config;               //配置信息
    private $oriName;              //原始文件名
    private $fileName;             //新文件名
    private $fullName;             //完整文件名,即从当前配置目录开始的URL
    private $fileSize;             //文件大小
    private $fileType;             //文件类型
    private $stateInfo;            //上传状态信息,
    private $stateMap = array(    //上传状态映射表，国际化用户需考虑此处数据的国际化
        "SUCCESS" ,                //上传成功标记
        "文件大小超出 upload_max_filesize 限制" ,
        "文件大小超出 MAX_FILE_SIZE 限制" ,
        "文件未被完整上传" ,
        "没有文件被上传" ,
        "上传文件为空" ,
        "POST" => "文件大小超出服务器大小限制" ,
        "SIZE" => "文件大小超出网站大小限制" ,
        "TYPE" => "不允许的文件类型" ,
        "DIR" => "目录创建失败" ,
        "IO" => "输入输出错误" ,
        "UNKNOWN" => "未知错误" ,
        "MOVE" => "文件保存时出错",
        "DIR_ERROR" => "创建目录失败"
    );


    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * @param $id
     * @param string $action
     */
    public function actionImg($id = '', $action = 'activity')
    {
        $prefix = dirname(dirname(__DIR__));
        if (empty($id)){
            $id = 'http://www.youteefit.com';
        }
        $out = '/back/statics/qrcode/tmp/'.date('YmdHis').rand(10000,99999).'.png';
        $pathstr = $this ->getFolder(pathinfo($prefix.$out, PATHINFO_DIRNAME));
        $qrcode = \backend\components\Helper::GenerateQrcodeImage($id, $prefix.$out);
        echo '<img src="'.$out.'" />';
    }

    /**
     * AJAX上传
     */
    public function actionAjaxupload()
    {
        Yii::$app->getResponse()->format = 'json';
        $res['code'] = 1;
        $res['state'] = '上传失败';
        $this ->layout = false;
        //上传配置
        $this -> webPath = dirname(__DIR__).DIRECTORY_SEPARATOR.'web';
        $config = array(
            "savePath" => "/statics/uploads",             //上传文件夹
            "maxSize" => 8 * 1024,                   //允许的文件最大尺寸，单位KB
            "allowFiles" => array(".png", ".jpg", ".jpeg", ".gif", ".bmp"),   //允许的文件格式
            "sort" => "default",                   //分类
            "format" => "0*0",                   // 格式 默认为0*0；当值为（0*0 或 0%）不做处理;当格式为（X*Y）则处理成长为X,宽为Y的图片，当格式为（X%）则处理成原图的X%. 最大为6000*6000
            "uid" => "default",                            //uid
            "str_num" => "0",                      //URL截取的长度参数
            "addMark" => false,                      //是否添加水印,默认值是false表示添加水印
        );

        set_time_limit(300); //上传执行时间不能超过五分钟
        $config['savePath'] = $this -> webPath.$config['savePath'];
        $config["sort"] = $_REQUEST['sort'];
        if(isset($_REQUEST['uid'])){
            !empty($_REQUEST['uid']) &&  $_REQUEST['uid'] != 'undefined' ? $config["uid"] = $_REQUEST['uid'] : '';
        }
        if(isset($_REQUEST['addMark'])){
            !empty($_REQUEST['addMark']) ? $config["addMark"] = true : '';
        }
        if(isset($_REQUEST['format'])){
            if (preg_match('/^([1-9])([\d]){0,}\*([1-9])([\d]){0,}$/i', $_REQUEST['format'])) {
                $config['format'] = $_REQUEST['format'];
            }
            if (preg_match('/^([1-9][\d]{0,})\%$/i', $_REQUEST['format'])) {
                $config['format'] = $_REQUEST['format'];
            }
        }
        $this->fileField = $_REQUEST['filefield'];
        $this->config = $config;
        $this->config['savePath'] = $this->config['savePath'].'/'.$this->config['sort'].'/'.$this->config['uid'].'/tmp';
        $this->stateInfo = $this->stateMap[ 0 ];
        $this -> upFile();
        $info = $this->getFileInfo();


        /**
         * 返回数据
         */
        if ($info['state'] == 'SUCCESS') {
            $res['code'] = 0;
            $res['url'] = str_replace($this -> webPath, '/back', $info['url']);
            $res['state'] = '上传成功';
        } else {
            $res['code'] = 1;
            $res['state'] =  $info['state'];
        }
        return $res;
    }

    /**
     * AJAX上传
     */
    public function actionVideoupload()
    {
        Yii::$app->getResponse()->format = 'json';
        $res['code'] = 1;
        $res['state'] = '上传失败';
        //上传配置
        $this -> webPath =  dirname(__DIR__).DIRECTORY_SEPARATOR.'web';
        $config = array(
            "savePath" => "/statics/uploads",             //上传文件夹
            "tmpPath" => "/statics/uploads",            //上传缓存文件夹
            "maxSize" => 200*1024,                   //允许的文件最大尺寸，单位KB
            "allowFiles" => array(".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg",
                ".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid"),   //允许的文件格式
            "sort" => "default",                   //分类
            "uid" => "default",                            //uid
            "str_num" => "0",                      //URL截取的长度参数
            'addMark' => true,
        );

        //提示：需要保持 memory_limit > post_max_size > upload_max_filesize
        ini_set('upload_max_filesize','200M');
        ini_set('post_max_size','210M');
        ini_set('max_execution_time','1200');
        ini_set('max_input_time','1200');
        ini_set('memory_limit','228M');
        $config['savePath'] = $this -> webPath.$config['savePath'];
       try{
           $this->fileField = $_REQUEST['filefield'];
           $config["sort"] = $_REQUEST['sort'] ;
           $config["uid"] = $_REQUEST['uid'] ;
           $config["unique"] = $_REQUEST['unique'] ;
           $config["fileName"] = $_REQUEST['fileName'] ;
           $config["totalSize"] = $_REQUEST['totalSize'] ;
           $config["end"] = $_REQUEST['end'] ;
           $config["part"] = $_REQUEST['part'] ;
           $this->config = $config;
           $this->config['tmpPath'] = $this->config['savePath'].'/'.$this->config['sort'].'/'.$this->config['uid'].'/tmp/'.$this->config['unique'].'/';
           $this->stateInfo = $this->stateMap[ 0 ];
           $this -> upVideoFile();
           if($config['end'] == 'true'){
               $this->buildUpFiles();
           }
           $info = $this->getFileInfo();
       }catch (Exception $e){
           $res['code'] = 1;
           $res['state'] =  '参数异常或服务繁忙';
       }

       /**
         * 返回数据
         */
       if ($info['state'] == 'SUCCESS') {
            $res['code'] = 0;
            $res['url'] = str_replace($this -> webPath, '/back', $info['url']);
            $res['state'] = '上传成功';
       } else {
            $res['code'] = 1;
            $res['state'] =  $info['state'];
       }
       return $res;
    }

    /**
     * 上传文件的主处理方法
     * @param $base64
     * @return mixed
     */
    private function upFile()
    {
        //处理上传
        $file = $this->file = $_FILES["{$this->fileField}"];
        if ( !$file ) {
            $this->stateInfo = $this->getStateInfo( 'POST' );
            return;
        }
        if ( $this->file[ 'error' ] ) {
            $this->stateInfo = $this->getStateInfo( $file[ 'error' ] );
            return;
        }
        if ( !is_uploaded_file( $file[ 'tmp_name' ] ) ) {
            $this->stateInfo = $this->getStateInfo( "UNKNOWN" );
            return;
        }

        $this->oriName = $file[ 'name' ];
        $this->fileSize = $file[ 'size' ];
        $this->fileType = $this->getFileExt();

        if ( !$this->checkSize() ) {
            $this->stateInfo = $this->getStateInfo( "SIZE" );
            return;
        }
        if ( !$this->checkType() ) {
            $this->stateInfo = $this->getStateInfo( "TYPE" );
            return;
        }

        $folder = $this->getFolder($this->config[ "savePath" ]);

        if ( $folder === false ) {
            $this->stateInfo = $this->getStateInfo( "DIR_ERROR" );
            return;
        }

        $this->fullName = $folder . $this->getName();
        if ( $this->stateInfo == $this->stateMap[ 0 ] ) {
            if ( !move_uploaded_file( $file[ "tmp_name" ] , $this->fullName ) ) {
                $this->stateInfo = $this->getStateInfo( "MOVE" );
            }else{
                if (!$this -> config['addMark']){
                    $this-> fullName = $this -> addMark($this -> fullName);
                }
                if ( !($this -> config['format'] === '0*0' || $this -> config['format'] === '0%') ){
                    $res = Helper::imageChangeByFormat($this -> fullName, $this -> fullName, $this -> config['format']);
                    $this -> config['param'] = $res;
                }
            }
        }
    }

    /**
     * 上传视频文件的主处理方法
     * @param $base64
     * @return mixed
     */
    private function upVideoFile()
    {
        //处理上传
        $file = $this->file = $_FILES["{$this->fileField}"];
        if ( !$file ) {
            $this->stateInfo = $this->getStateInfo( 'POST' );
            return;
        }
        if ( $this->file[ 'error' ] ) {
            $this->stateInfo = $this->getStateInfo( $file[ 'error' ] );
            return;
        }
        if ( !is_uploaded_file( $file[ 'tmp_name' ] ) ) {
            $this->stateInfo = $this->getStateInfo( "UNKNOWN" );
            return;
        }

        $this->oriName = $this -> config['fileName'];
        $this->fileSize = $this -> config['totalSize'];
        $this -> file['name'] = $this->config['fileName'];
        $this->fileType =  $this->getFileExt();

        if ( !$this->checkSize() ) {
            $this->stateInfo = $this->getStateInfo( "SIZE" );
            return;
        }
        if ( !$this->checkType() ) {
            $this->stateInfo = $this->getStateInfo( "TYPE" );
            return;
        }

        $folder = $this->getFolder($this->config[ "tmpPath" ]);

        if ( $folder === false ) {
            $this->stateInfo = $this->getStateInfo( "DIR_ERROR" );
            return;
        }

        $this->fullName = $folder . $this->config['part'] . '.tmp';
        if ( $this->stateInfo == $this->stateMap[ 0 ] ) {
            if ( !move_uploaded_file( $file[ "tmp_name" ] , $this->fullName ) ) {
                $this->stateInfo = $this->getStateInfo( "MOVE" );
            }
        }
    }

    /**
     * 组装缓存文件
     * @param $base64
     * @return mixed
     */
    private function buildUpFiles()
    {
        $result = true;
        $tempPath = $this->config['tmpPath'];
        $toPath = $this->config['savePath'].'/'.$this->config['sort'].'/'.$this->config['uid'].'/tmp/';
        $folder = $this->getFolder($toPath);
        if ( $folder === false ) {
            $this->stateInfo = $this->getStateInfo( "DIR_ERROR" );
            return;
        }
        $this->fullName = $folder . $this->getName();

        $fileExists = false;
        if ( $file = fopen( $this->fullName , "a")){
            for ($part = 1 ; $part < $this -> config['part']+1 ; $part++){
                $fromPath = $tempPath . $part . '.tmp';
                if (!file_exists($fromPath)) {
                    $fileExists = true;
                    $result = false;
                    break;
                }
                $tmpData = file_get_contents($fromPath);
                fwrite($file, $tmpData);
            }
            fclose($file);
            if ($fileExists){
                @unlink( $this->fullName );
            }
        }else{
            $result = false;
        }

        //清除缓存
        $this -> deleteFolder($tempPath);

        if ( $result === false ) {
            $this->stateInfo = $this->getStateInfo( "MOVE" );
            return;
        }
    }

    /**
     * 处理base64编码的图片上传
     * @param $base64Data
     * @return mixed
     */
    private function base64ToImage( $base64Data )
    {
        $img = base64_decode( $base64Data );
        $this->fileName = time() . rand( 1 , 10000 ) . ".png";
        $this->fullName = $this->getFolder($this->config[ "savePath" ]) . '/' . $this->fileName;
        if ( !file_put_contents( $this->fullName , $img ) ) {
            $this->stateInfo = $this->getStateInfo( "IO" );
            return;
        }
        $this->oriName = "";
        $this->fileSize = strlen( $img );
        $this->fileType = ".png";
    }

    /**
     * 获取当前上传成功文件的各项信息
     * @return array
     */
    public function getFileInfo()
    {
        return array(
            "name" => $this->fileName ,
            "url" => $this->fullName ,
            "size" => $this->fileSize ,
            "type" => $this->fileType ,
            "state" => $this->stateInfo
        );
    }

    /**
     * 上传错误检查
     * @param $errCode
     * @return string
     */
    private function getStateInfo( $errCode )
    {
        return !$this->stateMap[ $errCode ] ? $this->stateMap[ "UNKNOWN" ] : $this->stateMap[ $errCode ];
    }

    /**
     * 重命名文件
     * @return string
     */
    private function getName()
    {
        return $this->fileName = date("YmdHis") . rand(10000, 99999) . "-" . $this->config["uid"] . $this->getFileExt();
    }

    /**
     * 文件类型检测
     * @return bool
     */
    private function checkType()
    {
        return in_array( $this->getFileExt() , $this->config[ "allowFiles" ] );
    }

    /**
     * 文件大小检测
     * @return bool
     */
    private function  checkSize()
    {
        return $this->fileSize <= ( $this->config[ "maxSize" ] * 1024 );
    }

    /**
     * 获取文件扩展名
     * @return string
     */
    private function getFileExt()
    {
        return strtolower( strrchr( $this->file[ "name" ] , '.' ) );
    }

    /**
     * @todo : 本函数用于 将方形的图片压缩后
     *         再裁减成圆形 做成logo
     *         与背景图合并
     *         入口方法是 addMark();
     * @param string $background 背景图地址
     * @param string $mark 标志图片地址
     * @return string 返回url
     */
    public function addMark($background,$mark = ''){
        //Logo
        if (empty($mark)){
            $mark = dirname(__DIR__).DIRECTORY_SEPARATOR.'web/images/mark-logo.jpg';
        }
        $markimgurl = $mark;
        //背景图
        if ( !file_exists( $background ) ) {
            $res = '{"result_code":"404","msg":"图片未存在"}';
            exit($res);
        }
        //logo是否存在
        if ( !file_exists( $markimgurl ) ) {
            $res = '{"result_code":"404","msg":"图片未存在"}';
            exit($res);
        }
        $bgurl = $background;
        $imgs['dst'] = $bgurl;
        list($imgs['width'], $imgs['height']) = getimagesize($bgurl); //获取背景原图尺寸
        //第一步 压缩图片
        $imggzip = $this->resize_img($markimgurl,$imgs);
        //第二步 裁减成圆角图片
        $imgs['src'] = $this->alterCircle($imggzip);
        //第三步 合并图片
        $dest = $this->mergerImg($imgs);
        return $dest;
    }

    //压缩图片
    public function resize_img($url,$imgs = '',$path=''){
        if (empty($path)){
            $path = dirname(__DIR__).DIRECTORY_SEPARATOR.'web/statics/mark/';
        }
        if (!file_exists($path)){
            $this->getFolder($path);
        }
        $imgname = $path.uniqid().'.jpg';
        $file = $url;
        list($width, $height) = getimagesize($file); //获取原图尺寸
        !empty($imgs['width']) ?  $percent = ($imgs['width']/16/$width) :  $percent = (80/$width);  //缩放尺寸百分百比
        //缩放尺寸
        $newwidth = $width * $percent;
        $newheight = $height * $percent;
        $src_im = imagecreatefromjpeg($file);
        $dst_im = imagecreatetruecolor($newwidth, $newheight);
        imagecopyresized($dst_im, $src_im, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
        imagejpeg($dst_im, $imgname); //输出压缩后的图片
        imagedestroy($dst_im);
        imagedestroy($src_im);
        return $imgname;
    }

    //生成圆角图片
    public function alterCircle($url,$path=''){
        if (empty($path)){
            $path = dirname(__DIR__).DIRECTORY_SEPARATOR.'web/statics/mark/';
        }
        list($width, $height) = getimagesize($url); //获取原图尺寸
        $w = $width;  $h=$height; // original size
        $original_path= $url;
        $dest_path = $path.uniqid().'.png';
        $src = imagecreatefromstring(file_get_contents($original_path));
        $newpic = imagecreatetruecolor($w,$h);
        imagealphablending($newpic,false);
        $transparent = imagecolorallocatealpha($newpic, 0, 0, 0, 127);
        $r=$w/2;
        for($x=0;$x<$w;$x++)
            for($y=0;$y<$h;$y++){
                $c = imagecolorat($src,$x,$y);
                $_x = $x - $w/2;
                $_y = $y - $h/2;
                if((($_x*$_x) + ($_y*$_y)) < ($r*$r)){
                    imagesetpixel($newpic,$x,$y,$c);
                }else{
                    imagesetpixel($newpic,$x,$y,$transparent);
                }
            }
        imagesavealpha($newpic, true);
        // header('Content-Type: image/png');
        imagepng($newpic, $dest_path);
        imagedestroy($newpic);
        imagedestroy($src);
        unlink($url); //删除压缩图
        return $dest_path;
    }

    //php 合并图片
    public function mergerImg($imgs,$path='') {
        if (empty($path)){
            $path = dirname(__DIR__).DIRECTORY_SEPARATOR.'web/statics/mark/tmp/';
        }
        if ( !file_exists( $path ) ) {
            if ( !mkdir( $path , 0777 , true ) ) {
                return false;
            }
        }
        $imgname = $path.$this->getName();
        list($max_width, $max_height) = getimagesize($imgs['dst']);
        $dests = imagecreatetruecolor($max_width, $max_height);
        switch (exif_imagetype($imgs['dst'])){
            case '2' : {
                $dst_im = imagecreatefromjpeg($imgs['dst']);
            }break;
            case '3' : {
                $dst_im = imagecreatefrompng($imgs['dst']);
            }break;
            default : {
                $res = '{"code":"1","state":"暂不支持此图片格式"}';
                exit($res);
            }break;
        }
        imagecopy($dests,$dst_im,0,0,0,0,$max_width,$max_height);
        imagedestroy($dst_im);

        list($width, $height) = getimagesize($imgs['src']); //获取压缩图尺寸
        $src_im = imagecreatefrompng($imgs['src']);
        $src_info = getimagesize($imgs['src']);
        imagecopy($dests,$src_im,$max_width-$width-14,$max_height-$height-14,0,0,$src_info[0],$src_info[1]);
        imagedestroy($src_im);

//         var_dump($imgs);exit;
//         header("Content-type: image/jpeg");
        imagejpeg($dests,$imgname);
//        unlink($imgs['dst']);
        unlink($imgs['src']);
        copy( $imgname, $imgs['dst']);
        unlink($imgname);
        $imgname = $imgs['dst'];
        return  $imgname;
    }
}