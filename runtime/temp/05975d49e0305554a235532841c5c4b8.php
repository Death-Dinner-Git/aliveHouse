<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:71:"D:\upupw\aliveHouse\public/../application/manage\view\config\index.html";i:1497092241;s:78:"D:\upupw\aliveHouse\public/../application/common\view\layouts\manage-main.html";i:1497077905;}*/ ?>
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
    <link rel="stylesheet" type="text/css" href="__CSS__/iconfont.css" media="all">

    <!-- For site js -->
    <script type="text/javascript" src="__JS__/jquery.js"></script>
    <script type="text/javascript" src="__JS__/bootstrap.js"></script>
    <script type="text/javascript" src="_LAYUI_/layui.js"></script>

    <title><?php echo !empty($meta_title)?$meta_title.' - ' : ''; ?>_TITLE_</title>

</head>
<body>

<div class="wrap">

    <div class="container"  id="container">

        <div class="layui-layout layui-layout-back" id="layui_layout" style="padding: 15px;">

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
    </style>

</head>
<body>

<fieldset class="layui-elem-field">
    <legend>标签清单</legend>
    <div class="layui-field-box" data-pjax-container="" id="data-pjax" data-target="#data-table-container">
        <form class="layui-form layui-form-pane" id="dinner-layui-form" action="" lay-pjax-form="">
            <div class="layui-form-item">

                <label class="layui-form-label">标签:</label>
                <div class="layui-input-inline">
                    <input type="text" value="<?php echo $param['name']; ?>" name="name" placeholder="标签" class="layui-input">
                </div>

                <label class="layui-form-label">标签类型</label>
                <div class="layui-input-inline">
                    <select name="type" lay-search >
                        <option value="0">全部</option>
                        <?php if(is_array($typeList) || $typeList instanceof \think\Collection || $typeList instanceof \think\Paginator): $i = 0; $__LIST__ = $typeList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $key; ?>" <?php if($key == $param['type']): ?>selected<?php endif; ?>><?php echo $item; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>

                <label class="layui-form-label">应用类型</label>
                <div class="layui-input-inline">
                    <select name="app" lay-search >
                        <option value="2">全部</option>
                        <?php if(is_array($appList) || $appList instanceof \think\Collection || $appList instanceof \think\Paginator): $i = 0; $__LIST__ = $appList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $key; ?>" <?php if($key == $param['app']): ?>selected<?php endif; ?>><?php echo $item; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
                <label class="layui-btn" lay-pjax="submit">查询</label>

                <label class="layui-btn" onclick="Site.showUrl('添加一个标签','/manage/config/create.html?iframe=true','50%','62.8%','2',true,'LAY_LABEL_CREATE',true)">添加</label>
            </div>
        </form>
    </div>
</fieldset>

<section id="data-table-container">
    <table class="layui-table" lay-even="" lay-skin="row">
        <thead>
        <tr>
            <th>序号</th>
            <th>配置标识</th>
            <th>配置说明</th>
            <th>配置值</th>
            <th>配置类型</th>
            <th style="width:50px; text-align: center">操作</th>
        </tr>
        </thead>
        <tbody>
        <?php if(is_array($dataProvider) || $dataProvider instanceof \think\Collection || $dataProvider instanceof \think\Paginator): $key = 0; $__LIST__ = $dataProvider;if( count($__LIST__)==0 ) : echo "<tr class='empty'><td colspan='5' style='text-align: center;'> 没有数据 </td> </tr>" ;else: foreach($__LIST__ as $key=>$model): $mod = ($key % 2 );++$key;?>
        <tr data-key="<?php echo $model['id']; ?>">
            <td style="width: 45px;text-align: center;">
                <?php echo $key+($indexOffset); ?>
            </td>
            <td style="width: 100px;"><?php echo $model['name']; ?></td>
            <td><?php echo $model['title']; ?></td>
            <td><?php echo $model['value']; ?></td>
            <td>
                <?php if(isset($typeList[$model['type']])): ?>
                <?php echo $typeList[$model['type']]; else: ?> 无效
                <?php endif; ?>
            </td>
            <td style="width: 150px;text-align: center;" class="action">
                <a href="javascript:void(0);">
                    <button onclick="Site.showUrl('编辑标签','/manage/config/update.html?iframe=true&id=<?php echo $model['id']; ?>','50%','62.8%','2',true,'LAY_LABEL_CREATE',true)" class="layui-btn layui-btn-small">
                        <i class="fa fa-pencil"></i>
                        编辑
                    </button>
                </a>
                <a href="javascript:void(0);"><button onclick="Site.showDialog('信息确认','你确定删除此标签吗?',function(){deleteUser(<?php echo $model['id']; ?>);})" class="layui-btn layui-btn-small"><i class="fa fa-remove"></i>删除</button></a>
            </td>
        </tr>
        <?php endforeach; endif; else: echo "<tr class='empty'><td colspan='5' style='text-align: center;'> 没有数据 </td> </tr>" ;endif; ?>
        </tbody>
    </table>
</section>

<!-- 分页容器 -->
<div id="paging_0124" style="text-align:right;" data-count="<?php echo $count; ?>" data-pages="<?php echo $pages; ?>" data-page=""></div>

<script>
    layui.use([ 'layer','laydate', 'form'], function() {});
    function deleteUser(id) {
        $.ajax({
            type : "post",
            url : '/manage/config/delete?id='+ id,
            dataType : 'json',
            beforeSend : function() {
                Site.loading();
            },
            success : function(data) {
                setTimeout(Site.hide(),500);
                if (data.code == '1'){
                    $('[data-key="'+id+'"]').remove();
                    success('删除成功');
                }else {
                    Site.hide();
                    error('删除失败');
                }
            },
            error : function(data) {
                Site.hide();
                error('删除失败');
            }
        });
    }
    $(function() {
        Site.loadPage('paging_0124');
        console.log(Site.getModule('form'));
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
            bar2: bar2,
            css: {right: 15, bottom: 15},
            click: function(type){
                if(type === 'bar1'){
                    layer.msg('工具一');
                }else if (type === 'bar2'){
                    layer.msg('工具二');
                }else if (type === 'top'){
                    layer.msg('返回顶层');
                }
            }
        });

    });
</script>

</body>
</html>

