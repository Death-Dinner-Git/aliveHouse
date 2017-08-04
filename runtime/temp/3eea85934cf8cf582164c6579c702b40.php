<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:86:"F:\aliveDinner\upupw\www\aliveHouse\public/../application/manage\view\config\view.html";i:1497965800;}*/ ?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">

    <!-- Favicon -->
    <link rel="shortcut icon" href="_SHORTCUT_" type="image/x-icon">

    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="_LAYUI_/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="__CSS__/layout.css" media="all">
    <link rel="stylesheet" type="text/css" href="__CSS__/iconfont.css" media="all">

    <!-- For site js -->
    <script type="text/javascript" src="__JS__/jquery.js"></script>
    <script type="text/javascript" src="__JS__/bootstrap.js"></script>
    <script type="text/javascript" src="_LAYUI_/layui.js"></script>

    <title><?php echo !empty($meta_title)?$meta_title.' - ' : ''; ?>_TITLE_</title>

    <style>
        #registerUser .layui-form-item{
            font-size: 16px;
        }
        #registerUser .layui-form-item .layui-form-label{
            width: 130px;
        }
        #registerUser .layui-form-item .layui-input-inline{
            width: 220px;
        }
        #registerUser .layui-form-item .layui-input-inline .layui-input{
            font-size: 16px;
        }
        .help-hint{
            display: block;
            width: 100%;
            padding-left: 30px;
            height: 38px;
            line-height: 38px;
            border-radius: 2px;
            text-align: left;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .help-msg .fa{
            position: absolute;
            border-radius: 50%;
            margin: 10px;
            width: 16px;
            height: 16px;
            text-align: center;
            vertical-align: middle;
        }
        .help-msg .fa.fa-close,.help-msg .fa.fa-check{
            border: 1px solid #d4d4d4;
        }
        .help-msg .fa-close:before{
            color: #E85445;
        }
        .help-msg .fa-check:before{
            color: #0DBD9F;
        }
    </style>

</head>

<body>
<div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend style="margin-left: 200px;"><?php echo !empty($meta_title)?$meta_title : '表单'; ?></legend>
        <div style="margin:15px 15px 15px 215px;">
            <?php if(is_array($model->getData()) || $model->getData() instanceof \think\Collection || $model->getData() instanceof \think\Paginator): $key = 0; $__LIST__ = $model->getData();if( count($__LIST__)==0 ) : echo "<p> 没有数据 </p>" ;else: foreach($__LIST__ as $key=>$value): $mod = ($key % 2 );++$key;?>
            <p><?php echo $value; ?></p>
            <?php endforeach; endif; else: echo "<p> 没有数据 </p>" ;endif; ?>
        </div>
    </fieldset>
</div>
<script>
    layui.use([ 'jquery','layer', 'form'], function() {});
</script>

</body>

</html>