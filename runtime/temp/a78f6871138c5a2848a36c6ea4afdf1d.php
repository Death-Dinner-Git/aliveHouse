<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:70:"D:\upupw\aliveHouse\public/../application/manage\view\index\index.html";i:1495613425;s:79:"D:\upupw\aliveHouse\public/../application/common\view\layouts\manage-index.html";i:1495617721;s:80:"D:\upupw\aliveHouse\public/../application/common\view\layouts\manage-header.html";i:1495758560;s:81:"D:\upupw\aliveHouse\public/../application/common\view\layouts\manage-sidebar.html";i:1495791767;s:80:"D:\upupw\aliveHouse\public/../application/common\view\layouts\manage-footer.html";i:1492422866;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="url" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="_SHORTCUT_" type="image/x-icon">

    <!-- For site css -->

    <script type="text/javascript" src="__JS__/jquery.js"></script>
    <script type="text/javascript" src="__JS__/bootstrap.js"></script>
    <script type="text/javascript" src="_LAYUI_/layui.js"></script>

    <!-- Fake Loader start -->
    <link rel="stylesheet" href="_PLUGINS_/fakeloader/css/fakeloader.css">
    <script src="_PLUGINS_/fakeloader/js/fakeloader.js"></script>
    <script>
        var _spinner2 = {
            timeToHide:1200,
            bgColor:"#1abc9c",
            spinner:"spinner2",
            zIndex:'20170407',
            loadCss:{
                top:'46%',
                left:'50%'
            }
        };
        $(document).ready(function(){
            $(".fakeloader").fakeLoader(_spinner2);
        });
    </script>
    <!-- Fake Loader end -->

    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="_LAYUI_/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="__CSS__/layout.css" media="all">
    <link rel="stylesheet" type="text/css" href="__CSS__/iconfont.css" media="all">

    <title><?php echo !empty($meta_title)?$meta_title.' - ' : ''; ?>_TITLE_</title>

</head>
<body>

<div class="wrap">

    <div class="container"  id="container">

        <div class="layui-layout layui-layout-back" id="layui_layout">

            <!-- 顶部区域开启 -->
            <div class="layui-header header header-theme-one">

    <!-- 顶级右边开始 -->
    <div class="dinner-site-resize sidebar-close">

        <!-- 顶级右侧logo区域开启 -->
        <div id="dinner-side-logo" style="">
            <a class="logo" href="javascript:void(0);" title="logo"><img src="/static/images/logo.png" alt="LOGO"></a>
        </div>
        <!-- 顶级右侧logo区域结束 -->

        <!-- 顶级右侧菜单关闭打开按钮开启 -->
        <div class="dinner-side-toggle"  id="dinner-side-toggle">
            <i class="fa fa-chevron-left" title="隐藏侧栏" data-open="fa fa-chevron-left" data-close="fa fa-chevron-right" aria-hidden="true"></i>
        </div>
        <!-- 顶级右侧菜单关闭打开按钮结束 -->

        <!-- 顶级左侧全屏按钮开启 -->
        <div class="dinner-side-full" id="dinner-side-full" data-full="false">
            <i class="fa fa-expand" title="进入全屏" data-open="fa fa-expand" data-close="fa fa-compress" aria-hidden="true"></i>
        </div>
        <!-- 顶级左侧全屏按钮结束 -->

    </div>
    <!-- 顶级右边结束 -->

    </textarea>

    <div class="layui-main dinner-header-body">

        <!-- 顶级主体左侧logo区域开启 -->
        <div class="">
            <a class="dinner-logo-title" href="javascript:void(0);" title="Home"><span style="">Home</span></a>
        </div>
        <!-- 顶级主体左侧logo区域结束 -->

        <!-- 顶级主体中间区域导航开启 -->
        <div class="layui-dinner-menu">
            <!--<ul class="layui-nav clearfix">-->
            <!--<li class="layui-nav-item layui-this">-->
            <!--<a href="javascirpt:;"><i class="fa fa-home"></i>模块1</a>-->
            <!--</li>-->
            <!--</ul>-->
        </div>
        <!-- 顶级主体中间区域导航结束 -->

        <!-- 顶级主体右侧区域导航开启 -->
        <ul class="layui-nav dinner-header-item">
            <li class="layui-nav-item first">
                <a href="javascript:;">
                    <img src="/static/images/default-user.png" class="userimg">
                    <cite>aliveDinner</cite>
                    <span class="layui-nav-more"></span>
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">操作1</a>
                    </dd>
                    <dd>
                        <a href="">操作2</a>
                    </dd>
                </dl>
            </li>
            <!--<li class="layui-nav-item">-->
            <!--<a href="javascript:;" id="lock">-->
            <!--<i class="fa fa-lock" aria-hidden="true" style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)-->
            <!--</a>-->
            <!--</li>-->
            <li class="layui-nav-item">
                <a href="/manage/login/logout.html">
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                    退出</a>
            </li>
        </ul>
        <!-- 顶级主体右侧区域导航结束 -->

    </div>
