<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\searches\AdminSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* @var $form yii\widgets\ActiveForm */

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
        showCountry: false,
        showProvince: false,
        showCity: false,
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
    var _pageSize = 20, _where = '', _role = '', _region = '';
    $('label#label-admin-search-form').on('click',function () {
        var _this = $(this), _activeForm = $('#'+_this.attr('for'));
        _pageSize = 20 || _this.attr('data-pageSize'), _role = $('#setRoleSelector').val(), _region = $('#cmbDefault').val();
        var _responseActionUrl = _activeForm.attr('action'),
        _params = 'pageSize='+_pageSize+'&where='+_where+'&role='+_role+'&region='+_region+'&'+_activeForm.serialize();
        window.setTimeout(function() {
          $("#ppt_data-table-search").modal('hide');
          $.ajax({
            type: "GET",
            url: _responseActionUrl,
            data: _params,   
            async: true,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function () {
                $('.cover-loading').fadeIn(200);
            },success: function (msg) {
                $('.cover-loading').fadeOut(200);
                     if (msg.code == 1) {
                          if (msg.html){
                             $('#data-table-view-container').html(msg.html);
                             init();
                         }
                     }else {
                         zeroModal.error({content: msg.msg, overlayClose: true});
                     }
            },
            error: function (data) {
                $('.cover-loading').fadeOut(200);
                zeroModal.error({content: '请求出错', overlayClose: true});
            }
          });
        },200);
    });

init();

function init() {
     $('a.data-table-buttons-update').unbind('click').on('click',function () {
        var _this = $(this), _id = _this.attr('data-id'), 
        _responseActionUrl = window.location.pathname + '?r=' +_this.attr('data-url')+'&id='+_id,
        _title = _this.attr('title'), _message = _this.attr('data-message'), 
        _html= '<div style="display:flex;"><p style="margin:auto;color: #f33e6f;font-size: 25px;line-height:30px;min-height:200px;margin-top: 50px;">'+_message+'</p></div>';
        $('#ppt_ajax_view_admin .modal-title').html(_title);
        $('#ppt_ajax_view_admin .modal-body').html(_html);
        $('#ppt_ajax_view_admin .save').unbind('click').on('click',ajaxDelete).show();
         function ajaxDelete() {
             $("#ppt_ajax_view_admin").modal('hide');
           $.ajax({
            type: "POST",
            url: _responseActionUrl,
            data: {},   
            async: true,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function () {
                $('.cover-loading').fadeIn(200);
            },success: function (msg) {
                $('.cover-loading').fadeOut(200);
                     if (msg.code == 1 && msg.remove) {
                         $('[data-key='+_id+']').remove();
                         zeroModal.success({content: msg.msg, overlayClose: true});
                     } else {
                         zeroModal.error({content: msg.msg, overlayClose: true});
                     }
            },
            error: function (data) {
                $('.cover-loading').fadeOut(200);
                zeroModal.error({content: '删除出错', overlayClose: true});
                // console.log(data);
            }
         });
         }
   });
}
JS;

$this->registerJs($js);

$this->title = '管理区域成员';

