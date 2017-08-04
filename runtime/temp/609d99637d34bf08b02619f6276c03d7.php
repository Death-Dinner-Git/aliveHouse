<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:86:"F:\aliveDinner\upupw\www\aliveHouse\public/../application/manage\view\user\create.html";i:1501881043;s:94:"F:\aliveDinner\upupw\www\aliveHouse\public/../application/common\view\layouts\manage-main.html";i:1501605631;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="url" content="">
    <meta name="layout" content="no-layout">
    <meta name="util" content="<?php echo !empty($meta_util)?$meta_util : 'true'; ?>">

    <!-- Favicon -->
    <link rel="shortcut icon" href="_SHORTCUT_" type="image/x-icon">

    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="_LAYUI_/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="__CSS__/layout.css" media="all">
    <link rel="stylesheet" type="text/css" href="__CSS__/back.css" media="all">
    <link rel="stylesheet" type="text/css" href="__CSS__/iconfont.css" media="all">

    <!-- For site js -->
    <script type="text/javascript" src="__JS__/jquery.js"></script>
    <script type="text/javascript" src="_LAYUI_/layui.js"></script>

    <title><?php echo !empty($meta_title)?$meta_title.' - ' : ''; ?>_TITLE_</title>

</head>
<body>

<div class="wrap">

    <div class="container"  id="container">

        <div class="layui-layout layui-layout-back-main" id="layui_layout" style="padding:0 15px 15px 15px;">

            <!-- 右侧主体内容开启 -->
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
        #CreateForm .layui-form-item{
            font-size: 14px;
        }
        #CreateForm .layui-form-item .layui-form-label{
            width: 130px;
        }
        #CreateForm .layui-form-item .layui-input-block{
            margin-left: 160px;
        }
        #CreateForm .layui-form-item .layui-input-inline{
            width: 220px;
        }
        #CreateForm .layui-form-item .layui-input-inline .layui-input{
            font-size: 14px;
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
            width: 14px;
            height: 14px;
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

<body style="max-width: 800px;max-height: 600px;margin: auto;">

<section style="margin: 20px;">
    <?php if(isset($meta_title)): ?>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend style="text-align: center;"><?php echo $meta_title; ?></legend>
    </fieldset>
    <?php endif; ?>
    <form class="layui-form forms" id="defaultForm" action="/manage/user/register" method="post" style="padding: 15px 0">

        <?php echo token(); ?>

        <div class="layui-form-item">
            <label class="layui-form-label">分配部门：</label>
            <div class="layui-input-block" style="padding-right: 120px;">
                <input type="hidden" name="department_id" lay-filter="parent" lay-search="refresh" class="layui-input" />
                <input type="text" value="" lay-filter="targetParent" placeholder="分配部门" class="layui-input"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">会员名称:</label>
            <div class="layui-input-block">
                <input type="text" value="" name="username" lay-verify="require" placeholder="会员名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">手机号码:</label>
            <div class="layui-input-block">
                <input type="text" value="" name="phone" lay-verify="require" placeholder="手机号码" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">登录密码:</label>
            <div class="layui-input-block">
                <input type="password" value="" name="password" lay-verify="require" placeholder="登录密码" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">确认密码:</label>
            <div class="layui-input-block">
                <input type="password" value="" name="rePassword" lay-verify="require" placeholder="确认密码" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="submit">注册</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</section>

<script>

    layui.use(['form'],function () {
        var form = layui.form();
    });

    $(function () {
        var options = {
            form:'#defaultForm',
            success:console.log
        };
        Back.submit(options);

        Site.search({
            url: '/manage/ajax/getDepartment',
            targetClass: '[lay-filter="targetParent"]',      // 输入框目标元素
            parentClass: '.layui-input-block',          // 父级类
            hiddenClass: '[lay-filter="parent"]',          // 隐藏域input
            key:'name'
        });
    });

</script>

</body>

</html>
            <!-- 右侧主体内容结束 -->

        </div>
    </div>

</div>

<!-- 加载js文件-->
<!--  全局 -->
<script type="text/javascript" src="__JS__/site.js"></script>
<script type="text/javascript" src="__JS__/back.js"></script>
<script>
    layui.use(['layer', 'util'], function() {
        var $ = layui.jquery,
            layer = layui.layer,
            util = layui.util;

        var top = false, bar1 = false, bar2 = false,
        metaUtil = $('meta[name="util"]').attr('content');
        if (metaUtil !== undefined && metaUtil === 'true'){
            top = true;
            bar1 = true;
            bar2 = true;
        }

        //回到顶部
        //使用内部工具组件
        util.fixbar({
            top: top,
            // bar1: bar1,
//            bar2: bar2,
            css: {right: 15, bottom: 15},
            click: function(type){
                if(type === 'bar1'){
                    layer.msg('工具一');
                }else if (type === 'bar2'){
                    layer.msg('工具二');
                }
            }
        });

    });
</script>

</body>
</html>

