<?php

namespace app\manage\model;

use app\common\model\HomeUserLog as BaseHomeUserLog;

use app\manage\model\HomeUser;

/**
 * This is the model class for table "{{%home_user_log}}".
 *
 * @property integer $id
 * @property integer $home_user_id
 * @property string $route
 * @property string $url
 * @property string $user_agent
 * @property string $gets
 * @property string $posts
 * @property string $target
 * @property string $ip
 * @property string $created_at
 * @property string $updated_at
 *
 * @property HomeUser $homeUser
 */
class HomeUserLog extends BaseHomeUserLog
{

}
