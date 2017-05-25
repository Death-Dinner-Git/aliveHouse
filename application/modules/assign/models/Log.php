<?php

namespace backend\modules\assign\models;


use yii;
use backend\modules\assign\components\Configs;
use yii\base\Action;
use yii\db\ActiveRecord;


/**
 * This is the model class for table "admin_log".
 *
 * @property integer $id admin_log id(autoincrement)
 * @property string $name admin_log controller
 */
class Log extends ActiveRecord
{

    public $userClassName;

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        if ($this->userClassName === null) {
            $this->userClassName = Yii::$app->getUser()->identityClass;
            $this->userClassName = $this->userClassName ? : 'backend\models\Admin';
        }
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['route', 'url', 'user_agent', 'admin_email', 'ip'], 'string', 'min' => 0, 'max' => 255],
            [['admin_id', 'route', 'url'], 'required'],
            [['admin_id'], 'integer', 'min' => 0, 'max' => 99999999999],
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            yii\behaviors\TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return Configs::instance()->adminLogTable;
    }

    /**
     * @param $action Action
     */
    public static function addLog($action)
    {
        $model = new Log();

        $model->route = $action->uniqueId;
        $model->url = Yii::$app->request->absoluteUrl;

        $headers = Yii::$app->request->headers;

        if ($headers->has('User-Agent')) {
            $model->user_agent =  $headers->get('User-Agent');
        }

        $model->gets = json_encode(Yii::$app->request->get());
        $model->posts = json_encode(Yii::$app->request->post());
        $model->admin_id = Yii::$app->user->identity['id'];
        $model->admin_email = Yii::$app->user->identity['email'];
        $model->ip = Yii::$app->request->userIP;

        $model->save();

    }

    /**
     * @inheritdoc
     */
    public function attributeLabels(){
        return [
            'route' => Yii::t('backend', 'Route'),
            'url' => Yii::t('backend', 'Url'),
            'admin' => Yii::t('backend', 'User'),
            'admin_email' => Yii::t('backend', 'Email'),
            'ip' => Yii::t('backend', 'Ip'),
            'user_agent' => Yii::t('backend', 'User Agent'),
            'updated_at' => Yii::t('backend', 'Updated At'),
            'created_at' => Yii::t('backend', 'Created At'),
        ];
    }

    /**
     * Get admin name
     * @return \yii\db\ActiveQuery
     */
    public function getAdmin()
    {
        $model = new $this->userClassName;
        return $this->hasOne($model::className(), ['id' => 'admin_id']);
    }



}