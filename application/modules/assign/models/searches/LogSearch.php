<?php

namespace backend\modules\assign\models\searches;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\assign\models\Log;

/**
 * Menu represents the model behind the search form about [[\backend\modules\assign\models\Menu]].
 */
class LogSearch extends Log
{

    public $username;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['route', 'username', 'url', 'admin_email', 'ip'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Searching menu
     * @param  array $params
     * @return \yii\data\ActiveDataProvider
     */
    public function search($params)
    {
        $query = LogSearch::find()->joinWith(['admin' => function ($query) {
            $userModel = new $this->userClassName;
            $query->from($userModel::tableName() . ' admin');
        }])->from(Log::tableName() . ' log')->select(['log.*','admin.username']);

        $dataProvider = new ActiveDataProvider([
            'query' => $query
        ]);

        $sort = $dataProvider->getSort();

        $sort->defaultOrder = ['created_at' => SORT_DESC];

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere(['like', 'lower(log.route)', strtolower($this->route)])
            ->andFilterWhere(['like', 'lower(admin.username)', $this->username])
            ->andFilterWhere(['like', 'lower(log.admin_email)', $this->admin_email])
            ->andFilterWhere(['like', 'lower(log.ip)', $this->ip])
            ->andFilterWhere(['like', 'lower(log.url)', strtolower($this->url)]);

        return $dataProvider;
    }
}
