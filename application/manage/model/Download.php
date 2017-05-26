<?php

namespace app\manage\model;

use app\common\model\Download as BaseDownload;

use app\manage\model\BackUser;

/**
 * This is the model class for table "{{%download}}".
 *
 * @property integer $id
 * @property integer $back_user_id
 * @property string $title
 * @property string $url
 * @property string $fileName
 * @property string $tb_name
 * @property string $tb_id
 * @property string $tb_category
 * @property string $created_at
 *
 * @property BackUser $backUser
 */
class Download extends BaseDownload
{

}
