<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<div class="ajax-admin-index">

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

</div>
