<?php

namespace app\manage\model;

use app\common\model\Ban as BaseBan;

use app\common\model\AuthItem;
use app\manage\model\BackUser;

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

}
