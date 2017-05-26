<?php

namespace app\manage\model;

use app\common\model\Upload as BaseUpload;
use app\manage\model\BackUser;

/**
 * This is the model class for table "{{%upload}}".
 *
 * @property string $id
 * @property integer $is_delete
 * @property integer $back_user_id
 * @property string $name
 * @property string $path
 * @property string $url
 * @property string $ext
 * @property integer $size
 * @property string $md5
 * @property string $sha1
 * @property string $location
 * @property integer $download
 * @property string $create_time
 * @property string $update_time
 * @property integer $sort
 * @property integer $status
 *
 * @property BackUser $backUser
 */
class Upload extends BaseUpload
{

}
