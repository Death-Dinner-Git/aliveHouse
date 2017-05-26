<?php

namespace app\manage\model;

use app\common\model\Notice as BaseNotice;
use app\manage\model\BackUser;
use app\manage\model\NoticeRead;

/**
 * This is the model class for table "{{%notice}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $back_user_id
 * @property string $title
 * @property string $content
 * @property integer $is_passed
 * @property integer $order
 * @property string $remark
 * @property integer $readed
 * @property string $created_at
 * @property string $updated_at
 * @property string $start_at
 * @property string $end_at
 *
 * @property BackUser $backUser
 * @property NoticeRead[] $noticeReads
 */
class Notice extends BaseNotice
{

}
