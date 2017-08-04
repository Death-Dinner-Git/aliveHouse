<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:84:"F:\aliveDinner\upupw\www\aliveHouse\public/../application/manage\view\ban\index.html";i:1497965800;s:94:"F:\aliveDinner\upupw\www\aliveHouse\public/../application/common\view\layouts\manage-main.html";i:1501605631;}*/ ?>
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
        table td.readed label.had-readed,table td.action a button.had-readed{
            background-color: #d4d4d4 !important;
            color: #333333 !important;
        }
    </style>

</head>
<body>


<section>
    <?php if(isset($meta_title)): ?>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend><?php echo $meta_title; ?></legend>
    </fieldset>
    <?php endif; ?>
    <div class="layui-field-box">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">

                <label class="layui-form-label">权限:</label>
                <div class="layui-input-inline">
                    <input type="text" value="<?php echo $param['name']; ?>" name="name" placeholder="权限名称" class="layui-input">
                </div>

                <label class="layui-form-label">等级:</label>
                <div class="layui-input-inline">
                    <select name="type" lay-search >
                        <option value="0">全部</option>
                        <?php if(is_array($levels) || $levels instanceof \think\Collection || $levels instanceof \think\Paginator): $i = 0; $__LIST__ = $levels;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $key; ?>" <?php if($key == $param['level']): ?>selected<?php endif; ?>><?php echo $item; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>

                <label class="layui-form-label">状态:</label>
                <div class="layui-input-inline">
                    <select name="type" lay-search >
                        <option value="0">全部</option>
                        <?php if(is_array($lists) || $lists instanceof \think\Collection || $lists instanceof \think\Paginator): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $key; ?>" <?php if($key == $param['type']): ?>selected<?php endif; ?>><?php echo $item; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>

                <button class="layui-btn" lay-submit="">查询</button>

            </div>
        </form>
    </div>
</section>

<table class="layui-table" lay-even="" lay-skin="row">
    <thead>
    <tr>
        <th>序号</th>
        <th>联系人</th>
        <th>联系方式</th>
        <th>联系邮箱</th>
        <th>联系地址</th>
        <th>是否已读</th>
        <th style="width:50px; text-align: center">操作</th>
    </tr>
    </thead>
    <tbody>
    <?php if(is_array($dataProvider) || $dataProvider instanceof \think\Collection || $dataProvider instanceof \think\Paginator): $key = 0; $__LIST__ = $dataProvider;if( count($__LIST__)==0 ) : echo "<tr class='empty'><td colspan='5' style='text-align: center;'> 没有数据 </td> </tr>" ;else: foreach($__LIST__ as $key=>$model): $mod = ($key % 2 );++$key;?>
    <tr data-key="<?php echo $model['id']; ?>">
        <td style="width: 45px;text-align: center;">
            <?php echo $key+($indexOffset); ?>
        </td>
        <td style="width: 100px;"><?php echo $model['username']; ?></td>
        <td><?php echo $model['content']; ?></td>
        <td><?php echo $model['email']; ?></td>
        <td><?php echo $model['address']; ?></td>
        <td class="readed">
            <label class="layui-btn layui-btn-small <?php if($model['readed'] == 2): ?>had-readed<?php endif; ?>">
            <i class="fa fa-paperclip"></i>
               <span>
                   <?php if($model['readed'] == 2): ?>
                已读
                <?php else: ?> 未读
                <?php endif; ?>
               </span>
            </label>
        </td>
        <td style="width: 250px;text-align: center;" class="action">
            <a href="javascript:void(0);">
                <button onclick="Site.showUrl('查看详情','/manage/ban/view.html?id=<?php echo $model['id']; ?>','62.8%','82%','2',true,'LAY_TRAVEL_<?php echo $model['id']; ?>',true)" class="layui-btn layui-btn-small" >
                <i class="fa fa-eye"></i>
                查看详情
                </button>
            </a>
            <a href="javascript:void(0);">
                <button onclick="Site.showDialog('设置确认','你确定更新此项状态吗?',function(){updateModel(<?php echo $model['id']; ?>);})" class="layui-btn layui-btn-small read-status <?php if($model['readed'] == 2): ?>had-readed<?php else: endif; ?>" >
                <i class="fa fa-cog"></i>
                <span>
                    <?php if($model['readed'] == 2): ?>设置未读<?php else: ?>设置已读<?php endif; ?>
                </span>
                </button>
            </a>
            <a href="javascript:void(0);"><button onclick="Site.showDialog('信息确认','你确定删除此项数据吗?',function(){deleteModel(<?php echo $model['id']; ?>);})" class="layui-btn layui-btn-small"><i class="fa fa-remove"></i>删除</button></a>
        </td>
    </tr>
    <?php endforeach; endif; else: echo "<tr class='empty'><td colspan='5' style='text-align: center;'> 没有数据 </td> </tr>" ;endif; ?>
    </tbody>
</table>

<!-- 分页容器 -->
<div id="paging_0124" style="text-align:right;" data-count="<?php echo $count; ?>" data-pages="<?php echo $pages; ?>" data-page=""></div>

<script>
    layui.use([ 'layer','laydate', 'form'], function() {});
    function updateModel(id) {
        $.ajax({
            type : "post",
            url : '/manage/ban/read?id='+ id,
            dataType : 'json',
            beforeSend : function() {
                Site.loading();
            },
            success : function(data) {
                setTimeout(Site.hide(),500);
                if (data.code == '1'){
                    if (data.readed !== undefined){
                        var content = '已读',
                            action = '设置未读';
                        if (data.readed != '1'){
                            content = '未读';
                            action = '设置已读';
                            $('[data-key="'+id+'"] .readed label').removeClass('had-readed');
                            $('[data-key="'+id+'"] .read-status').removeClass('had-readed');
                        }else{
                            $('[data-key="'+id+'"] .readed label').removeClass('had-readed').addClass('had-readed');
                            $('[data-key="'+id+'"] .read-status').removeClass('had-readed').addClass('had-readed');
                        }
                        $('[data-key="'+id+'"] .readed label span').html(content);
                        $('[data-key="'+id+'"] .read-status span').html(action);
                    }
                    success('更新成功',true);
                }else {
                    Site.hide();
                    error('更新失败',true);
                }
            },
            error : function(data) {
                Site.hide();
                error('更新失败',true);
            }
        });
    }
    function deleteModel(id) {
        $.ajax({
            type : "post",
            url : '/manage/ban/delete?id='+ id,
            dataType : 'json',
            beforeSend : function() {
                Site.loading();
            },
            success : function(data) {
                setTimeout(Site.hide(),500);
                if (data.code == '1'){
                    $('[data-key="'+id+'"]').remove();
                    success('删除成功',true);
                }else {
                    Site.hide();
                    error('删除失败',true);
                }
            },
            error : function(data) {
                Site.hide();
                error('删除失败',true);
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

