<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\SysSettings */

$this->title = Yii::t('backend', 'Create Sys Settings');
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Sys Settings'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-settings-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
