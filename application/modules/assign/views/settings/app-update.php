<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SysSettings */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Sys Settings',
]) . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Sys Settings'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update');
?>
<div class="sys-settings-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
