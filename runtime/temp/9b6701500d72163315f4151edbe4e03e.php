<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:69:"D:\upupw\aliveHouse\public/../application/manage\view\index\home.html";i:1497090902;s:78:"D:\upupw\aliveHouse\public/../application/common\view\layouts\manage-main.html";i:1497077905;}*/ ?>
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
    <title>表单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

</head>

<body>
<div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>Do it !</legend>
        <form class="layui-form" action="" id="form-login">

            <div class="layui-form-item">
                <label class="layui-form-label">图片懒加载</label>
                <div class="layui-input-block checkbox-left">
                    <div lay-filter="loading" lay-src="/static/images/goods-background.png" lay-class="user-images" lay-title="个人信息" lay-alt="我的头像" style="width: 100%;">
                    </div>
                    <a data-url="/manage/user/view.html?iframe=true" class="img" lay-filter="url" data-title="个人信息">
                        <div lay-filter="loading" lay-src="/static/images/default-user.png" lay-class="user-images" lay-title="个人信息" lay-alt="我的头像" style="width: 100%;">
                        </div>
                    </a>
                    <button class="btn btn-primary btn-lg" lay-submit="">查询</button>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">复选框</label>
                <div class="layui-input-block checkbox-left">
                    <input type="checkbox" name="like[write]" title="写作">
                    <input type="checkbox" name="like[read]" title="阅读" checked="">
                    <input type="checkbox" name="like[game]" title="游戏">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开关-关</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="close" lay-skin="switch" title="开关">
                    <input type="checkbox" name="xxx" lay-skin="switch">
                    <input type="checkbox" name="yyy" lay-skin="switch" lay-text="ON|OFF" checked>
                    <input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭">
                    <input type="checkbox" name="aaa" lay-skin="switch" disabled>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开关-开</label>
                <div class="layui-input-block">
                    <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="开关">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">单选框</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="是" title="是" checked="">
                    <input type="radio" name="sex" value="否" title="否">
                    <input type="radio" name="sex" value="禁" title="禁用" disabled="">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">普通文本域</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">编辑器</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
                </div>
            </div>
            <div class="layui-collapse">
                <div class="layui-form-item">
                    <label class="layui-form-label">销售状态：</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sale" value="不限" title="不限" checked="">
                        <input type="checkbox" lay-skin="primary" title="待售">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">均&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：</label>
                    <div class="layui-input-block">
                        <div class="layui-inline">
                            <div class="layui-input-inline" style="width: 150px;">
                                <select name="modules" lay-verify="required" lay-search="">
                                    <option value="1">不限</option>
                                    <option value="2">50万</option>
                                    <option value="3">80万</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：</label>
                            <div class="layui-input-inline" style="width: 150px;">
                                <select name="modules" lay-verify="required" lay-search="">
                                    <option value="1">不限</option>
                                    <option value="2">100万</option>
                                    <option value="3">130万</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">开盘日期：</label>
                            <div class="layui-input-inline" style="width: 150px;">
                                <select name="modules" lay-verify="required" lay-search="">
                                    <option value="1">不限</option>
                                    <option value="2">form</option>
                                    <option value="3">layim</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">面积：</label>
                            <div class="layui-input-inline" style="width: 70px;">
                                <input type="text" name="price_min" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid">-</div>
                            <div class="layui-input-inline" style="width: 70px;">
                                <input type="text" name="price_max" autocomplete="off" class="layui-input">
                            </div>
                            <span style="line-height: 38px;">(㎡)</span>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">范围</label>
                            <div class="layui-input-inline" style="width: 100px;">
                                <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid">-</div>
                            <div class="layui-input-inline" style="width: 100px;">
                                <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="submit">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>

        分割线
        <hr>

        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">输入框</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required="" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码框</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required="" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">辅助文字</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选择框</label>
                <div class="layui-input-block">
                    <select name="city" lay-verify="required">
                        <option value=""></option>
                        <option value="0">北京</option>
                        <option value="1">上海</option>
                        <option value="2">广州</option>
                        <option value="3">深圳</option>
                        <option value="4">杭州</option>
                    </select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="请选择" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="0" class="">北京</dd><dd lay-value="1" class="">上海</dd><dd lay-value="2" class="">广州</dd><dd lay-value="3" class="">深圳</dd><dd lay-value="4" class="">杭州</dd></dl></div>
                </div>
            </div>
            <div class="layui-form-item" pane="">
                <label class="layui-form-label">开关</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="switch" lay-skin="switch"><div class="layui-unselect layui-form-switch" lay-skin="_switch"><em></em><i></i></div>
                </div>
            </div>
            <div class="layui-form-item" pane="">
                <label class="layui-form-label">单选框</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><span>男</span></div>
                    <input type="radio" name="sex" value="女" title="女" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><span>女</span></div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">文本域</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn" lay-submit="" lay-filter="formDemoPane">立即提交</button>
            </div>
        </form>

        分割线
        <hr>

        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>昵称</th>
                <th>加入时间</th>
                <th>签名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>许闲心</td>
                <td>2016-11-28</td>
                <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
            </tr>
            <tr>
                <td>sentsin</td>
                <td>2016-11-27</td>
                <td> Life is either a daring adventure or nothing.</td>
            </tr>
            </tbody>
        </table>

        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>昵称</th>
                <th>加入时间</th>
                <th>签名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            </tbody>
        </table>

        <table class="layui-table" lay-skin="row">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>昵称</th>
                <th>加入时间</th>
                <th>签名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            </tbody>
        </table>

        <table class="layui-table" lay-even="" lay-skin="nob">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>昵称</th>
                <th>加入时间</th>
                <th>签名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            </tbody>
        </table>

        分割线
        <hr>

        <blockquote class="layui-elem-quote">引用区域的文字</blockquote>
        <blockquote class="layui-elem-quote layui-quote-nm">引用区域的文字</blockquote>

        分割线
        <hr>

        <fieldset class="layui-elem-field">
            <legend>字段集区块 - 默认风格</legend>
            <div class="layui-field-box">
                内容区域
            </div>
        </fieldset>

        <fieldset class="layui-elem-field layui-field-title">
            <legend>字段集区块 - 横线风格</legend>
            <div class="layui-field-box">
                内容区域
            </div>
        </fieldset>
        <hr>
        分割线

        <pre class="layui-code" lay-title="" lay-height="" lay-skin="" lay-encode="">
            var shazi = '';
        </pre>

    </fieldset>

