<?php
/**
 * @var yii\web\View $this
 */

$markdown = <<< TEXT
CONTACT US !
------------

See [You Tee Fit](/back/index.php?r=contact) for more detail.
TEXT;

echo yii\helpers\Markdown::process($markdown);
