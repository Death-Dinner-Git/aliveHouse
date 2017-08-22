<?php

namespace app\common\model;

use app\common\model\Images;
use app\common\validate\ImagesValidate;

/**
 * This is the model class for table "{{%images}}".
 *
 */
class ImagesBuilding extends Images
{

    public $type = '1';

    /**
     * 数据库表名
     * 加格式‘{{%}}’表示使用表前缀，或者直接完整表名
     * @author Sir Fu
     */
    protected $table = '{{%images_building}}';

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return ImagesValidate::load();
    }

}
