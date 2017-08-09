<?php
namespace app\common\model;

use think\Db;
use think\Loader;
use think\db\Query;
use think\Config;
use app\common\components\LangHelper;

/**
 * @property array $rules
 * @property array $attributeLabels
 */
class Model extends \think\Model
{

    /**
     * @return \app\common\components\Helper
     */
    public static function getHelper(){
        return \app\common\components\Helper::getInstance();
    }

    public function getTableInformation($path = '',$namespace = ''){
        if (!file_exists($path) || !is_dir($path)){
            return;
        }

        if ($od = opendir($path)){
            $str = '<?php'.PHP_EOL.PHP_EOL;
            $str .= 'class ClassModel {'.PHP_EOL;
            while (($file = readdir($od)) !== false)  //读取该目录内文件
            {
                $tmp = explode('.',$file);
                $className = $tmp[0];
                if (!empty($className) && $className != 'Model'){
                    $str .= '/**'.$className.'**/'.PHP_EOL;
                    $str .= 'protected $field = ['.PHP_EOL;
                    $className = $namespace.$className;
                    /**
                     * @var $model \think\Model
                     */
                    $model = new $className;
                    $info = $model->getTableInfo();
                    foreach ($info['fields'] as $field){
                        $str .= "'".$field."',".PHP_EOL;
                    }
                    $str .= "];".PHP_EOL.PHP_EOL;
                }
            }
            $str .= "}".PHP_EOL.PHP_EOL;
            @file_put_contents($path.'/ClassModel.php',$str);
            closedir($od);
        }
    }

    public function getTableInfoAll(){
        $sql = "select * from information_schema.columns where table_name='wf_soap_detail' ";
    }

    /**
     * @return array
     */
    public function rules(){
        return [];
    }

    /**
     * @return array
     */
    public function attributeLabels(){
        return [];
    }


    //自动日期格式
    public function setDate(){
        return date('Y-m-d H:i:s');
    }

    //自动时间戳
    public function setTime(){
        return time();
    }

    /**
     * @param array $data
     * @return array
     */
    public function filter($data = []){
        $ret = [];
        if (!empty($data) && is_array($data)){
            $field = $this->field;
            if (!$field){
                $field = $this->getTableInfo()['fields'];
            }
            foreach ($field as $value){
                $ret[$value] = isset($data[$value]) ? (is_array($data[$value]) ? (implode(',',$data[$value])) : $data[$value]) : null;
                if ($ret[$value] === null){
                    unset($ret[$value]);
                }
            }
        }
        return $ret;
    }

    /**
     * Model constructor.
     * @param array $data
     */
    public function __construct($data = [])
    {

        if (is_callable([$this,'rules'])){
            $rules = $this->rules();
            if (is_array($rules)){
                $this->validate = $rules;
            }
        }

        parent::__construct($data);
    }

    /**
     * 获取当前模型的数据库查询对象
     * @access public
     * @param bool $baseQuery 是否调用全局查询范围
     * @return Query
     */
    public function db($baseQuery = true)
    {
        $model = $this->class;
        if (!isset(self::$links[$model])) {
            // 合并数据库配置
            if (!empty($this->connection)) {
                if (is_array($this->connection)) {
                    $connection = array_merge(Config::get('database'), $this->connection);
                } else {
                    $connection = $this->connection;
                }
            } else {
                $connection = [];
            }
            // 设置当前模型 确保查询返回模型对象
            $query = Db::connect($connection)->getQuery($model, $this->query);

            // 设置当前数据表和模型名
            if (!empty($this->table)) {
                $pattern = '{{%(.*?)}}';
                if (preg_match($pattern,$this->table)){
                    $this->table = ltrim($this->table,'{{%');
                    $this->table = rtrim($this->table,'}}');
                    if ($prefix = Config('database.prefix')){
                        $this->table = $prefix.$this->table;
                    }
                }
                $query->setTable($this->table);
            } else {
                $query->name($this->name);
            }

            if (!empty($this->pk)) {
                $query->pk($this->pk);
            }

            self::$links[$model] = $query;
        }
        // 全局作用域
        if ($baseQuery && method_exists($this, 'base')) {
            call_user_func_array([$this, 'base'], [& self::$links[$model]]);
        }
        // 返回当前模型的数据库查询对象
        return self::$links[$model];
    }

    /**
     * 实例化（分层）模型
     * @param string $name         Model名称
     * @param string $layer        业务层名称
     * @param bool   $appendSuffix 是否添加类名后缀
     * @param string $common       公共模块名
     * @return Object | \think\Model
     * @throws \think\exception\ClassNotFoundException
     */
    public static function load($name = '', $layer = 'model', $appendSuffix = false, $common = 'common')
    {
        if ($name === ''){
            $name = get_called_class();
        }
        return Loader::model($name,$layer,$appendSuffix,$common);
    }

    /**
     * @return string
     */
    public static function tableName()
    {
        /**
         * @var $className self;
         */
        $className = get_called_class();
        /**
         * @var $model \think\Model;
         */
        $model = $className::load();
        return $model->getTable();
    }

    /**
     * @return string
     */
    public static function tableNameSuffix()
    {
        $table = self::tableName();
        if ($prefix = Config('database.prefix')){
            $table = str_replace($prefix,'',$table);
        }
        return $table;
    }

    /**
     * @return string
     */
    public function getTableSuffix()
    {
        $table = $this->getTable();
        if ($prefix = Config('database.prefix')){
            $table = str_replace($prefix,'',$table);
        }
        return $table;
    }

    /**
     * @description 获取 模型 数据包助手
     * @return \app\common\components\LangHelper
     */
    public static function getLangHelper(){
        return LangHelper::getInstance();
    }

    /**
     * @description 获取 当前 模型 的数据包 与实例 getLang 方法同样效果，一个静态方法，一个实例方法
     * @return array
     */
    public static function Lang(){
        return self::getLangHelper()->get(self::tableNameSuffix());
    }

    /**
     * @description 获取 当前 模型 的数据包 与静态 Lang 方法同样效果，一个静态方法，一个实例方法
     * @return array
     */
    public function getLang(){
        return LangHelper::getInstance()->get($this->getTableSuffix());
    }

    /**
     *
     * @param null $field
     * @param null $key
     * @param null $default
     * @return array|string
     */
    public static function T($field=null,$key=null,$default=null){
        $ret = '';
        $key = (string)($key);
        if (is_string($field) && $field != '' && is_string($key) && $key != '' ){
            $ret = LangHelper::getInstance()->getValue(self::tableNameSuffix(),$field,$key);
            if (empty($ret)){
                $ret = (string)$default;
            }
        }else if (is_string($field) && $field != ''){
            $ret = LangHelper::getInstance()->getField(self::tableNameSuffix(),$field);
            if (empty($ret)){
                $ret = (array)$default;
            }
        }
        return $ret;
    }

    /**
     * @description 获取当前模型数据包值 与 静态 T 方法同样效果，一个静态方法，一个实例方法
     * @param null $field
     * @param null $key
     * @param null $default
     * @return array|string
     */
    public function getValue($field=null,$key=null,$default=null){
        $ret = '';
        $key = (string)($key);
        if (is_string($field) && $field != '' && is_string($key) && $key != '' ){
            $ret = LangHelper::getInstance()->getValue($this->getTableSuffix(),$field,$key);
            if (empty($ret)){
                $ret = (string)$default;
            }
        }else if (is_string($field) && $field != ''){
            $ret = LangHelper::getInstance()->getField($this->getTableSuffix(),$field);
            if (empty($ret)){
                $ret = (array)$default;
            }
        }
        return $ret;
    }
}
