<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\modules\assign\models\Notices */
$this->title = $model->title;
$state = ['未知', '待审核', '已通过', '已推送', '保存', '已无效'];
?>
<div class="notices-view">

    <h1 style=" padding:5px 100px 5px 0;  text-align:center; color: #1fb5ac;"><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('我的推送消息', ['notices/apply'], ['class'=> 'btn btn-primary'] ) ?>
        <?= Html::a('申请推送消息', ['notices/create'], ['class'=> 'btn btn-primary'] ) ?>
        <?= $model->pass == 4 ? Html::a('更新', ['notices/update', 'id' => $model->id], ['class' => 'btn btn-primary']) : '' ?>
        <?= Html::a('删除', ['notices/delete', 'id' => $model->id], [
            'class' => 'btn btn-primary',
            'data' => [
                'confirm' => Yii::t('backend', '你确定要删除该推送消息吗?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'label' => '申请人',
                'value' => $model->username,
            ],
            'title',
            'content:ntext',
            'pass',
            [
                'label' => '状态',
                'value' => $state[$model->pass],
            ],
            'created_at',
            'started_at',
            'ended_at',
        ],
    ]) ?>

</div>
