<?php

namespace app\manage\model;

use app\common\model\Contact as BaseContact;

use app\manage\model\BackUser;
use app\manage\model\HomeUser;
use app\manage\model\ContactRead;

/**
 * This is the model class for table "{{%contact}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property string $username
 * @property string $contact
 * @property string $email
 * @property string $address
 * @property string $content
 * @property integer $home_user_id
 * @property integer $back_user_id
 * @property integer $readed
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property HomeUser $homeUser
 * @property ContactRead[] $contactReads
 */
class Contact extends BaseContact
{

}