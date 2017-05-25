<?php

namespace backend\modules\assign\models\searches;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\assign\models\Notices;
use backend\models\Admin;

/**
 * NoticesSearch represents the model behind the search form about `backend\modules\assign\models\Notices`.
 */
class NoticesSearch extends Notices
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'uid', 'pass', 'order'], 'integer'],
            [['title', 'content', 'created_at', 'updated_at', 'ended_at'], 'safe'],
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
     * Creates data provider instance with search query applied
     *
     * @param array $params
     * @param array $conditions
     * @param integer $pageSize
     *
     * @return ActiveDataProvider
     */
    public function search($params, $conditions, $pageSize = 20)
    {
        $query = Notices::find()
            ->from(Notices::tableName() . ' t')
            ->joinWith(['user' => function ($q) {
                $q->from(Admin::tableName() . ' u');
            }]);

        $query->andwhere($conditions);

        // add conditions that should always apply here
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $pageSize,
            ]
        ]);

        $sort = $dataProvider->getSort();
        $sort->attributes['t.created_at'] = [
            'desc' => ['t.created_at' => SORT_DESC],
        ];

        $sort->defaultOrder = ['t.created_at' => SORT_DESC];


        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            't.id' => $this->id,
            't.uid' => $this->uid,
            't.pass' => $this->pass,
            't.order' => $this->order,
            't.created_at' => $this->created_at,
            't.updated_at' => $this->updated_at,
            't.ended_at' => $this->ended_at,
        ]);

        $query->andFilterWhere(['like', 't.title', $this->title])
            ->andFilterWhere(['like', 't.content', $this->content]);

        return $dataProvider;
    }
}
