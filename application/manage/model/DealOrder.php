<?php

namespace app\manage\model;

use app\common\model\DealOrder as BaseTakeOrder;
use app\manage\validate\TakeOrderValidate;
use app\manage\model\BackUser;
use app\manage\model\Client;

/**
 * This is the model class for table "{{%take_order}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $back_user_id
 * @property integer $client_id
 * @property string $order_code
 * @property integer $house_type
 * @property integer $goods_id
 * @property integer $deal_status
 * @property string $money
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property Client $client
 */
class DealOrder extends BaseTakeOrder
{

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return TakeOrderValidate::load();
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
