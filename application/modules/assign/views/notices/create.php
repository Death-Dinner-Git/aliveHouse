<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\modules\assign\models\Notices */

$this->title = '申请推送信息';
?>
<div class="notices-create">

    <h1 style=" padding:5px 100px 5px 0;  text-align:center; color: #1fb5ac;"><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
