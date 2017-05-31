<?php

namespace app\manage\model;

use app\common\model\Ban as BaseBan;

use app\common\model\AuthItem;
use app\manage\model\BackUser;
use app\manage\validate\BanValidate;

/**
 * This is the model class for table "{{%back_ban}}".
 *
 * @property string $item_name
 * @property integer $back_user_id
 * @property integer $ban
 * @property string $created_at
 *
 * @property AuthItem $itemName
 * @property BackUser $backUser
 */
class Ban extends BaseBan
{

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return BanValidate::load();
    }

    /**
     * @param $data
     * @param string $scene
     * @return bool
     */
    public static function check($data,$scene = ''){
        $validate = self::getValidate();

        //设定场景
        if (is_string($scene) && $scene !== ''){
            $validate->scene($scene);
        }

        return $validate->check($data);
    }
}
