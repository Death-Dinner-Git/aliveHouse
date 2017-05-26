<?php

namespace app\manage\model;

use app\common\model\NoticeRead as BaseNoticeRead;
use app\manage\model\BackUser;
use app\manage\model\Notice;

/**
 * This is the model class for table "{{%notice_read}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $back_user_id
 * @property integer $notice_id
 * @property string $content
 * @property string $remark
 * @property string $reback
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property Notice $notice
 */
class NoticeRead extends BaseNoticeRead
{

}