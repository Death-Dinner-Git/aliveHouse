<?php

namespace app\manage\model;

use app\common\model\TakeOrder as BaseTakeOrder;
use app\manage\model\BackUser;
use app\manage\model\Guest;

/**
 * This is the model class for table "{{%take_order}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $back_user_id
 * @property integer $guest_id
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
 * @property Guest $guest
 */
class TakeOrder extends BaseTakeOrder
{

}
