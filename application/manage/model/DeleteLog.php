<?php

namespace app\manage\model;

use app\common\model\DeleteLog as BaseDeleteLog;

use app\manage\model\BackUser;

/**
 * This is the model class for table "{{%delete_log}}".
 *
 * @property integer $id
 * @property integer $table_type
 * @property integer $back_user_id
 * @property integer $delete_id
 * @property string $remark
 * @property string $created_at
 *
 * @property BackUser $backUser
 */
class DeleteLog extends BaseDeleteLog
{

}
