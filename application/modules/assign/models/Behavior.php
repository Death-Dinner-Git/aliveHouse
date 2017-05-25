<?php


namespace backend\modules\assign\models;


use yii\behaviors\AttributeBehavior;
use yii\behaviors\SluggableBehavior;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

class Behavior
{
    public function behaviors()
    {
        return [
            [
                'class'      => AttributeBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => 'status',
                    // ActiveRecord::EVENT_BEFORE_UPDATE => 'attribute2',
                ],
                'value'      => function ($event) {
                    return '10';//填充值
                },
            ],
            [
                /**
                 * TimestampBehavior：
                 * 创建的时候，默认插入当前时间戳给created_at和updated_at字段
                 * 更新的时候，默认更新当前时间戳给updated_at字段
                 */
                'class'              => TimestampBehavior::className(),
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => 'updated_at',
                 'value'              => time(),
            ],
            [
                /**
                 * SluggableBehavior:
                 * 算是美化url的一种方法
                 * 通过填写title自动填充字段slug
                 * slug替换原本url中的参数部分，可以增加url的安全性。
                 */
                'class'         => SluggableBehavior::className(),
                'attribute'     => 'title',
                'slugAttribute' => 'slug',
            ],
            [
                /**
                 * BlameableBehavior：
                 * 创建的时候，默认插入当前用户ID给author_id和updater_id字段
                 * 更新的时候，默认更新当前用户ID给updater_id字段
                 */
                'class'              => BlameableBehavior::className(),
                'createdByAttribute' => 'author_id',
                'updatedByAttribute' => 'updater_id',
                // 'value'              => Yii::$app->user->id,
            ],
        ];
    }
}


