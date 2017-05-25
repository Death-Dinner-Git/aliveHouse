<?php

namespace backend\modules\assign\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id Menu id(autoincrement)
 * @property string $name Menu name
 * @property integer $parent Menu parent
 * @property string $route Route for this menu
 * @property integer $order Menu order
 * @property string $data Extra information for this menu
 *
 * @property array  $stepLists
 * @property string $step
 * @property string $aims
 * @property string $earn
 */
class MenuRules extends \yii\db\ActiveRecord
{
    public $stepLists = ['1'=>'第一阶段', '2'=>'第二阶段', '3'=>'第三阶段'];
    public $step;
    public $aims;
    public $earn;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%menu}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['step', 'aims', 'earn'], 'required'],
            [['aims', 'earn'], 'integer'],
            [['aims', 'earn'],'compare',  'compareValue'=>'0', 'operator'=>'>','message'=>'{attribute} 必须大于零'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'name' => Yii::t('backend', 'Name'),
            'parent' => Yii::t('backend', 'Parent'),
            'parent_name' => Yii::t('backend', 'Parent Name'),
            'route' => Yii::t('backend', 'Route'),
            'order' => Yii::t('backend', 'Order'),
            'data' => Yii::t('backend', 'Data'),
            'step' => Yii::t('backend', '阶段'),
            'aims' => Yii::t('backend', '目标'),
            'earn' => Yii::t('backend', '积分'),
        ];
    }

}
