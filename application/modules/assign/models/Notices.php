<?php

namespace backend\modules\assign\models;

use Yii;
use backend\models\Admin;

/**
 * This is the model class for table "{{%notices}}".
 *
 * @property integer $id
 * @property integer $uid
 * @property integer $username
 * @property string $title
 * @property string $content
 * @property integer $pass
 * @property integer $order
 * @property string $created_at
 * @property string $updated_at
 * @property string $started_at
 * @property string $ended_at
 *
 * @property Admin $u
 */
class Notices extends \yii\db\ActiveRecord
{
    public $username;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%notices}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid', 'title', 'content', 'created_at', 'updated_at', 'started_at', 'ended_at'], 'required'],
            [['uid', 'pass', 'order'], 'integer'],
            [['content'], 'string'],
            [['created_at', 'updated_at', 'ended_at'], 'safe'],
            [['title'], 'string', 'max' => 50],
            [['uid'], 'exist', 'skipOnError' => true, 'targetClass' => Admin::className(), 'targetAttribute' => ['uid' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'uid' => Yii::t('backend', '申请人'),
            'title' => Yii::t('backend', '推送标题'),
            'content' => Yii::t('backend', '推送内容'),
            'pass' => Yii::t('backend', '状态'),
            'created_at' => Yii::t('backend', '申请时间'),
            'updated_at' => Yii::t('backend', '更新时间'),
            'started_at' => Yii::t('backend', '开始时间'),
            'ended_at' => Yii::t('backend', '截止时间'),
        ];
    }

    /**
     * 自动设置增值
     */
    public function setOrderValue(){
        $value = self::find()->max('`order`');
        $this->order = $value ? $value : 1;
    }

    /**
     * 获取申请人名称
     */
    public function getUsername($uid){
        $user = Admin::findOne($uid);
        if (!$user){
            return $user->username;
        }else{
            return null;
        }
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(Admin::className(), ['id' => 'uid']);
    }
}
