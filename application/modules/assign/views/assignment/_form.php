<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
//use yii\captcha\Captcha;

/* @var $this yii\web\View */
/* @var $model backend\modules\assign\models\AuthItem */
/* @var $form yii\widgets\ActiveForm */
/* @var $roleList */

$this->registerCssFile('@web/plugins/modal/zeroModal.css', ['depends' => 'backend\assets\AppAsset']);
$this->registerJsFile('@web/plugins/modal/zeroModal.js', ['depends' => 'backend\assets\AppAsset']);
$this->registerJsFile('@web/js/jsAddress.js', ['depends' => 'backend\assets\AppAsset']);

$js = <<<JS
var _element = {
        nodeName: 'li',
        className: 'btn btn-primary',
        title: '',
        content: '',
        type: '',
        style: '',
    };

    var region = '';
    var level = '';
    var unique = '';
    var cmbDefault = '';
    var _setRoleSelector = document.getElementById('setRoleSelector');
    var _setCmbSelector = document.getElementById('setCmbSelector');
    var _cmbDefault = document.getElementById('cmbDefault');
    var _setCmbSelectorField = document.getElementById('field-setCmbSelector');
    _setRoleSelector.onchange = function () {
        if (_setRoleSelector.value != '') {
            _setCmbSelectorField.innerHTML = '.field-setCmbSelector{display: block;}';
        } else {
            _setCmbSelectorField.innerHTML = '.field-setCmbSelector{display: none;}';
        }
        _setCmbSelector.value = '';
        if(_setRoleSelector.value == '9'){
            _setCmbSelector.value = '全国';
        }
    }

    cmbDefault = _cmbDefault.value;
    _setCmbSelector.addEventListener('click', _showCmbSelector);
    _setCmbSelector.addEventListener('change', function(){
        if(_setRoleSelector.value == '9' && _setCmbSelector.value != '全国'){
            _showWarning('全网普通管理员，管理地区只能是全国!');
            _setCmbSelector.value = '全国';
        }
    });

    function _showCmbSelector() {
        if(_setRoleSelector.value != '9'){
            addressInit('region-select-container', cmbDefault, _element, function () {
                var _region = document.getElementById('region-select-container');
                var _content = _region.innerHTML;
                _region.innerHTML = '';
                unique = zeroModal.show({
                    title: '请选择该管理员管理范围!',
                    content: _content,
                    width: '50%',
                    height: '60%',
                    overlay: true,
                    transition: true,
                    ok: true,
                    cancel: true,
                    okFn: _setRegion,
                });
            }, _getRegion);
        }
    }

    function _getRegion(_region, _level) {
        region = _region;
        level = _level;
        if (_setRoleSelector.value == '') {
            zeroModal.closeAll();
            _setCmbSelector.value = '';
            _showWarning('请先选择管理类型，再选择管理范围!');
        }
        zeroModal.showChange(unique, region);
    }

    function _setRegion() {
        _setCmbSelector.value = region;
        zeroModal.closeAll();
        _setCmbSelector.focus();
        _setCmbSelector.blur();
        _checkRegion();
    }

    function _showWarning(_content) {
        zeroModal.alert(_content);
    }

    function _checkRegion() {
        if (_setRoleSelector.value == 18 || _setRoleSelector.value == 19) {
            if (level != 1) {
                _showWarning('管理员类型与管理区域范围不符!');
                _setCmbSelector.value = '';
            }
        } else if (_setRoleSelector.value == 28 || _setRoleSelector.value == 29) {
            if (level != 2) {
                _showWarning('管理员类型与管理区域范围不符!');
                _setCmbSelector.value = '';
            }
            if (_setRoleSelector.value == '') {
                _showWarning('请选择管理类型，再选择管理范围!');
                _setCmbSelector.value = '';
                zeroModal.closeAll();
            }
        }
    }
    $('form#form-signup #reset').click(function() {
      _setCmbSelectorField.innerHTML = '.field-setCmbSelector{display: none;}';
    });
JS;

$this->registerJs($js);

?>

<!-- page start-->

