<?php

namespace backend\modules\assign\models\searches;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\assign\models\SysSettings;

/**
 * SysSettingsSearch represents the model behind the search form about `backend\models\SysSettings`.
 */
class SysSettingsSearch extends SysSettings
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'type'], 'integer'],
            [['set_key', 'set_description', 'set_value', 'on_date', 'update_date'], 'safe'],
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
        $query = SysSettings::find();

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
            'type' => $this->type,
            'on_date' => $this->on_date,
            'update_date' => $this->update_date,
        ]);

        $query->andFilterWhere(['like', 'set_key', $this->set_key])
            ->andFilterWhere(['like', 'set_description', $this->set_description])
            ->andFilterWhere(['like', 'set_value', $this->set_value]);

        return $dataProvider;
    }
}
