<?php

namespace app\manage\model;

use app\common\model\Walk as BaseWalk;
use app\manage\model\Guest;

/**
 * This is the model class for table "{{%walk}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $guest_id
 * @property integer $on_server
 * @property string $created_at
 * @property string $updated_at
 *
 * @property Guest $guest
 */
class Walk extends BaseWalk
{

}
