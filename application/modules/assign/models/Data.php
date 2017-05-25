<?php

namespace backend\modules\assign\models;

use Yii;

/**
 * This is the model class for table "{{%data}}".
 *
 * @property integer $id
 * @property integer $create_uid
 * @property integer $lived_uid
 * @property string $version
 * @property string $range
 * @property integer $pass
 * @property string $created_at
 * @property string $updated_at
 * @property string $lived_at
 */
class Data extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%data}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['create_uid', 'lived_uid', 'version', 'range', 'created_at', 'updated_at'], 'required'],
            [['create_uid', 'lived_uid', 'pass'], 'integer'],
            [['created_at', 'updated_at', 'lived_at'], 'safe'],
            [['version'], 'string', 'max' => 180],
            [['range'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'create_uid' => Yii::t('backend', '创建用户'),
            'lived_uid' => Yii::t('backend', '最近使用用户'),
            'version' => Yii::t('backend', '版本编号'),
            'range' => Yii::t('backend', '包含的表'),
            'pass' => Yii::t('backend', '是否无效'),
            'created_at' => Yii::t('backend', '创建时间'),
            'updated_at' => Yii::t('backend', '更新时间'),
            'lived_at' => Yii::t('backend', '最近使用时间'),
        ];
    }
}
