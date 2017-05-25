<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\modules\assign\models\Notices */

$state = ['未知', '待审核', '已通过', '已推送', '保存', '已无效'];
$model -> pass = $state[$model->pass];
?>

<div class="notices-view col-lg-3 col-md-3 col-sm-6 col-xs-6">

    <div class="row">

        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" style="position: relative">
            <!--            <i style="position: absolute;width: 60px;height: 60px;padding: 18px 20px"><input type="checkbox" name="selection[]" value="--><?//= $model->id ?><!--" style="width: 20px;height: 20px;"></i>-->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed label-button-view" data-toggle="modal" data-parent="#accordion"
                           href="#collapse_<?= $model->id ?>" aria-expanded="false">
                            <span style="color: #1fb5ac;">标题：</span><?= Html::encode($model->title) ?>
                        </a>
                    </h4>
                </div>
                <!-- Modal -->
                <div class="modal fade in" id="collapse_<?= $model->id ?>" tabindex="-1" role="dialog" aria-labelledby="ppt_ajax_viewLabel"
                     aria-hidden="true">
                    <div class="modal-dialog animated fadeInDown" style="width:62.8%;box-shadow:0 0 5px #1ec7e6;">
                        <div class="modal-content">
                            <div class="modal-body" style="width:100%;padding: 30px;">
                                <?= DetailView::widget([
                                    'model' => $model,
                                    'attributes' => [
                                        'title',
                                        'content:ntext',
                                        'pass',
                                        'created_at',
                                        'started_at',
                                        'ended_at',
                                    ],
                                ]) ?>
                                <div style="display: flex;">
                                    <div style="margin: auto;">
                                        <label class="btn btn-primary label-button-check" data-id="<?= $model->id ?>" data-message="你确定同意《<?= $model->title ?>》通过了吗？">同意</label>
                                        <label class="btn btn-primary label-button-delete" data-id="<?= $model->id ?>" data-message="你确定删除《<?= $model->title ?>》吗？">删除</label>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
