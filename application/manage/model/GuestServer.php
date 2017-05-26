<?php

namespace app\manage\model;

use app\common\model\GuestServer as BaseGuestServer;

use app\manage\model\BackUser;
use app\manage\model\Guest;

/**
 * This is the model class for table "{{%guest_server}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $guest_id
 * @property integer $back_user_id
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property Guest $guest
 */
class GuestServer extends BaseGuestServer
{

}
