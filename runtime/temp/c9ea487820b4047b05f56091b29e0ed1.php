<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:72:"D:\upupw\aliveHouse\public/../application/manage\view\config\update.html";i:1496311822;}*/ ?>

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
            font-size: 16px;
        }
        #CreateForm .layui-form-item .layui-form-label{
            width: 130px;
        }
        #CreateForm .layui-form-item .layui-input-inline{
            width: 220px;
        }
        #CreateForm .layui-form-item .layui-input-inline .layui-input{
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

<section>
    <div style="display:flex; margin: 30px;">
        <div style="margin:auto;width: auto;height: auto;margin-top: 50px;">
            <form class="layui-form" method="post" id="CreateForm" action="/manage/config/update.html?iframe=true&id=<?php echo $model['id']; ?>">


                <div class="layui-form-item">
                    <label class="layui-form-label">配置应用:</label>
                    <div class="layui-input-inline">
                        <select name="Config[app]" lay-search >
                            <option>请选择应用</option>
                            <?php if(is_array($appList) || $appList instanceof \think\Collection || $appList instanceof \think\Paginator): $i = 0; $__LIST__ = $appList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo $key; ?>" <?php if($key == $model['app']): ?>selected<?php endif; ?>><?php echo $item; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                    <div class="layui-input-inline help-msg">
                        <i class="fa"></i>
                        <label class="help-hint"></label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">配置类型:</label>
                    <div class="layui-input-inline">
                        <select name="Config[type]" lay-search >
                            <option>请选择类型</option>
                            <?php if(is_array($configList) || $configList instanceof \think\Collection || $configList instanceof \think\Paginator): $i = 0; $__LIST__ = $configList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo $key; ?>" <?php if($key == $model['type']): ?>selected<?php endif; ?>><?php echo $item; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                    <div class="layui-input-inline help-msg">
                        <i class="fa"></i>
                        <label class="help-hint"></label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">配置标识:</label>
                    <div class="layui-input-inline">
                        <input type="text" value="<?php echo $model['name']; ?>" name="Config[name]" placeholder="配置标识" class="layui-input">
                    </div>
                    <div class="layui-input-inline help-msg">
                        <i class="fa"></i>
                        <label class="help-hint"></label>
                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">配置此值:</label>
                    <div class="layui-input-inline">
                        <input type="text" value="<?php echo $model['value']; ?>" name="Config[value]" placeholder="配置此值" class="layui-input">
                    </div>
                    <div class="layui-input-inline help-msg">
                        <i class="fa"></i>
                        <label class="help-hint"></label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">配置说明:</label>
                    <div class="layui-input-inline">
                        <input type="text" value="<?php echo $model['title']; ?>" name="Config[title]" placeholder="配置说明" class="layui-input">
                    </div>
                    <div class="layui-input-inline help-msg">
                        <i class="fa"></i>
                        <label class="help-hint"></label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <button class="layui-btn" lay-submit="" lay-filter="submit">添加</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    layui.use([ 'jquery','layer', 'form'], function() {});
</script>

