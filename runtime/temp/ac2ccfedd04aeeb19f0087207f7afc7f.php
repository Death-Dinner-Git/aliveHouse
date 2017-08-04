<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:89:"F:\aliveDinner\upupw\www\aliveHouse\public/../application/manage\view\homeUser\index.html";i:1497965800;s:94:"F:\aliveDinner\upupw\www\aliveHouse\public/../application/common\view\layouts\manage-main.html";i:1501605631;}*/ ?>
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
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <title><?php echo !empty($meta_title)?$meta_title.' - ' : ''; ?>_TITLE_</title>
    <style>
        table td.action{
            padding: 6px 10px;
        }
        table td.action a button i{
            padding-right: 4px;
        }
        table .user-head{
            display: inline-block;
            position: relative;
        }
        table .username{
            display: inline-block;
            padding-left: 42px;
        }
        table .user-img{
            display: inline-block;
            position: absolute;
            top: -26px;
            padding: 5px;
            width: 32px;
            height: 32px;
        }
        table .user-img img{
            width: 100%;
            height: 100%;
            border-radius: 50%;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border: 1px solid #d4d4d4;
        }
    </style>

</head>
<body>

<fieldset class="layui-elem-field">
    <legend>查询</legend>
    <div class="layui-field-box">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">

                <label class="layui-form-label">关键词:</label>
                <div class="layui-input-inline">
                    <input type="text" value="<?php echo $param['key']; ?>" name="key" placeholder="请输入关键词" class="layui-input">
                </div>

                <button class="layui-btn" lay-submit="">查询</button>

            </div>
        </form>
    </div>
</fieldset>

<table class="layui-table" lay-even="" lay-skin="row">
    <thead>
    <tr>
        <th>序号</th>
        <th>登录名称</th>
        <th>真实名称</th>
        <th>手机号码</th>
        <th>邮箱账号</th>
        <th>注册时间</th>
        <th style="width:50px; text-align: center">操作</th>
    </tr>
    </thead>
    <tbody>
    <?php if(is_array($dataProvider) || $dataProvider instanceof \think\Collection || $dataProvider instanceof \think\Paginator): $key = 0; $__LIST__ = $dataProvider;if( count($__LIST__)==0 ) : echo "<tr class='empty'><td colspan='5' style='text-align: center;'> 没有数据 </td> </tr>" ;else: foreach($__LIST__ as $key=>$model): $mod = ($key % 2 );++$key;?>
    <tr data-key="<?php echo $model['id']; ?>">
        <td style="width: 45px;text-align: center;">
            <?php echo $key+($indexOffset); ?>
        </td>
        <td>
            <span class="user-head">
                <?php if(!empty($model['head_url'])): ?>
                <div lay-filter="img" lay-src="<?php echo $model['head_url']; ?>" lay-class="user-img" lay-title="个人信息" lay-alt="我的头像" style="width: 100%;height: 40px;"></div>
                <?php else: ?> <div class="user-img"><img src="/static/images/default-user.png"></div>
                <?php endif; ?>
            </span>
            <span class="username"><?php echo $model['username']; ?></span>
        </td>
        <td><?php echo $model['real_name']; ?></td>
        <td><?php echo $model['phone']; ?></td>
        <td><?php echo $model['email']; ?></td>
        <td><?php echo $model['registered_at']; ?></td>
        <td style="width: 230px;text-align: center;" class="action">
            <a href="javascript:void(0);">
                <button onclick="Site.showUrl('查看用户信息','/manage/home_user/view.html?id=<?php echo $model['id']; ?>&iframe=true','51%','62.8%','2',true,true,'LAY_LABEL_CREATE',true,true)" class="layui-btn layui-btn-small">
                    <i class="fa fa-eye"></i>
                    详情
                </button>
            </a>
            <a href="javascript:void(0);">
                <button onclick="Site.showUrl('查看用户 <?php echo $model['username']; ?> 足迹','/manage/home_user/log.html?id=<?php echo $model['id']; ?>&iframe=true','72%','88%','2',true,true,'LAY_LABEL_CREATE',true,true,true,true)" class="layui-btn layui-btn-small">
                    <i class="fa fa-map-marker"></i>
                    用户足迹
                </button>
            </a>
            <a href="javascript:void(0);"><button onclick="Site.showDialog('信息确认','你确定删除此用户吗?',function(){deleteUser(<?php echo $model['id']; ?>);},true)" class="layui-btn layui-btn-small"><i class="fa fa-remove"></i>删除</button></a>
        </td>
    </tr>
    <?php endforeach; endif; else: echo "<tr class='empty'><td colspan='5' style='text-align: center;'> 没有数据 </td> </tr>" ;endif; ?>
    </tbody>
</table>

<!-- 分页容器 -->
<div id="paging_0124" style="text-align:right;" data-count="<?php echo $count; ?>" data-pages="<?php echo $pages; ?>" data-page=""></div>

<script>
    layui.use([ 'layer','laydate', 'form'], function() {});
    function deleteUser(id) {
        $.ajax({
            type : "post",
            url : '/manage/home_user/delete?id='+ id,
            dataType : 'json',
            beforeSend : function() {
                Site.loading();
            },
            success : function(data) {
                setTimeout(Site.hide(),500);
                if (data.code == '1'){
                    $('[data-key="'+id+'"]').remove();
                    success('删除成功');
                }
            },
            error : function(data) {
                Site.hide();
                error('删除失败');
            }
        });
    }
</script>
<script>
    $(function() {
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage,
                element = 'paging_0124',
                _page = $('#'+element),
                currPage = Site.getUrlParam('pageNumber'),
                count = _page.attr('data-count'),
                pages = _page.attr('data-pages');
            currPage = currPage > 1 ? currPage : 1;
            count = count ? count : 0;
            _page.attr('data-page',currPage);
            laypage({
                curr:currPage,
                cont: element,
                pages: pages,
                skip: true,
                jump: function(obj,first){
                    if(obj.curr != currPage) {
                        var url = location.href;
                        if(url.indexOf("?") == -1) {
                            location.href = url+"?pageNumber="+obj.curr;
                        }else {
                            var page = Site.getUrlParam('pageNumber');
                            if(page) {
                                location.href = url.replace("pageNumber="+page,"pageNumber="+obj.curr);
                            }else {
                                location.href = url.replace("?","?pageNumber="+obj.curr+"&");
                            }
                        }
                    }
                    _page.prepend('<span style="display: inline-block;text-align:center;padding: 0 20px;color: #333;font-size: 14px;"> 数量: '+(count)+' </span>');
                }
            });
        });
    });
</script>

</body></html>
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

