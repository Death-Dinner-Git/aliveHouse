<?php

namespace app\manage\model;

use app\common\model\HouseBetter as BaseHouseBetter;

use app\manage\model\BackUser;

/**
 * This is the model class for table "{{%slider}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $is_passed
 * @property integer $back_user_id
 * @property string $url
 * @property string $target
 * @property string $title
 * @property string $start_at
 * @property string $end_at
 * @property integer $order
 * @property integer $status
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 */
class HouseBetter extends BaseHouseBetter
{

}