<!-- 加载js文件-->
<script type="text/javascript" src="__JS__/Validform_v5.3.2.js"></script>
<script>
    var id = $('#userId').val();
    var alertMsg = function (msg,obj,passed) {
        var _fa = 'fa fa-close',config = {icon: 2,shift: 3},showed = false;
        if (obj.type !== 3){
            _fa = 'fa fa-check';
            config.icon = 1;
        }

        if(obj.obj){
            var _parent = obj.obj.parents('.layui-form-item');
            if (_parent && _parent.length > 0){
                showed = true;
                _parent.find('.help-hint').html(msg);
                _parent.find('.fa').attr('class',_fa);
            }
        }
        if (!showed){
            layui.use(['layer'],function () {
                layer.msg(msg,config);
            });
        }
    };

    /**
     * @description 信息提示函数
     * @param msg 提示信息
     * @param icon 提示图标：默认是0；可支持表情类型有 0-6
     *              icon 值解释 ：(0--感叹号；1--对符号；2---错符号；3--问号；4--锁头；5--失败表情，6--成功表情)
     * @param shift 提示出现动画：默认是0;可支持的动画类型有0-6 ，如果不想显示动画，设置 shift: -1 即可。
     *             shift值解释： (0--中间显示；1--从上显示；2--从下显示；3--从左显示；4--从左下旋转显示；5--淡出，6--震动)
     * @param time 提示消失时间: 单位是毫秒（1秒=1000毫秒）。
     * @param shade 弹层外区域:默认是0 。可取值 0到1，如果你想定义别的颜色，可以shade: [0.8, '#393D49']；如果你不想显示遮罩，可以shade: 0
     */
    var alertTip = function (msg,icon,shift,time,shade) {
        msg = (msg !== undefined && msg !== '') ? msg : '提示信息缺失' ;
        icon = (icon == undefined) ? 0 : ( (parseInt(icon) >= 0 && parseInt(icon) <=6) ? parseInt(icon) : 0 );
        shift = (shift == undefined) ? 0 : ( (parseInt(shift) >= 0 && parseInt(shift) <=6) ? parseInt(shift) : 0 );
        time = (time == undefined) ? 1000 : ( parseInt(time) > 0? parseInt(time) : 1000 );
        shade = (shade == undefined) ? 0 : ( (shade >= 0 && shade <=1) ? shade : 0 );
        var config = {icon: icon,shift: shift,time:time,shade:shade};
        layui.use(['layer'],function () {
            layer.msg(msg,config);
        });
    };

    $(function(){
        var form = $("#CreateForm").Validform({
            tiptype:alertMsg,
            showAllError:false,
            onBlur:true,
            tipSweep:true,
            postonce:false,
            ajaxPost:false,
            datatype:{
                "s4-32":/^[\w]{1,32}$/,
                "s6-32":/^[\w]{6,32}$/,
                "username":function(gets,obj,curform,regxp){
                    //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
                    var reg1=/^[\w\.\_]{4,32}$/;

                    if(reg1.test(gets)){return true;}
                    return '登录名 格式不合法';

                    //注意return可以返回true 或 false 或 字符串文字，true表示验证通过，返回字符串表示验证失败，字符串作为错误提示显示，返回false则用errmsg或默认的错误提示;
                },
                "password":function(gets,obj,curform,regxp){
                    //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
                    var reg1=/^[\w\.\_]{6,32}$/;

                    if(reg1.test(gets)){return true;}
                    return '密码 格式不合法';

                    //注意return可以返回true 或 false 或 字符串文字，true表示验证通过，返回字符串表示验证失败，字符串作为错误提示显示，返回false则用errmsg或默认的错误提示;
                },
            },
            beforeCheck:function(curform){
                //在表单提交执行验证之前执行的函数，curform参数是当前表单对象。
                //这里明确return false的话将不会继续执行验证操作;
            },
            beforeSubmit:function(curform){
                //在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
                //这里明确return false的话表单将不会提交;
//                alert('正在提交中...');
//                return false;
            },
            callback:function(data){
//                console.log(data);
                //返回数据data是json格式，{"info":"demo info","status":"y"}
                //info: 输出提示信息;
                //status: 返回提交数据的状态,是否提交成功。如可以用"y"表示提交成功，"n"表示提交失败，在ajax_post.php文件返回数据里自定字符，主要用在callback函数里根据该值执行相应的回调操作;
                //你也可以在ajax_post.php文件返回更多信息在这里获取，进行相应操作；
                //ajax遇到服务端错误时也会执行回调，这时的data是{ status:**, statusText:**, readyState:**, responseText:** }；

                //这里执行回调操作;
                //注意：如果不是ajax方式提交表单，传入callback，这时data参数是当前表单对象，回调函数会在表单验证全部通过后执行，然后判断是否提交表单，如果callback里明确return false，则表单不会提交，如果return true或没有return，则会提交表单。
            }
        });

        //通过$.Tipmsg扩展默认提示信息;
        form.tipmsg.w["s4-32"]="请输入4到32个字符";
        form.tipmsg.w["s6-32"]="请输入6到32个字符";

        form.addRule([
            {
                ele:"[name=\"username\"]",
                datatype:"username|s4-32",
            },
            {
                ele:"[name=\"password\"]",
                datatype:"password|s6-32",
                ignore:"ignore"
            },
            {
                ele:"[name=\"rePassword\"]",
                datatype:"*",
                recheck:"password",
                ignore:"ignore"
            }
        ]);
    })


</script>

</body>

</html>