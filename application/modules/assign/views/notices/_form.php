<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\assign\models\Notices */
/* @var $form yii\widgets\ActiveForm */

$this->registerCssFile('@web/plugins/datepicker/css/datepicker.css', ['depends' => 'backend\assets\AppAsset']);
//$this->registerCssFile('@web/plugins/timepicker/css/timepicker.css', ['depends' => 'backend\assets\AppAsset']);
$this->registerJsFile('@web/plugins/datepicker/js/datepicker.js', ['depends' => 'backend\assets\AppAsset']);
//$this->registerJsFile('@web/plugins/timepicker/js/timepicker.js', ['depends' => 'backend\assets\AppAsset']);

$jsTime = <<<JS
$(document).ready(function() {
    $( '.datepicker' ).datepicker();
//    $( '.timepicker' ).timepicker();
});
JS;


$this->registerJs($jsTime);
?>

<div class="notices-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title', [
        'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
        'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {hint}
                                                               {error}
                                                               </div>',
    ])->textInput(['placeholder' => '-- 请输入标题 -- '])->label('&nbsp;') ?>
    <div>
        <label class="col-lg-2 col-md-2  control-label label-align-center">&nbsp;</label>
        <div class="col-lg-9 col-md-9">

            <div class="col-lg-6 col-md-6" style="padding-left: 0px;">
                <?= $form->field($model, 'started_at',[
                    'labelOptions' => ['class' => 'control-label label-align-center'],
                    'template' => '<span class="label-align-center" style="display: inline-block;width: 20%;">{label}</span><span style="display: inline-block;width: 80%;">{input}</span><span style="display: block;padding-left: 20%;">{error}</span>',
                ])->textInput(['id' => 'gifts-start_date','value' =>  $model->isNewRecord && (!$model->started_at) ? date('Y-m-d',time()) : date('Y-m-d',strtotime($model -> started_at)),'class' => 'form-control datepicker', 'data-format'=>'yyyy-mm-dd', 'placeholder'=>'-- 开始时间 --'])->label('开始') ?>
            </div>
            <div class="col-lg-6 col-md-6" style="padding-left: 0px;padding-right: 0px;">
                <?=  $form->field($model, 'ended_at',[
                    'labelOptions' => ['class' => 'control-label label-align-center'],
                    'template' => '<span class="label-align-center" style="display: inline-block;width: 20%;">{label}</span><span style="display: inline-block;width: 80%;">{input}</span><span style="display: block;padding-left: 20%;">{error}</span>',
                ])->textInput(['id' => 'gifts-end_date','value' =>  $model->isNewRecord && (!$model->ended_at) ? date('Y-m-d',time()+24*60*60) : date('Y-m-d',strtotime($model -> ended_at)),'class' => 'form-control datepicker', 'data-format'=>'yyyy-mm-dd','placeholder'=>'-- 截止时间 --'])->label('截止') ?>
            </div>
        </div>
    </div>

    <?= $form->field($model, 'content', [
        'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
        'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {hint}
                                                               {error}
                                                               </div>',
    ])->textarea(['maxlength' => true, 'rows' => '16', 'onkeyup' => 'textareaAuto(this,360);', 'style' => 'resize: none;', 'placeholder' => '-- 请输入内容 -- '])
    ->label('&nbsp;') ?>

    <div class="col-lg-9 col-md-9 col-lg-offset-2  col-md-offset-2">
        <div class="form-group col-lg-7 col-md-7 col-lg-offset-3  col-md-offset-3">
            <?= Html::submitButton('保存', ['class' => 'btn btn-primary']) ?>
            <?= Html::submitButton('提交审核', ['class' => 'btn btn-primary', 'id' => 'submitCheck', 'name' => 'submitCheck', 'value' => 'check']) ?>
        </div>
    </div>

    <?php ActiveForm::end();   ?>

</div>
