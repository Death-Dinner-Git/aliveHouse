<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\modules\assign\models\Menu */

$this->title = Yii::t('rbac-admin', 'Create Menu');
$this->params['breadcrumbs'][] = ['label' => Yii::t('rbac-admin', 'Menus'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<section class="menu-create">
    <?=
    $this->render('_form', [
        'model' => $model,
    ]);
    ?>
</section>