<?php

namespace app\manage\model;

use app\common\model\Opinion as BaseOpinion;

/**
 * This is the model class for table "{{%opinion}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property string $remark
 * @property integer $home_user_id
 * @property integer $back_user_id
 * @property string $content
 * @property string $username
 * @property string $contact
 * @property integer $readed
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property HomeUser $homeUser
 * @property OpinionRead[] $opinionReads
 */
class Opinion extends BaseOpinion
{

}