</div>
<script type="text/javascript" src="__JS__/validator.js"></script>
<script>
    layui.config({
        base: '/static/js/',
    }).use(['form','layedit', 'laydate', 'validator'], function() {
        var form = layui.validator(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            title: function (value, item) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function (value, item) {
                layedit.sync(editIndex);
            },
            password: [/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$/, '密码格式错误'],
            layAjax: function (value, item) {
                var message = true;
                console.log(item.name);
                $.ajax({
                    url: "/back/user/index",
                    type: 'POST',
                    async: false,
                    data: {uaername: value},
                    success: function (back) {
                        if (back == '1') {
                            message = "登陆名已存在";
                        }
                    }
                });
                return message;
            }
        });

        form.set({ELEM:'#form-login'});

        Site.imgLoading();

        //初始化
        form.init();

        //监听提交
        form.on('submit(submit)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });

    });
</script>

<script>
    //    layui.use('form', function(){
    //        //如果有需要到镇的改改就可以实现
    //        var form = layui.form(),
    //            layer = layui.layer,
    //            $ = layui.jquery;
    //        var url =  '/manage/user/area.html'; //数据请求地址
    //        var province = ""; //编辑需要的省
    //        var city = ""; //编辑需要的市
    //        var district = ""; //编辑需要的县/区
    //        getJSON(url,$("select[name='province']").closest("div"));
    //        form.on('select(state)', function(data){
    //            $that = $(data.elem);
    //            var target = $that.attr("name");
    //            if (target == province){
    //                province = data.value;
    //            }else if(target == city){
    //                city = data.value;
    //            }else if(target == district){
    //                district = data.value;
    //            }
    //            urls = url+"?id="+data.value;
    //            getJSON(urls,$that.closest("div").next());
    //        });
    //        function getJSON(urls,even){
    //            $.getJSON(urls, function(json){
    //                var pid = 0;
    //                var name = even.find("select").attr("name");
    //                var select = "<select name=\"" + name + "\" lay-filter=\"state\">";
    //                select += "<option value=\"0\">请选择 </option>";
    //                $(json).each(function(){
    //                    if(province == this.id || city == this.id || district == this.id){
    //                        select += "<option value=\"" + this.id + "\"";
    //                        select += " selected=\"selected\" ";
    ////                        pid = this.id;
    //                        select += ">" + this.value + "</option>";
    //                    }
    //                });
    //                select += "</select>";
    //                even.html(select);
    //                var nextName = even.next().find("select").attr("name");
    //                even.next().html("<select name=\"" + nextName + "\" lay-filter=\"state\"><option value=\"0\">请选择 </option></select>");
    //                form.render('select');
    ////                if(pid != 0){
    ////                    getJSON(url+"?id="+pid,even.next());
    ////                }
    //            });
    //        }
    ////        $.ajax({
    ////            url: _url,
    ////            type: 'POST',
    ////            data: _formData,
    ////            async: false,
    ////            cache: false,
    ////            contentType: false,
    ////            processData: false,
    ////            beforeSend: function () {
    ////            },
    ////            success: function (data) {
    ////                 console.log(data);
    ////            },
    ////            error: function (data) {
    ////                 console.log(data);
    ////            }
    ////        });
    //    });
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

