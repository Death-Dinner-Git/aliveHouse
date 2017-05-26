<?php

namespace app\manage\model;

use app\common\model\BackUserLog as BaseBackUserLog;

use app\manage\model\BackUser;

/**
 * This is the model class for table "{{%back_user_log}}".
 *
 * @property integer $id
 * @property integer $back_user_id
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
 * @property BackUser $backUser
 */
class BackUserLog extends BaseBackUserLog
{

}