</div>
            <!-- 顶级区域结束 -->

            <!-- 左侧侧边导航开始 -->
            <div class="layui-side layui-side-bg layui-dinner-side" id="dinner-side">
    <div class="layui-side-scroll dinner-side-body" id="dinner-nav-side" lay-filter="side">
        <div id="dinner-nav-side-header">
            <div class="user-photo" id="user-profile" style="position: absolute;">
                <a class="img" title="我的头像" >
                    <img src="/static/images/default-user.png" class="user-images"></a>
                <p>你好！Dinner, 欢迎登录</p>
            </div>
        </div>
    </div>
</div>
            <!-- 左侧侧边导航结束 -->

            <!-- 右侧主体内容开启 -->
            <div class="layui-body" id="dinner-body" style="bottom: 0;border-left: solid 2px #1AA094;">
                <div class="layui-tab layui-tab-card dinner-tab-box" id="dinner-tab" lay-filter="switch-tab" lay-allowclose="true" lay-separator=" | ">
                    <ul class="layui-tab-title" data-url="/manage/index/home.html?iframe=true"  data-icon="fa fa-circle-o" data-title="控制面板">
                    </ul>
                    <div class="layui-tab-content">
                    </div>
                </div>
            </div>
            <!-- 右侧主体内容结束 -->

            <!-- 底部区域开启 -->
            <div class="layui-footer layui-dinner-foot" id="dinner-footer">
    <div class="layui-main dinner-footer-body">
        <div style="display: flex;">
            <p style="margin: auto;"><span><?php echo date('Y'); ?> &copy;</span> Write by CAR,<a href="http://www.car.cc">CAR</a>. 版权所有</p>
        </div>
    </div>
</div>
            <!-- 底部区域结束 -->

            <!-- 其他区域开启 -->
            <div class="site-tree-mobile layui-hide">
                <i class="layui-icon">&#xe602;</i>
            </div>
            <div class="site-mobile-shade"></div>
            <!-- 其他区域结束 -->

        </div>
    </div>

</div>

<!-- fakeLoader start -->
<div class="fakeloader"></div>
<!-- fakeLoader end -->

<!--锁屏模板 start-->
<!--<script type="text/template" id="lock-temp">-->
<!--<div class="dinner-header-lock" id="lock-box">-->
<!--<div class="dinner-header-lock-img">-->
<!--<img src="/static/images/default-user.png"/>-->
<!--</div>-->
<!--<div class="dinner-header-lock-name" id="lockUserName">Dinner</div>-->
<!--<input type="text" class="dinner-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd" />-->
<!--<button class="layui-btn layui-btn-small" id="unlock">解锁</button>-->
<!--</div>-->
<!--</script>-->
<!--锁屏模板 end -->

<!-- 菜单控件 -->
<!-- <div class="dinner-tab-menu">
	<span class="layui-btn dinner-test">刷新</span>
</div> -->

<!-- iframe框架刷新操作 -->
<!-- <div id="refresh_iframe" class="layui-btn refresh_iframe">刷新</div> -->

<!-- 加载js文件-->
<!-- 侧栏菜单 -->
<script type="text/javascript" src="__JS__/navbar.js"></script>
<!-- 重定义layui 的tab -->
<script type="text/javascript" src="__JS__/tab.js"></script>
<!--  布局控制 -->
<script type="text/javascript" src="__JS__/layout.js"></script>
<!--  全局 -->
<!-- 是否引入就看默认首页是否使用到全局函数 -->
<script type="text/javascript" src="__JS__/site.js"></script>
<script>
    layui.use(['layer', 'util'], function() {
        var $ = layui.jquery,
            layer = layui.layer,
            util = layui.util;

//        //回到顶部
//        //使用内部工具组件
//        util.fixbar({
//            top: true,
//            // bar1: true,
//            bar2: true,
//            css: {right: 15, bottom: 55},
//            click: function(type){
//                if(type === 'bar1'){
//                    layer.msg('工具一');
//                }else if (type === 'bar2'){
//                    layer.msg('工具二');
//                }else if (type === 'top'){
//                    layer.msg('返回顶层');
//                }
//            }
//        });

    });
</script>

</body>
</html>

