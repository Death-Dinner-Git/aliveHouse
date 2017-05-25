<?php

namespace backend\modules\assign\models;

use Yii;
use yii\db\ActiveRecord;
use backend\modules\assign\components\RegionConfigs;

/**
/**
 * This is the model class for table "{{%region_item}}".
 *
 * @property double $id
 * @property string $code
 * @property string $name
 * @property double $parent
 * @property double $level
 * @property double $order
 * @property string $name_en
 * @property string $short_name_en
 * @property string $data
 */
class Region extends ActiveRecord
{
    public $parent_name;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return RegionConfigs::instance()->regionTable;
    }

    /**
     * @inheritdoc
     */
    public static function getDb()
    {
        if (RegionConfigs::instance()->db !== null) {
            return RegionConfigs::instance()->db;
        } else {
            return parent::getDb();
        }
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'name', 'parent', 'level', 'order', 'name_en', 'short_name_en'], 'required'],
            [['parent', 'level', 'order'], 'number'],
            [['data'], 'string'],
            [['code', 'name', 'name_en'], 'string', 'max' => 100],
            [['short_name_en'], 'string', 'max' => 10],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'code' => Yii::t('backend', 'Code'),
            'name' => Yii::t('backend', 'Name'),
            'type' => Yii::t('backend', 'Type'),
            'parent' => Yii::t('backend', 'Parent'),
            'level' => Yii::t('backend', 'Level'),
            'order' => Yii::t('backend', 'Order'),
            'name_en' => Yii::t('backend', 'Name En'),
            'short_name_en' => Yii::t('backend', 'Short Name En'),
            'data' => Yii::t('backend', 'Data'),
        ];
    }

    /**
     * Get region parent
     * @return \yii\db\ActiveQuery
     */
    public function getRegionParent()
    {
        return $this->hasOne(Region::className(), ['id' => 'parent']);
    }

    /**
     * Get region children
     * @return \yii\db\ActiveQuery
     */
    public function getRegions()
    {
        return $this->hasMany(Region::className(), ['parent' => 'id']);
    }

    /**
     * Get saved routes.
     * @return array
     */
    public static function getSavedRoutes()
    {
        $result = [];
        foreach (Yii::$app->getAuthManager()->getPermissions() as $name => $value) {
            if ($name[0] === '/' && substr($name, -1) != '*') {
                $result[] = $name;
            }
        }

        return $result;
    }
}
