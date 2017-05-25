<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $form yii\widgets\ActiveForm */
/* @var $searchModel backend\models\searches\ChecksSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '查看审核记录';
$this->params['breadcrumbs'][] = $this->title;
$this->registerCssFile('@web/plugins/modal/zeroModal.css', ['depends' => 'backend\assets\AppAsset']);
$this->registerJsFile('@web/plugins/modal/zeroModal.js', ['depends' => 'backend\assets\AppAsset']);

$viewJs = <<<JS
    var _height = document.documentElement.clientHeight;//获取页面可见高度
    var _pageSize = 20;
    var _id = '', _updateValue = '';

function gridView() {
    $('a.data-table-buttons-update').unbind('click').on('click',function () {
        var _this = $(this);
        _id = _this.attr('data-id');
        var _update = _this.attr('data-update'), _input = _this.attr('data-input'),
        _responseActionUrl = _this.attr('data-url')+'&id='+_id+'&update='+_update,
        _title = _this.attr('title'), _message = _this.attr('data-message'), _html= '', _change = false;
        $('#ppt_ajax_view .modal-title').html(_title);
        if (_update){
             _html = '<div style="min-height:200px;margin-top:50px;text-align:center;font-size:25px;color:#1fb5ac;line-height:30px;">'+_message+'</div>';
             $('#ppt_ajax_view .modal-body').html(_html).css('padding','15px');
             $('#ppt_ajax_view .save').show();
        }else {
            _html = '<div style="margin: 100px auto;">'+$('#loading-container').html()+'</div>'
            $('#ppt_ajax_view .modal-body').html(_html).css('padding','30px');
        }
        $('#ppt_ajax_view .save').unbind('click').click(_checkUpdate);
        
        function _checkUpdate() {
          var _param = '&updateValue='+_updateValue;
          $("#ppt_ajax_view").modal('hide');
          $('.cover-loading').fadeIn(200);
          window.setTimeout(function() {
          $.ajax({
            type: "POST",
            url: '/back/index.php?r='+_responseActionUrl + _param,
            data: {},   
            async: true,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function () {
            },success: function (msg) {
                $('.cover-loading').fadeOut(200);
                     if (msg.code == 1) {
                         zeroModal.success({content: msg.msg, overlayClose: true});
                         if (msg.remove){
                             $('tr[data-key="'+_id+'"]').remove();
                         }
                     } else {
                         zeroModal.error({content: msg.msg, overlayClose: true});
                     }
                     // console.log(msg);
            },
            error: function (data) {
                $('.cover-loading').fadeOut(200);
                zeroModal.error({content: '请求出错', overlayClose: true});
                // console.log(data);
            }
          });
        },500);
        }
    });
}

gridView();

    $('label#label-goods-search-form').on('click',function () {
        var _this = $(this), _activeForm = $('#'+_this.attr('for'));
        _pageSize = 20 || _this.attr('data-pageSize');
        var _responseActionUrl = _activeForm.attr('action'),
        _params = _activeForm.serialize()+'&pageSize='+_pageSize;
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
                // console.log(msg);
                     if (msg.code == 1) {
                         if (msg.html){
                             $('#data-table-view-container').html(msg.html);
                             gridView();
                         }
                     } else {
                         zeroModal.error({content: '请求出错', overlayClose: true});
                     }
                     // console.log(msg);
            },
            error: function (data) {
                $('.cover-loading').fadeOut(200);
                zeroModal.error({content: '请求出错', overlayClose: true});
                // console.log(data);
            }
          });
        },200);
    });
JS;
$this->registerJs($viewJs);

?>
<div class="checks-index">

    <section class="data-table-search" style="position: relative;overflow: hidden">
        <div class="modal fade in" id="ppt_data-table-search" tabindex="-1" role="dialog"
             aria-labelledby="ppt_bodyfullLabel" aria-hidden="true" style="z-index: 1050;">
            <div class="modal-dialog" style="width:62.8%;box-shadow:0 0 5px #1ec7e6;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                        <h4 class="modal-title" style="text-align: center;color: #1fb5ac;">查找</h4>
                    </div>
                    <div class="modal-body" style="width:100%;min-height:400px;padding: 15px;">
                        <div class="goods-search" style="padding-top:30px;overflow: hidden; ">

                            <div class="data-search">

                                <?php $form = ActiveForm::begin([
                                    'id' => 'checks-search-form',
                                    'action' => [Yii::$app->controller->action->id],
                                    'method' => 'get',
                                ]); ?>

                                <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2">
                                    <?= $form->field($searchModel, 'tb_name',  [
                                        'labelOptions' => ['class' => 'col-lg-3 col-md-3  control-label label-align-center'],
                                        'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {error}
                                                               </div>',
                                    ])->dropDownList($searchModel->type, ['prompt' => '-- 请选择 --']) ?>
                                </div>

                                <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2">
                                    <?= $form->field($searchModel, 'from_uid',  [
                                        'labelOptions' => ['class' => 'col-lg-3 col-md-3  control-label label-align-center'],
                                        'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {error}
                                                               </div>',
                                    ])->textInput(['placeholder'=>' -- 发布人 --',]) ?>
                                </div>

                                <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2">
                                    <?= $form->field($searchModel, 'process_uid',  [
                                        'labelOptions' => ['class' => 'col-lg-3 col-md-3  control-label label-align-center'],
                                        'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {error}
                                                               </div>',
                                    ])->textInput(['placeholder'=>' -- 审核人 --',]) ?>
                                </div>

                                <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2">
                                    <?= $form->field($searchModel, 'pass',  [
                                        'labelOptions' => ['class' => 'col-lg-3 col-md-3  control-label label-align-center'],
                                        'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {error}
                                                               </div>',
                                    ])->dropDownList(['未通过','已通过'], ['prompt' => '-- 请选择 --'])  ?>
                                </div>

                                <div class="col-lg-6 col-md-8 col-lg-offset-3  col-md-offset-2">
                                    <?= $form->field($searchModel, 'created_at',  [
                                        'labelOptions' => ['class' => 'col-lg-3 col-md-3  control-label label-align-center'],
                                        'template' => '
                                                               {label}
                                                               <div class="col-lg-9 col-md-9">
                                                               {input}
                                                               {error}
                                                               </div>',
                                    ])->dropDownList($searchModel->time, ['prompt' => '-- 请选择 --'])  ?>
                                </div>

                                <div class="col-lg-9 col-md-9 col-lg-offset-2  col-md-offset-2" style="display: block;">
                                    <div class="form-group col-lg-7 col-md-7 col-lg-offset-3  col-md-offset-3">
                                        <?= Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
                                        <?= Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-primary', 'id' => 'form-reset-button']) ?>
                                    </div>
                                </div>

                                <?php ActiveForm::end(); ?>

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="col-lg-7 col-md-7" style="overflow: hidden;">
                            <?= Html::label(Yii::t('backend', 'Search'), 'checks-search-form', ['id' => 'label-checks-search-form', 'class' => 'btn btn-primary']) ?>
                            <?= Html::label(Yii::t('backend', 'Reset'), 'form-reset-button', ['id' => 'label-reset-button', 'class' => 'btn btn-primary']) ?>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="box data-table-section">
        <header class="panel_header">
            <h1 style="text-align:center; color: #4d4d4d;padding: 0 100px 0 0;"><?= Html::encode($this->title) ?></h1>
            <div class="actions panel_actions pull-right">
                <i class="box_toggle fa fa-chevron-down"></i>
                <i class="box_search fa fa-search" data-toggle="modal" href="#ppt_data-table-search"></i>
                <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"
                   style="display: none;"></i>
                <i class="box_close fa fa-times"></i>
            </div>
        </header>
        <div class="content-body" style="padding: 0px; overflow-x: scroll;">
            <div class="col-md-12 col-sm-12 col-xs-12">

                <section id="data-table-view-container">

                    <?= GridView::widget([
                        'options' => ['class' => 'grid-view box box-shadow data-table-body Goods-index-table'],
                        'layout' => '<div class="height_20"></div>{items} <div class="row"><div class="col-xs-12 text-auto-center">{summary}</div><div class="col-xs-8 col-offset-xs-4">{pager}</div></div><div class="height_20"></div>',
                        'pager' => [
                            //'options'=>['class'=>'hidden']//关闭分页
                            'firstPageLabel' => "First",
                            'prevPageLabel' => 'Prev',
                            'nextPageLabel' => 'Next',
                            'lastPageLabel' => 'Last',
                        ],
                        'dataProvider' => $dataProvider,
//                        'filterModel' => $searchModel,
                        'columns' => [
                            [
                                'class' => 'yii\grid\CheckboxColumn',
                            ],
                            [
                                'class' => 'yii\grid\SerialColumn',
                                'header' => '序号',
                            ],
                            [
                                'class' => 'yii\grid\ActionColumn',
                                'header' => '操作',
                                'template' => '{delete}',
                                'buttons' => [
                                    'delete' => function ($index, $model, $key) {
                                        return Html::a('<span class="glyphicon glyphicon-trash"></span>',
                                            '#',
                                            [
                                                'title' => '删除',
                                                'aria-label' => '删除',
                                                'data' => [
                                                    'toggle' => 'modal',
                                                    'target' => '#ppt_ajax_view',
                                                    'update' => 'delete',
                                                    'message' => '你确定删除该记录吗？',
                                                    'url' => 'manager/data/checks-delete',
                                                    'id' => $key,
                                                ],
                                                'class' => 'btn btn-primary btn-data-table data-table-buttons-update',
                                            ]);
                                    },
                                ]
                            ],

                            [
                                'attribute' => 'tb_name',
                                'format' => 'html',
                                'value' => function ($model, $key) {
                                    return $model->tb_name == 'activity' ? '赛事审核' : '';
                                },
                            ],
                            [
                                'attribute' => 'from_uid',
                                'label' => '发布人',
                                'format' => 'html',
                                'value' => function ($model, $key) {
                                    return $model->fromUser->username;
                                },
                            ],
                            [
                                'attribute' => 'process_uid',
                                'label' => '审核人',
                                'format' => 'html',
                                'value' => function ($model, $key) {
                                    return $model->processUser->username;
                                },
                            ],
                            'report:ntext',
                            [
                                'attribute' => 'pass',
                                'format' => 'html',
                                'value' => function ($model, $key) {
                                    return $model->pass ? '已通过' : '未通过';
                                },
                            ],
                            [
                                'attribute' => 'created_at',
                                'value' => function ($model, $key) {
                                    return date('Y-m-d H', strtotime($model->created_at)) . '点';
                                },
                            ],
                        ],
                    ]); ?>

                </section>

            </div>
        </div>
        <div class="data-table-section-footer"></div>
    </section>

</div>