<?php

namespace app\manage\model;

use app\common\model\ContactRead as BaseContactRead;

use app\manage\model\BackUser;
use app\manage\model\Contact;

/**
 * This is the model class for table "{{%contact_read}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $assign
 * @property integer $back_user_id
 * @property integer $contact_id
 * @property string $content
 * @property string $remark
 * @property string $reback
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property Contact $contact
 */
class ContactRead extends BaseContactRead
{

}
