<?php

namespace app\manage\model;

use app\common\model\HomeUser as BaseHomeUser;

use app\manage\model\Contact;
use app\manage\model\HomeUserLog;
use app\manage\model\Opinion;

/**
 * This is the model class for table "{{%home_user}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property string $code
 * @property string $phone
 * @property integer $phone_verified
 * @property string $email
 * @property integer $email_verified
 * @property string $username
 * @property string $password
 * @property string $nickname
 * @property string $real_name
 * @property string $head_url
 * @property string $sex
 * @property string $signature
 * @property string $birthday
 * @property integer $height
 * @property integer $weight
 * @property string $token
 * @property string $auth_key
 * @property string $password_reset_token
 * @property string $password_reset_code
 * @property integer $status
 * @property string $ip
 * @property string $reg_ip
 * @property string $reg_type
 * @property string $registered_at
 * @property string $logined_at
 * @property string $updated_at
 *
 * @property Contact[] $contacts
 * @property HomeUserLog[] $homeUserLogs
 * @property Opinion[] $opinions
 */
class HomeUser extends BaseHomeUser
{

}
