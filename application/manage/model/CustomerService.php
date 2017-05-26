<?php

namespace app\manage\model;

use app\common\model\CustomerService as BaseCustomerService;

use app\manage\model\BackUser;

/**
 * This is the model class for table "{{%customer_service}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $level
 * @property integer $back_user_id
 * @property integer $duration
 * @property string $start_at
 * @property string $end_at
 * @property integer $order
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 */
class CustomerService extends BaseCustomerService
{

}
