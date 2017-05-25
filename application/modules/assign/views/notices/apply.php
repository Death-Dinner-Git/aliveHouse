<?php

use yii\helpers\Html;
use yii\widgets\ListView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel backend\modules\assign\models\searches\NoticesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '推送消息';
$this->registerCssFile('@web/plugins/modal/zeroModal.css', ['depends' => 'backend\assets\AppAsset']);
$this->registerJsFile('@web/plugins/modal/zeroModal.js', ['depends' => 'backend\assets\AppAsset']);

$js = <<<JS

//提交审核
$('.label-button-check').click(function() {
  var _this = $(this), _id = _this.attr('data-id'), _message = _this.attr('data-message');
  var _html = '<div style="min-height:200px;margin-top:50px;text-align:center;font-size:25px;color:#1fb5ac;line-height:30px;">'+_message+'</div>';
  $('#ppt_ajax_view .modal-body').html(_html).css('padding','15px');
  $('#ppt_ajax_view .save').show().unbind('click').click(submitCheck);
  $('#ppt_ajax_view').modal('show');
  function submitCheck() {
      var _url = '', _param = '';
      $('#ppt_ajax_view').modal('hide');
      itemAjax(_url, _param);
  }
});

//删除
$('.label-button-delete').click(function() {
  var _this = $(this), _id = _this.attr('data-id'), _message = _this.attr('data-message');
  var _html = '<div style="min-height:200px;margin-top:50px;text-align:center;font-size:25px;color:#1fb5ac;line-height:30px;">'+_message+'</div>';
  $('#ppt_ajax_view .modal-body').html(_html).css('padding','15px');
  $('#ppt_ajax_view .save').show().unbind('click').click(submitDelete);
  $('#ppt_ajax_view').modal('show');
  function submitDelete() {
      var _url = '', _param = '';
      $('#ppt_ajax_view').modal('hide');
      itemAjax(_url, _param);
  }
});

//AJAX
function itemAjax(_url, _param) {
          $('.cover-loading').fadeIn(200);
          window.setTimeout(function() {
          $.ajax({
            type: "GET",
            url: '/back/index.php?r='+_url + _param,
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
        },200);
}
JS;

$this->registerJs($js);

?>
<div class="notices-apply">

    <section style="position: relative;">

        <nav style="position: absolute;right: 0%;">
            <?= Html::a('申请推送消息', ['notices/create'], ['class'=> 'btn btn-primary'] ) ?>
        </nav>

        <div class="row">

            <h1 style="text-align:center; color: #1fb5ac;"><?= Html::encode($this->title) ?></h1>

            <div class="clearfix"></div>

            <div class="tab-pane fade ps-container ps-active-y active in faq-panels" id="data-table-view-container" style="padding-left: 30px;padding-right: 30px;overflow: hidden;">

                <?php Pjax::begin(); ?>
                <?= ListView::widget([
                    'dataProvider' => $dataProvider,
                    'layout' => '{items} <div class="row" style="width: 92%;"><div class="col-xs-12 text-auto-center" style="padding-top:15px;">{summary}</div><div class="col-xs-8 col-offset-xs-4">{pager}</div></div><div class="height_20"></div>',
                    'pager' => [
                        //'options'=>['class'=>'hidden']//关闭分页
                        'firstPageLabel' => "First",
                        'prevPageLabel' => 'Prev',
                        'nextPageLabel' => 'Next',
                        'lastPageLabel' => 'Last',
                    ],
                    'itemOptions' => ['class' => 'item'],
                    'itemView' => '_itemApply',
                ]) ?>
                <?php Pjax::end(); ?>

            </div>

            <style>
                .empty{
                    width: 100%;
                    padding: 50px 0;
                    font-size: 20px;
                    text-align:center;
                    color: #1fb5ac;
                }
            </style>
        </div>

    </section>

</div>

