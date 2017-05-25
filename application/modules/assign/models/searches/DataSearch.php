<?php

namespace backend\modules\assign\models\searches;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\assign\models\Data;

/**
 * DataSearch represents the model behind the search form about `backend\modules\assign\models\Data`.
 */
class DataSearch extends Data
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'create_uid', 'lived_uid', 'pass'], 'integer'],
            [['version', 'range', 'created_at', 'updated_at', 'lived_at'], 'safe'],
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
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Data::find();

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
            'id' => $this->id,
            'create_uid' => $this->create_uid,
            'lived_uid' => $this->lived_uid,
            'pass' => $this->pass,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'lived_at' => $this->lived_at,
        ]);

        $query->andFilterWhere(['like', 'version', $this->version])
            ->andFilterWhere(['like', 'range', $this->range]);

        return $dataProvider;
    }
}
