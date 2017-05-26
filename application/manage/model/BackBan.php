<?php

namespace app\manage\model;

use app\common\model\BackBan as BaseBackBan;

use app\common\model\BackAuthItem;
use app\manage\model\BackUser;

/**
 * This is the model class for table "{{%back_ban}}".
 *
 * @property string $item_name
 * @property integer $back_user_id
 * @property integer $ban
 * @property string $created_at
 *
 * @property BackAuthItem $itemName
 * @property BackUser $backUser
 */
class BackBan extends BaseBackBan
{

}
