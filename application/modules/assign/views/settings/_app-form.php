<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\SysSettings */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-settings-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= !isset($model->id) ? $form->field($model, 'set_key')->textInput(['maxlength' => true]) : '' ?>

    <?= $form->field($model, 'set_description')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'set_value')->textInput(['maxlength' => true]) ?>

<!--    --><?//= $form->field($model, 'on_date')->textInput() ?>

<!--    --><?//= $form->field($model, 'update_date')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