?>
<div class="admin-index">

    <h1 style="text-align:center; color: #f33e6f;padding-bottom: 15px;"><?= Html::encode($this->title) ?></h1>

    <section class="data-table-search" style="position: relative;overflow: hidden">
        <label class="btn btn-primary pull-right" data-toggle="modal" href="#ppt_data-table-search">搜索</label>
        <div class="modal fade in" id="ppt_data-table-search" tabindex="-1" role="dialog"
             aria-labelledby="ppt_bodyfullLabel" aria-hidden="true" style="z-index: 1050;">
            <div class="modal-dialog" style="width:62.8%;box-shadow:0 0 5px #1ec7e6;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                        <h4 class="modal-title" style="text-align: center;color: #f33e6f;">搜索条件</h4>
                    </div>
                    <div class="modal-body" style="width:100%;padding: 15px;">
                        <div class="admin-search" style="padding-top:30px;overflow: hidden; ">

                            <?php $form = ActiveForm::begin([
                                'id' => 'admin-search-form',
                                'action' => ['index'],
                                'method' => 'get',
                            ]); ?>

                            <div class="col-lg-6" style="display: inline-block;">
                                <?= $form->field($searchModel, 'username', [
                                    'labelOptions' => ['class' => 'col-lg-5 col-md-5  control-label label-align-center'],
                                    'template' => '
                                {label}
                                <div class="col-lg-7 col-md-7">
                                {input}
                                {error}
                                </div>
                                ',
                                ])->textInput([
                                    'placeholder' => '-- 昵称 -- ',
                                    'maxlength' => 20,
                                    'class' => 'form-control',
                                ]) ?>
                            </div>

                            <div class="col-lg-6" style="display: inline-block;">
                                <?= $form->field($searchModel, 'email', [
                                    'labelOptions' => ['class' => 'col-lg-5 col-md-5  control-label label-align-center'],
                                    'template' => '
                                {label}
                                <div class="col-lg-7 col-md-7">
                                {input}
                                {error}
                                </div>
                                ',
                                ])->textInput([
                                    'placeholder' => '-- 邮箱 -- ',
                                    'maxlength' => 128,
                                    'class' => 'form-control',
                                ]) ?>
                            </div>

                            <div class="col-lg-6" style="display: inline-block;">
                                <?= $form->field($searchModel, 'company', [
                                    'labelOptions' => ['class' => 'col-lg-5 col-md-5  control-label label-align-center'],
                                    'template' => '
                                {label}
                                <div class="col-lg-7 col-md-7">
                                {input}
                                {error}
                                </div>
                                ',
                                ])->textInput([
                                    'placeholder' => '-- 公司 -- ',
                                    'maxlength' => 128,
                                    'class' => 'form-control',
                                ]) ?>
                            </div>

                            <?php // echo $form->field($searchModel, 'role') ?>


                            <?= $form->field($searchModel, 'parent', ['options' => ['style' => 'display:none;']])->hiddenInput(['id' => 'cmbDefault', 'disabled' => 'disabled', 'value' => Yii::$app->user->identity->full_region_name])->label(false); ?>
                            <?= Html::input('hidden', null, Yii::$app->user->identity->role, ['id' => 'setRoleSelector', 'disabled' => 'disabled',]); ?>

                            <div class="col-lg-6" style="display: inline-block;">
                                <?= $form->field($searchModel, 'region', [
                                    'labelOptions' => ['class' => 'col-lg-5 col-md-5  control-label label-align-center'],
                                    'template' => '
                                {label}
                                <div class="col-lg-7 col-md-7">
                                {input}
                                {error}
                                </div>
                                ',
                                ])->textInput([
                                    'placeholder' => '-- 地域 -- ',
                                    'id' => 'setCmbSelector',
                                    'maxlength' => 128,
                                    'class' => 'form-control',
                                ]) ?>
                            </div>
                            <section id="region-select-container"></section>

                            <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2"
                                 style="<?= Yii::$app->user->identity->role == '8' ? 'display: inline-block;' : 'display:none;' ?>">
                                <?= $form->field($searchModel, 'selected', [
                                    'template' => '
                                <div>
                                {input}
                                {error}
                                </div>
                                ',
                                ])->dropDownList($searchModel->selectLists, ['prompt' => '-- 查看 --'])->label(false) ?>
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
                            <?= Html::label(Yii::t('backend', 'Search'), 'admin-search-form', ['id' => 'label-admin-search-form', 'class' => 'btn btn-primary']) ?>
                            <?= Html::label(Yii::t('backend', 'Reset'), 'form-reset-button', ['id' => 'label-reset-button', 'class' => 'btn btn-primary']) ?>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="data-table-view-container" style="padding: 0px; overflow-x: auto;">
        <?= GridView::widget([
            'layout' => '{items} <div class="row" style="width: 90%;"><div class="col-xs-12 text-auto-center" style="padding-top:15px;">{summary}</div><div class="col-xs-8 col-offset-xs-4">{pager}</div></div><div class="height_20"></div>',
            'pager' => [
                //'options'=>['class'=>'hidden']//关闭分页
                'firstPageLabel' => "First",
                'prevPageLabel' => 'Prev',
                'nextPageLabel' => 'Next',
                'lastPageLabel' => 'Last',
            ],
            'dataProvider' => $dataProvider,
            'columns' => [
                ['class' => 'yii\grid\CheckboxColumn', 'headerOptions' => ['width' => '30', 'style' => 'text-align:center;'],],
                ['class' => 'yii\grid\SerialColumn', 'header' => '序号', 'headerOptions' => ['width' => '60', 'style' => 'text-align:center;']],
                [
                    'attribute' => 'parent',
                    'label' => '创建人',
                    'format' => 'html',
                    'value' => function ($model, $key) {
                        return $model->parents->username;
                    },
                    'headerOptions' => ['width' => '150'],
                ],
                [
                    'attribute' => 'username',
                    'format' => 'html',
                    'value' => function ($model, $key) {
                        return '<i>' . (!empty($model->head_url) ? '<img src="' . $model->head_url . '" class="img-circle" style="width:20px; height:20px; margin-right:5px;">' : '') . '</i>' . $model->username;
                    },
                    'headerOptions' => ['width' => '150'],
                ],
                [
                    'attribute' => 'email',
                    'format' => 'email',
                    'headerOptions' => ['width' => '150'],
                ],
                [
                    'attribute' => 'phone',
                    'format' => 'html',
                    'headerOptions' => ['width' => '150'],
                ],
                [
                    'attribute' => 'company',
                    'format' => 'html',
                    'headerOptions' => ['width' => '150'],
                ],
                [
                    'attribute' => 'full_region_name',
                    'label' => '管理地域',
                    'format' => 'html',
                    'headerOptions' => ['width' => '150'],
                ],
                [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => '操作',
                    'template' => '{delete}',
                    'headerOptions' => ['width' => '60'],
                    'buttons' => [
                        'delete' => function ($index, $model, $key) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>',
                                '#',
                                [
                                    'title' => '删除管理员',
                                    'data' => [
                                        'toggle' => 'modal',
                                        'target' => '#ppt_ajax_view_admin',
                                        'message' => '你确定删除《' . $model->username . '》管理员吗？',
                                        'url' => 'manager/admin/delete',
                                        'id' => $key,
                                    ],
                                    'class' => 'btn btn-primary btn-data-table data-table-buttons-update',
                                ]);
                        },
                    ]
                ],
            ],
        ]);
        ?>
    </section>

</div>


<!-- Modal -->
<div class="modal fade in" id="ppt_ajax_view_admin" tabindex="-1" role="dialog"
     aria-labelledby="ppt_ajax_view_adminLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:62.8%;box-shadow:0 0 5px #1ec7e6;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="text-align: center">特别提醒</h4>
            </div>
            <div class="modal-body" style="width:100%;padding: 15px 15px 0 15px;min-height: 300px;">
                <div style="display:flex;"><p
                        style="margin:auto;color: #f33e6f;font-size: 25px;line-height:30px;min-height:200px;margin-top: 50px;">
                        提醒信息</p></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary save" style="display: none;">确定</button>
            </div>
        </div>
    </div>
</div>
