<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\assign\models\MenuRules */
/* @var $form yii\widgets\ActiveForm */

$this->title = $model->name;

$this->registerCssFile('@web/plugins/modal/zeroModal.css', ['depends' => 'backend\assets\AppAsset']);
$this->registerJsFile('@web/plugins/modal/zeroModal.js', ['depends' => 'backend\assets\AppAsset']);

$jsRules = <<<JS
    var rules = [],
        prerules = [],
        _form = {
           step:'',
           aims:'',
           earn:'',
        };
    function init(){
        var oldRules = $('#rules-data').val();
        oldRules = JSON.parse(oldRules);
        for(var i = 0 ; i< oldRules.length ; i++){
            var _item = clone(oldRules[i]);
            rules.push(_item);
        }
        prerules = clone(rules);
    }
    init();
    //更新规则
    $('label.update-rules').click(function () {
        $('#ppt_rules-data-form .save').hide();
        $('#form-reset-button').trigger('click');
    });
    
    $(document).click(function() {showSave();}).keyup(function() {showSave();});
    $('#menurules-step').change(function() {
        showSave();
    });
    $('#menurules-aims').change(function() {
        showSave();
    });
    $('#menurules-earn').change(function() {
        showSave();
    });
    
    $('#ppt_rules-data-form .save').click(function() {
       $('#ppt_rules-data-form').modal('hide');
       updateAjax();
    });
    
    function showSave() {
        var _showSave = false, _step = $('#menurules-step').val(), 
        _aims = $('#menurules-aims').val(), _earn = $('#menurules-earn').val();
        if (_step != '' && parseInt(_aims)>0 && parseInt(_earn)>0 ){
            _showSave = true;
        }
        if (parseInt(_aims)<=0){
            $('#menurules-aims').val('');
        }
        if (parseInt(_earn)<=0){
            $('#menurules-earn').val('');
        }
        if (_showSave){
            _form.step = _step
            _form.aims = _aims;
            _form.earn = _earn;
            $('#ppt_rules-data-form .save').show();
        }else {
            $('#ppt_rules-data-form .save').hide();
        }
    }
    
    function checkValue() {
        var _res = true;
        var preIndex = parseInt(_form.step-1);
        if ( preIndex > 0 ){
            preIndex = preIndex -1;
            if (rules[preIndex].aims >= _form.aims ){
                _res = false;
                zeroModal.alert({content:'达到目标应该比上一次目标大', overlayClose:true});
            }else if (rules[preIndex].earn >= _form.earn ){
                _res = false;
                zeroModal.alert({content:'获得积分应该比上一次积分大', overlayClose:true});
            }
        }
        return _res;
    }
    
    function updateAjax(){
        if ( !checkValue() ){
            return true;
        }
        var _form = $('#rules-data-form');
        var _url = _form.attr('action'), _param = _form.serialize();
        $('.cover-loading').fadeIn(200);
        window.setTimeout(function () {
            $.ajax({
                type: "post",
                url: _url,
                data: _param,   //参数
                beforeSend: function () {
                },
                success: function (data) {
                    $('.cover-loading').fadeOut(200);
                    // console.log(data);
                    if (data.code == '1'){
                        showRules();
                        zeroModal.success({content: data.msg, overlayClose: true});
                    }else {
                        zeroModal.alert({content:data.msg, overlayClose:true});
                    }
                },
                error: function (data) {
                    $('.cover-loading').fadeOut(200);
                    zeroModal.alert({content:'服务器繁忙,更新失败', overlayClose:true});
                    // console.log(data);
                },
            });
        },300);
    }
    
    function showRules(){
        var index = parseInt(_form.step)-1;
        rules[index] = clone(_form);
        prerules = clone(rules);
        var _html = '';
        for(var i = 0; i<rules.length; i++){
            if(rules[i].step == 3){
                _html += '<p><p>第 '+rules[i].step+' 阶段：</p><p style="padding-left:40px;">达到 '+rules[i].aims+' 步，可获得 '+rules[i].earn+' 积分。超过 '+rules[i].aims+' 的步数将不累余到第二天。</p><p style="color: #1fb5ac;">注：一天最多能获取'+rules[i].earn+'积分；当天如果已获取到'+rules[i].earn+'积分时，超过'+rules[i].aims+'的步数不累余到第二天。</p></p>';
            }else {
                _html += '<p><p>第 '+rules[i].step+' 阶段：</p><p style="padding-left:40px;">达到 '+rules[i].aims+' 步，可获得 '+rules[i].earn+' 积分。如当天未达到下阶段，则超过 '+rules[i].aims+' 的步数将累余到第二天。</p></p>';
            }
        }
        $('#rules-show').html(_html);
    }
    
    //克隆方法
    function clone(obj) {
        var o;
        if (typeof obj == "object") {
            if (obj === null) {
                o = null;
            } else {
                if (obj instanceof Array) {
                    o = [];
                    for (var i = 0, len = obj.length; i < len; i++) {
                        o.push(clone(obj[i]));
                    }
                } else {
                    o = {};
                    for (var j in obj) {
                        o[j] = clone(obj[j]);
                    }
                }
            }
        } else {
            o = obj;
        }
        return o;
    } 
