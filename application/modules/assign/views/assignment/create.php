<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var yii\web\View $roleList
 * @var backend\models\AuthItem $model
 */

$this->title = Yii::t('rbac-admin', 'Create Role');

?>

<section class="wrapper site-min-height">

    <div class="col-md-10 col-sm-10 col-xs-10 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" style="position: relative">

        <h1 style="text-align:center; color: #f33e6f;"><?= Html::encode($this->title) ?></h1>

        <?=
        $this->render('_form', [
            'model' => $model,
            'roleList' => $roleList,
        ]);
        ?>
    </div>

</section>