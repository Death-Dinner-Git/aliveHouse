/*!

 @Title: layui.upload 单文件上传 - 全浏览器兼容版
 @Author: 贤心
 @License：MIT

 */

layui.define('layer', function (exports) {
    "use strict";

    var $ = layui.jquery;
    var layer = layui.layer;
    var device = layui.device();
    var MOD_NAME = 'uploader';
    var elemDragEnter = 'layui-upload-enter';
    var elemIframe = 'layui-upload-iframe';
    var progress = false; //浏览器是否支持进度条

    var msgConf = {
        icon: 2
        , shift: 6
    }, fileType = {
        file: '文件'
        , video: '视频'
        , audio: '音频'
    };


    //自用工具库
    var whenReady = (function(){
        var ready = false;
        var funcs = [];//存储函数的数组
        function handler(e){
            if(ready) return;
            if(e.type === 'readystatechange' && document.readyState !== 'commplete'){
                return;
            }
            for(var i=0;i<funcs.length;i++){
                funcs[i].call(document);
            }
            //进行标记
            ready  = true;
            funcs = null;//置空
        }
        if(document.addEventListener){
            document.addEventListener('DOMContentLoaded', handler,false);
            document.addEventListener('readystatechange', handler,false);
            window.addEventListener('load',handler,false);
        }else{
            //兼容IE等不支持addEventListener方法的浏览器
            document.attachEvent('onreadystatechange',handler);
            window.attachEvent('onload',handler);
        }
        return function isReady(f){

            if(ready){
                f.call(document);
            }else{
                funcs.push(f);
            }
        }
    }());

    whenReady(function(){
        var elts = document.getElementsByTagName('input');
        for (var i = 0; i < elts.length; i++) {
            var input=elts[i];
            if(input.type !=='file') continue;
            var url = input.getAttribute('data-uploadTo');
            if(!url) continue;
            input.addEventListener('change', function(){
                var file = this.files[0];
                if(!file) return;
                var xhr = new  XMLHttpRequest();
                xhr.open('POST',url);
                xhr.send(file);
            },false);
        }
    });

    var Uploader = function (options) {
        if (this instanceof Uploader) {
            this.options = {
                //指定元素的选择器，默认直接查找class为layui-upload-file的元素
                elem: '.layui-upload-file',
                //指定元素的选择器，默认直接查找class为layui-upload-show的元素，如设置此项，返回json需要有src字典值 表示图片上传成功后的地址
                showElem: '.layui-upload-show',
                //上传文件的接口
                url: undefined,
                //设置http类型，如：post、get。默认post。也可以直接在input设置lay-method="get"来取代
                method: 'post',
                //执行上传前的回调
                before: undefined,
                //上传成功后的回调
                success: undefined,
                //设定上传的文件类型，也可以直接在input设置lay-type=""来取代；图片类型images。默认，不用设定;普通文件类型 file ;视频文件类型 video; 音频文件类型 audio
                type: undefined,
                //自定义可支持的文件扩展名，也可以直接在input设置lay-ext=""来取代,注意是用|分割
                ext: undefined,
                //自定义自定义文本
                //默认情况下，我们对按钮输出的文本是：上传图片，或上传文件/视频/音频，如果你想定义一个不一样的文本，使用参数title即可，也可以 设置lay-title  来取代
                title: undefined,
                // 提示方法(传递参数是 msg, value 和 item；msg 表示 错误 信息， value 表示 当前文件的值，item 表示文件表单 )
                tip: undefined,
                // 是否多文件上传，默认不是多文件上传
                isMulti: false,
                // 是否 使用 ajax 上传，默认不使用
                isAjax: false,
                // 是否 使用 进度条 ，默认使用
                progress: true,
                //是否不改变input的样式风格。默认false
                unwrap: false
            };
            this.iframe = undefined;
            this.cache = [];
            this.index = 0;
            this.set(options);
        } else {
            return new Uploader(options);
        }
    };

    //设置接口
    Uploader.prototype.set = function (options) {
        var that = this;
        $.extend(true, that.options, options || {});
        return that;
    };

    //初始化渲染
    Uploader.prototype.init = function () {
        var that = this, options = that.options;
        var body = $('body'), elem = $(options.elem || '.layui-upload-file');
        var iframe = $('<iframe id="' + elemIframe + '" class="' + elemIframe + '" name="' + elemIframe + '"></iframe>');

        //插入iframe
        $('#' + elemIframe)[0] || body.append(iframe);

        return elem.each(function (index, item) {
            item = $(item);
            var form = '<form target="' + elemIframe + '" method="' + (options.method || 'post') + '" key="set-mine" enctype="multipart/form-data" action="' + (options.url || '') + '"></form>';

            var type = item.attr('lay-type') || options.type; //获取文件类型

            //包裹ui元素
            if (!options.unwrap) {
                form = '<div class="layui-box layui-upload-button">' + form + '<span class="layui-upload-icon"><i class="layui-icon">&#xe608;</i>' + (
                        item.attr('lay-title') || options.title || ('上传' + (fileType[type] || '图片') )
                    ) + '</span></div>';
            }

            form = $(form);

            //拖拽支持
            if (!options.unwrap) {
                form.on('dragover', function (e) {
                    e.preventDefault();
                    $(this).addClass(elemDragEnter);
                }).on('dragleave', function () {
                    $(this).removeClass(elemDragEnter);
                }).on('drop', function () {
                    $(this).removeClass(elemDragEnter);
                });
            }

            //如果已经实例化，则移除包裹元素
            if (item.parent('form').attr('target') === elemIframe) {
                if (options.unwrap) {
                    item.unwrap();
                } else {
                    item.parent().next().remove();
                    item.unwrap().unwrap();
                }
            }
            ;

            //包裹元素
            item.wrap(form);

            //检查浏览器是否支持进度条事件
            checkBrowserIsSupportProgressEvent();
            if (progress === false){
                layer.msg('对不起您的浏览器不支持http进度事件！请更换谷歌或者火狐浏览器！');
            }

            //触发本地浏览
            item.off('change').on('change', function () {
                that.reader(this,type);
            });

            //触发上传
            item.off('change').on('change', function () {
                that.action(this, type);
            });
        });
    };

    //进度条
    Uploader.prototype.progress = function (e) {
        var html = '<progress id="uploadprogress" min="0" max="100" value="0">0</progress>';
        //定义progress的回调函数
        xhr.upload.onprogress = function (event) {
            if (event.lengthComputable) {
                var complete = (event.loaded / event.total * 100 | 0);
                var progress = document.getElementById('uploadprogress');
                progress.value = progress.innerHTML = complete;
            }
        };
        if(e.lengthComputable){
            progress.innerHTML = Math.round(100*e.loaded/e.total)+" % complete!";
        }
    };

    // 本地浏览
    Uploader.prototype.reader = function (input, type) {
        // 检查是否支持FileReader对象
        if (typeof FileReader !== undefined) {
            var acceptedTypes = {
                'image/png': true,
                'image/jpeg': true,
                'image/gif': true
            };
            if (acceptedTypes[document.getElementById('upload').files[0].type] === true) {
                var reader = new FileReader();
                reader.onload = function (event) {
                    var image = new Image();
                    image.src = event.target.result;
                    image.width = 100;
                    document.body.appendChild(image);
                };
                reader.readAsDataURL(document.getElementById('upload').files[0]);
            }
        }
        var that = this, options = that.options, val = input.value;
        var item = $(input), ext = item.attr('lay-ext') || options.ext || ''; //获取支持上传的文件扩展名;

        if (!val) {
            return;
        }

        //校验文件
        switch (type) {
            case 'file': //一般文件
                if (ext && !RegExp('\\w\\.(' + ext + ')$', 'i').test(escape(val))) {
                    layer.msg('不支持该文件格式', msgConf);
                    return input.value = '';
                }
                break;
            case 'video': //视频文件
                if (!RegExp('\\w\\.(' + (ext || 'avi|mp4|wma|rmvb|rm|flash|3gp|flv') + ')$', 'i').test(escape(val))) {
                    layer.msg('不支持该视频格式', msgConf);
                    return input.value = '';
                }
                break;
            case 'audio': //音频文件
                if (!RegExp('\\w\\.(' + (ext || 'mp3|wav|mid') + ')$', 'i').test(escape(val))) {
                    layer.msg('不支持该音频格式', msgConf);
                    return input.value = '';
                }
                break;
            default: //图片文件
                if (!RegExp('\\w\\.(' + (ext || 'jpg|png|gif|bmp|jpeg') + ')$', 'i').test(escape(val))) {
                    layer.msg('不支持该图片格式', msgConf);
                    return input.value = '';
                }
                break;
        }

        options.before && options.before(input);
        item.parent().submit();

        var iframe = $('#' + elemIframe), timer = setInterval(function () {
            var res;
            try {
                res = iframe.contents().find('body').text();
            } catch (e) {
                layer.msg('上传接口存在跨域', msgConf);
                clearInterval(timer);
            }
            if (res) {
                clearInterval(timer);
                iframe.contents().find('body').html('');
                try {
                    res = JSON.parse(res);
                } catch (e) {
                    res = {};
                    return layer.msg('请对上传接口返回JSON字符', msgConf);
                }
                typeof options.success === 'function' && options.success(res, input);
            }
        }, 30);

        input.value = '';
    };

    //提交上传
    Uploader.prototype.action = function (input, type) {
        var that = this, options = that.options, val = input.value;
        var item = $(input), ext = item.attr('lay-ext') || options.ext || ''; //获取支持上传的文件扩展名;

        if (!val) {
            return;
        }

        //校验文件
        switch (type) {
            case 'file': //一般文件
                if (ext && !RegExp('\\w\\.(' + ext + ')$', 'i').test(escape(val))) {
                    layer.msg('不支持该文件格式', msgConf);
                    return input.value = '';
                }
                break;
            case 'video': //视频文件
                if (!RegExp('\\w\\.(' + (ext || 'avi|mp4|wma|rmvb|rm|flash|3gp|flv') + ')$', 'i').test(escape(val))) {
                    layer.msg('不支持该视频格式', msgConf);
                    return input.value = '';
                }
                break;
            case 'audio': //音频文件
                if (!RegExp('\\w\\.(' + (ext || 'mp3|wav|mid') + ')$', 'i').test(escape(val))) {
                    layer.msg('不支持该音频格式', msgConf);
                    return input.value = '';
                }
                break;
            default: //图片文件
                if (!RegExp('\\w\\.(' + (ext || 'jpg|png|gif|bmp|jpeg') + ')$', 'i').test(escape(val))) {
                    layer.msg('不支持该图片格式', msgConf);
                    return input.value = '';
                }
                break;
        }

        options.before && options.before(input);
        item.parent().submit();

        var iframe = $('#' + elemIframe), timer = setInterval(function () {
            var res;
            try {
                res = iframe.contents().find('body').text();
            } catch (e) {
                layer.msg('上传接口存在跨域', msgConf);
                clearInterval(timer);
            }
            if (res) {
                clearInterval(timer);
                iframe.contents().find('body').html('');
                try {
                    res = JSON.parse(res);
                } catch (e) {
                    res = {};
                    return layer.msg('请对上传接口返回JSON字符', msgConf);
                }
                typeof options.success === 'function' && options.success(res, input);
            }
        }, 30);

        input.value = '';
    };

    //新实例化
    Uploader.prototype.create = function (options) {
        var that = this;
        var uploader = Uploader(options);
        uploader.init();
        return uploader;
    };

    var getFormData = function (form) {
        // 检查是否支持FormData
        if(window.FormData) {
            var formData = new FormData();

            // 建立一个upload表单项，值为上传的文件
            formData.append('upload', document.getElementById('upload').files[0]);
            var xhr = new XMLHttpRequest();
            xhr.open('POST', $(this).attr('action'));
            // 定义上传完成后的回调函数
            xhr.onload = function () {
                if (xhr.status === 200) {
                    console.log('上传成功');
                } else {
                    console.log('出错了');
                }
            };
            xhr.send(formData);
        }
    };

    //HTTP的进度事件
    var checkBrowserIsSupportProgressEvent = function () {
        if('onprogress' in (new XMLHttpRequest())){
            progress = true;
        }
    };

    //暴露接口
    exports(MOD_NAME, function (options) {
        return new Uploader(options);
    });
});

