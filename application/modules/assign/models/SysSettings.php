<?php

namespace backend\modules\assign\models;

use Yii;

/**
 * This is the model class for table "{{%sys_settings}}".
 *
 * @property integer $id
 * @property string $set_key
 * @property string $set_description
 * @property string $set_value
 * @property integer $type
 * @property string $on_date
 * @property string $update_date
 */
class SysSettings extends \yii\db\ActiveRecord
{
    const TYPE_SYS = 1;   //type默认为1，表示网站系统配置，
    const TYPE_APP = 2;    //type可能值为2，表示APP配置，

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sys_settings}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['type', 'default', 'value' => self::TYPE_SYS],
            ['type','in', 'range' => [self::TYPE_SYS, self::TYPE_APP]],
            [['set_key', 'set_description', 'set_value', 'type'], 'required'],
            [['on_date', 'update_date'],  'default', 'value' => date('Y-m-d H:i:s')],
            [['on_date', 'update_date'], 'safe'],
            [['set_key', 'set_description'], 'string', 'max' => 128],
            [['set_value'], 'string', 'max' => 256],
            [['set_key'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'set_key' => Yii::t('backend', '配置项键'),
            'set_description' => Yii::t('backend', '配置项名'),
            'set_value' => Yii::t('backend', '配置项值'),
            'type' => Yii::t('backend', '配置分类'),
            'on_date' => Yii::t('backend', '配置时间'),
            'update_date' => Yii::t('backend', '配置更新时间'),
        ];
    }
}