JS;

$this->registerJs($jsRules);

?>

<div class="rules-form">

    <h1 style="text-align:center; color: #1fb5ac;padding: 0 100px 0 0;"><?= Html::encode($this->title) ?></h1>

    <?php $form = ActiveForm::begin(['id'=>'rules-form']); ?>

    <?php
    $oldRules = $model->data;
    $oldRulesHtml = '';
    $rules = json_decode($oldRules, true);
    foreach ($rules as  $key => $value){
        switch ($value['step']){
            case 3 : { $oldRulesHtml .= '<p><p>第 '.$value['step'].' 阶段：</p><p style="padding-left:40px;">达到 '.$value['aims'].' 步，可获得 '.$value['earn'].' 积分。超过 '.$value['aims'].' 的步数将不累余到第二天。</p><p style="color: #1fb5ac;">注：一天最多能获取 '.$value['earn'].' 积分；当天如果已获取到 '.$value['earn'].' 积分时，超过 '.$value['aims'].' 的步数不累余到第二天。</p></p>'; } break;
            default : { $oldRulesHtml .= '<p><p>第 '.$value['step'].' 阶段：</p><p style="padding-left:40px;">达到 '.$value['aims'].' 步，可获得 '.$value['earn'].' 积分。如当天未达到下阶段，则超过 '.$value['aims'].' 的步数将累余到第二天。</p></p>'; } break;
        }
    }
    ?>

    <?= $form->field($model, 'data',[
        'template' => '
                    <div class="col-lg-10 col-md-10 col-lg-offset-1 col-md-offset-1">
                    <label class="btn btn-primary update-rules" for="rules-data" data-toggle="modal" href="#ppt_rules-data-form" style="margin-bottom: 15px; ">更新规则</label>
                    <div id="rules-show" style="min-height: 300px;border:1px solid #e1e1e1;padding:30px;font-size: 20px;line-height: 26px;">'.$oldRulesHtml.'</div>
                    {input}
                    {error}
                     </div>',
    ])->textarea(['id' => 'rules-data', 'maxlength' => true, 'readonly' => 'readonly','style' => 'resize: none;display: none;', 'placeholder'=>'-- 请输入规则-- '])->label('&nbsp;') ?>

    <?php ActiveForm::end(); ?>

</div>

<section class="rules-data-form" style="position: relative;overflow: hidden">
    <div class="modal fade in" id="ppt_rules-data-form" tabindex="-1" role="dialog" aria-labelledby="ppt_bodyfullLabel" aria-hidden="true" style="z-index: 1050;">
        <div class="modal-dialog" style="width:62.8%;box-shadow:0 0 5px #1ec7e6;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" style="text-align: center;color: #0a6aa1;">更新规则</h4>
                </div>
                <div class="modal-body" style="width:100%;padding: 15px;">
                    <div class="rules-update" style="min-height:400px;padding-top:100px;overflow: hidden; ">

                        <?php $form = ActiveForm::begin([
                            'id' => 'rules-data-form',
                        ]); ?>

                        <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2">
                            <?= $form->field($model, 'step',  [
                                'labelOptions' => ['class' => 'col-lg-3 col-md-3  control-label label-align-center'],
                                'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {error}
                                                               </div>',
                            ])->dropDownList($model->stepLists, ['id' => 'menurules-step', 'prompt'=>'-- 选择 --']) ?>
                        </div>

                        <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2">
                            <?= $form->field($model, 'aims',  [
                                'labelOptions' => ['class' => 'col-lg-3 col-md-3  control-label label-align-center'],
                                'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {error}
                                                               </div>',
                            ])->textInput(['id' => 'menurules-aims', 'type' => 'number', 'placeholder'=>' -- 目标 --',]) ?>
                        </div>

                        <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2">
                            <?= $form->field($model, 'earn',  [
                                'labelOptions' => ['class' => 'col-lg-3 col-md-3  control-label label-align-center'],
                                'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {error}
                                                               </div>',
                            ])->textInput(['id' => 'menurules-earn', 'type' => 'number', 'placeholder'=>' -- 积分 --',]) ?>
                        </div>

                        <div class="col-lg-10 col-md-10 col-lg-offset-2  col-md-offset-2" style="display: none;">
                            <div class="form-group col-lg-7 col-md-7 col-lg-offset-3  col-md-offset-3">
                                <?= Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-primary', 'id' => 'form-reset-button']) ?>
                            </div>
                        </div>

                        <?php ActiveForm::end(); ?>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-lg-7 col-md-7" style="overflow: hidden;">
                        <?= Html::label(Yii::t('backend', 'Reset'), 'form-reset-button', [ 'id' => 'label-reset-button', 'class' => 'btn btn-primary']) ?>
                        <button type="button" class="btn btn-primary save" style="display: none;">确定</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
