<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\searches\AdminSearch */
/* @var $form yii\widgets\ActiveForm */

$this->registerCssFile('@web/plugins/modal/zeroModal.css', ['depends' => 'backend\assets\AppAsset']);

$this->registerJsFile('@web/plugins/modal/zeroModal.js', ['depends' => 'backend\assets\AppAsset']);
$this->registerJsFile('@web/js/jsAddress.js', ['depends' => 'backend\assets\AppAsset']);

$jsAddress = <<<JS
var _element = {
        nodeName: 'li',
        className: 'btn btn-primary',
        title: '',
        content: '',
        type: '',
        style: '',
        showCountry: true,
        showProvince: true,
        showCity: true,
    };

    var region = '';
    var level = '';
    var unique = '';
    var cmbDefault = '';
    var _setRoleSelector = document.getElementById('setRoleSelector');
    var _setCmbSelector = document.getElementById('setCmbSelector');
    var _cmbDefault = document.getElementById('cmbDefault');

    cmbDefault = _cmbDefault.value;
    _setCmbSelector.addEventListener('click', _showCmbSelector);

    function _showCmbSelector() {
        addressInit('region-select-container', cmbDefault, _element, function () {
                var _region = document.getElementById('region-select-container');
                var _content = _region.innerHTML;
                _region.innerHTML = '';
                unique = zeroModal.show({
                    title: '请选择地域范围!',
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

    function _getRegion(_region, _level) {
        region = _region;
        level = _level;
        if (_setRoleSelector.value == '') {
            zeroModal.closeAll();
            _setCmbSelector.value = '';
            _showWarning('请选择地域!');
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
            if (level != 2) {
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
JS;

$this->registerJs($jsAddress);

?>

<div class="admin-search" style="padding-top:30px;overflow: hidden; ">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

     <div class="col-lg-6"  style="display: inline-block;">
         <?= $form->field($model, 'username', [
             'labelOptions' => ['class'=>'col-lg-5 col-md-5  control-label label-align-center'],
             'template' => '
                                {label}
                                <div class="col-lg-7 col-md-7">
                                {input}
                                {error}
                                </div>
                                ',
         ])->textInput([
             'placeholder'=>'-- 昵称 -- ',
             'maxlength' => 20,
             'class' => 'form-control',
         ]) ?>
     </div>

<!--    --><?//= $form->field($model, 'auth_key') ?>

<!--    --><?//= $form->field($model, 'password_hash') ?>

<!--    --><?//= $form->field($model, 'password_reset_token') ?>

    <div class="col-lg-6" style="display: inline-block;">
        <?= $form->field($model, 'email',  [
            'labelOptions' => ['class'=>'col-lg-5 col-md-5  control-label label-align-center'],
            'template' => '
                                {label}
                                <div class="col-lg-7 col-md-7">
                                {input}
                                {error}
                                </div>
                                ',
        ])->textInput([
            'placeholder'=>'-- 邮箱 -- ',
            'maxlength' => 128,
            'class' => 'form-control',
        ]) ?>
    </div>

    <div class="col-lg-6" style="display: inline-block;">
        <?= $form->field($model, 'company',  [
            'labelOptions' => ['class'=>'col-lg-5 col-md-5  control-label label-align-center'],
            'template' => '
                                {label}
                                <div class="col-lg-7 col-md-7">
                                {input}
                                {error}
                                </div>
                                ',
        ])->textInput([
            'placeholder'=>'-- 公司 -- ',
            'maxlength' => 128,
            'class' => 'form-control',
        ]) ?>
    </div>

    <?php // echo $form->field($model, 'role') ?>


    <?= Html::input('hidden', null, Yii::$app -> user ->identity ->role ,['id'=> 'setRoleSelector', 'disabled'=>'disabled',]); ?>
    <?= $form->field($model, 'parent',['options' => ['style' => 'display:none;']])->hiddenInput(['id' => 'cmbDefault',  'disabled'=>'disabled', 'value' => Yii::$app->user->identity->full_region_name])->label(false); ?>

    <div class="col-lg-6" style="display: inline-block;">
        <?= $form->field($model, 'region',  [
            'labelOptions' => ['class'=>'col-lg-5 col-md-5  control-label label-align-center'],
            'template' => '
                                {label}
                                <div class="col-lg-7 col-md-7">
                                {input}
                                {error}
                                </div>
                                ',
        ])->textInput([
            'placeholder'=>'-- 地域 -- ',
            'id'=> 'setCmbSelector',
            'maxlength' => 128,
            'class' => 'form-control',
        ]) ?>
    </div>
    <section id="region-select-container"></section>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <div class="col-lg-10 col-md-10 col-lg-offset-2  col-md-offset-2">
        <div class="form-group col-lg-7 col-md-7 col-lg-offset-3  col-md-offset-3">
            <?= Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
            <?= Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-primary']) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