<div class="assignment-create">

    <div class="admin-form">

        <div class="row">

                <?php $form = ActiveForm::begin([
                    'options' => [
                        'id' => 'form-signup',
                        'class' => 'form-horizontal',
                    ]
                ]);
                $disabled = !$model->isNewRecord ? 'disabled' : '';
                ?>

            <div style="display: <?= !$model->isNewRecord ? 'none;' : '' ?>">

                <?= $model->isNewRecord ? $form->field($model, 'parentRegion')->hiddenInput(['id' => 'cmbDefault',  'disabled'=>'disabled',])->label(false) : '' ?>

                <?=  $model->isNewRecord && $roleList ?
                    $form->field($model, 'role',[
                        'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                        'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                    ])->dropDownList($roleList,['class' => 'form-control','prompt'=>'---请选择管理员类型---', 'id'=> 'setRoleSelector',]) : '' ?>

                <?= $model->isNewRecord&& $roleList ?
                    $form->field($model, 'region',[
                        'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                        'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                    ])->textInput(['placeholder'=>'---请选择管理区域范围---',
                        'id'=> 'setCmbSelector',
                        'maxlength' => 64,
                        'class' => 'form-control',
                    ]) : '' ?>
                <style id="field-setCmbSelector">
                    .field-setCmbSelector{
                        display: none;
                    }
                </style>

                <section id="region-select-container"></section>

                <?= $form->field($model, 'username', [
                    'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                    'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                    'enableAjaxValidation' => true,
                    'enableClientValidation' => true,
                ])->textInput([
                    'placeholder'=>'只能由汉字/数字/下划线组成，不能数字开头、不含空格、4-20位!',
                    'maxlength' => 20,
                    'class' => 'form-control',
                    $disabled=>$disabled,
                ]) ?>

                <?= $form->field($model, 'email', [
                    'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                    'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                    'enableAjaxValidation' => true,
                    'enableClientValidation' => true,
                ])->textInput([
                    'maxlength' => 255,
                    'placeholder'=>'请输入合法邮箱!',
                    'type' => 'email',
                    'class' => 'form-control',
                    $disabled=>$disabled,
                ]) ?>

                <?= $form->field($model, 'phone', [
                    'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                    'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                    'enableAjaxValidation' => true,
                    'enableClientValidation' => true,
                ])->textInput([
                    'maxlength' => 11,
                    'placeholder'=>'请输入合法手机号码!',
                    'class' => 'form-control',
                    $disabled=>$disabled,
                ]) ?>

                <?= $form->field($model, 'company', [
                    'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                    'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                ])->textInput([
                    'maxlength' => 150,
                    'placeholder'=>'请输入公司名称!',
                    'class' => 'form-control',
                    $disabled=>$disabled,
                ]) ?>

            </div>

                <?= !$model->isNewRecord ? $form->field($model, 'password_old', [
                    'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                    'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                ])->passwordInput([
                    'placeholder'=>'请输入旧密码!',
                    'class' => 'form-control',
                ])->label('旧密码')
                : '';
                ?>

                <?= $form->field($model, 'password', [
                    'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                    'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                ])->passwordInput([
                    'placeholder'=>'密码至少是6位,最长只能是32位!',
                    'class' => 'form-control',
                ])->label(!$model->isNewRecord ? '新密码' : '密码') ?>

                <?= $form->field($model, 'password_rep', [
                    'labelOptions' => ['class' => 'col-lg-2 col-md-2  control-label label-align-center'],
                    'template' => '
                            {label}
                            <div class="col-lg-9 col-md-9">
                            {input}
                            {error}
                            </div>
                            ',
                ])->passwordInput([
                    'placeholder'=>'请再次输入密码，以确认!',
                    'class' => 'form-control',
                ]) ?>

<!--                --><?php //echo !isset($model->id) ? $form->field($model, 'verifyCode',[
//                    'labelOptions' => ['class'=>'col-lg-2 col-md-2 control-label'],
//                    'template' => '
//                            {label}
//                            <div class="col-lg-8 col-md-8">
//                            {input}
//                            {error}
//                            </div>
//                            ',
//                ])->label('验证码')->widget(Captcha::className(), [
//                    'options'=>['placeholder'=>'验证码','class' => 'form-control',],
//                    'captchaAction' => 'assignment/captcha',
//                    'imageOptions'=>[
//                        'id'=>'captchaimg',
//                        'title'=>'换一个',
//                        'alt'=>'换一个',
//                        'style'=>'cursor:pointer;margin-top:10px;border:1px solid #d4d4d4;',
//                    ],
//                    'template' => '{input}<div>{image}</div>',
//                ]) : ''; ?>


                <div class="col-lg-9 col-md-9 col-lg-offset-2  col-md-offset-2">
                    <div class="form-group col-lg-7 col-md-7 col-lg-offset-3  col-md-offset-3">
                        <?= Html::submitButton($model->isNewRecord ? Yii::t('rbac-admin', 'Create') : Yii::t('rbac-admin', 'Update'), ['class' => 'btn btn-primary']) ?>
                        <?= $model -> isNewRecord ? Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-primary', 'name' => 'submit-button', 'id' => 'reset']) : '' ?>
                    </div>
                </div>

                <?php ActiveForm::end(); ?>

            </div>
        </div>

    </div>

</div>
