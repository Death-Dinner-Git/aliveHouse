<?php

namespace app\manage\model;

use app\common\model\Opinion as BaseOpinion;

/**
 * This is the model class for table "{{%opinion_read}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property integer $assign
 * @property integer $back_user_id
 * @property integer $opinion_id
 * @property string $content
 * @property string $remark
 * @property string $reback
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BackUser $backUser
 * @property Opinion $opinion
 */
class OpinionRead extends BaseOpinion
{

}
