/*!

 @Title: layui.upload 单文件上传 - 全浏览器兼容版
 @Author: 贤心
 @License：MIT

 */

layui.define('layer', function (exports) {
    "use strict";

    var $ = layui.jquery;
    var layer = top.layui.layer || layui.layer;
    var device = layui.device();
    var MOD_NAME = 'uploader';
    var elemDragEnter = 'layui-upload-enter';
    var elemIframe = 'layui-upload-iframe';
    // 创建一个XMLHTTPRequest对象
    var xhr = function(){
        if(window.ActiveXObject) {
            return new ActiveXObject('Microsoft.XMLHTTP');
        }else if(window.XMLHTTPRequest){
            return new XMLHTTPRequest();
        }
    }();
    var progressId = 'uploadProgress';
    var progressIndex;
    var stopProgress = false;
    var speed; //速度 单位b
    var total = 0; //总量 单位b

    var msgConf = {
        icon: 2
        , shift: 6
    }, fileType = {
        file: '文件'
        , video: '视频'
        , audio: '音频'
    };

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

            //包裹元素
            item.wrap(form);

            //检查网速
            that.getSpeed();

            //检查浏览器是否支持进度条事件
            checkBrowserIsSupportProgressEvent();

            // //触发本地浏览
            // item.off('change').on('change', function () {
            //     that.reader(this,type);
            // });

            if (that.isAjax){
                //触发 Ajax 上传
                item.off('change').on('change', function () {
                    that.ajax(this, type);
                });
            }else {
                //触发 iframe 上传
                item.off('change').on('change', function () {
                    that.action(this, type);
                });
            }
        });
    };

    /**
     *获取速度
     */
    Uploader.prototype.getSpeed = function () {
        var that = this;
        var start = new Date().getTime(),time,size = 165585;
        var img = new Image();
        img.onload = function(){
            time = new Date().getTime()-start;
            speed = Math.floor(size/time);
            img.onload = null;
        };
        img.src = '/static/images/getSpeed.png?time='+start;
        return that;
    };

    //进度条事件
    Uploader.prototype.progress = function (e) {
        var that = this;
        var progressValue = 0;
        //重置停止进度条命令
        stopProgress = false;
        if (that.options.isAjax){
            //定义progress的回调函数
            // XHR.upload.onprogress 是提交请求的响应回调，XHR.onprogress 是上传成功后的响应回调
            xhr.beforeSend = function () {
                that.showProgress();
            };
            xhr.upload.onprogress = function (event) {
                if (event.lengthComputable) {
                    progressValue = (event.loaded / event.total * 100 | 0);
                    that.setProgress(progressValue)
                }
            };
            xhr.onprogress = function (event) {
                that.setProgress(100);
            };
            xhr.success = function () {
                that.closeProgress();
            };
            xhr.error = function () {
                that.closeProgress();
            };
        }else {

            that.showProgress();
            var getSpeed = function () {
                return speed;
            };
            var time = 500, send = 0,start=new Date().getTime(),progress = setInterval(function () {
                if (stopProgress){
                    clearInterval(progress);
                    progressValue = 100;
                    that.closeProgress();
                    that.setProgress(progressValue);
                    return false;
                }
                if (speed <= 0){
                    speed = getSpeed();
                }
                if (progressValue >= 95){
                    return false;
                }else if(progressValue>=0 && progressValue <= 100){
                    send = speed*((new Date().getTime())-start);
                    progressValue = Math.floor((send/total*100));
                    if (progressValue >= 95){
                        progressValue = 95;
                    }
                    if (stopProgress){
                        progressValue = 100;
                    }
                    that.setProgress(progressValue);
                }
            },500);
        }
        return that;
    };

    //显示进度条
    Uploader.prototype.showProgress = function () {
        var that = this;
        var progress = '<div class="layui-progress"><div id="'+progressId+'" class="layui-progress-bar layui-bg-red" lay-percent="0%"></div></div>';
        progressIndex = layer.msg(progress,{
            time:false,
            area: ['400px'],
            shade: ['0.372', '#000'],
            closeBtn:2,
            end: function(index, layero){
                layer.close(progressIndex);
            }
        });
        return that;
    };

    //关闭进度条
    Uploader.prototype.closeProgress = function () {
        var that = this;
        layer.close(progressIndex);
        return that;
    };

    //设置进度条
    Uploader.prototype.setProgress = function (percent) {
        var that = this;
        percent = parseInt(percent);
        if(percent >= 0 && percent <=100) {
            percent = percent+'%';
        }
        var progress = $('#' + progressId,top.window.document);
        !progress[0] || progress.stop().animate({width:percent});
        if(percent>=100){
            stopProgress = true;
            that.closeProgress();
        }
        return that;
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
    Uploader.prototype.ajax = function (input, type) {
        var that = this, options = that.options, val = input.value;
        var item = $(input), ext = item.attr('lay-ext') || options.ext || ''; //获取支持上传的文件扩展名;

        console.log(input);
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
        that.showProgress();
        var file = this.files[0];
        if(!file) return;
        xhr.open('POST',that.options.url);
        xhr.send(file);
        item.parent().submit();

        var iframe = $('#' + elemIframe), timer = setInterval(function () {
            var res;
            try {
                res = iframe.contents().find('body').text();
                // that.setProgress(Math.random(100));
            } catch (e) {
                layer.msg('上传接口存在跨域', msgConf);
                // that.closeProgress();
                clearInterval(timer);
            }
            if (res) {
                // that.closeProgress();
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

        var k = 0;
        var sd = setInterval(function () {
            k += 10;
            that.setProgress(k);
            if (k>=100){
                clearInterval(sd);
                that.closeProgress();
            }
        },1000);

        input.value = '';
    };

    //提交上传
    Uploader.prototype.action = function (input, type) {
        var that = this, options = that.options, val = input.value;
        var item = $(input), ext = item.attr('lay-ext') || options.ext || ''; //获取支持上传的文件扩展名;

        if (!val) {
            return;
        }

        total = 0; //重置上传总量
        for(var key =0 ; key < input.files.length ;key++){
            /**
             * lastModified 最后一次修改文件的时间戳
             * lastModifiedDate 最后一次修改文件的时间对象
             * name 文件名称
             * type 文件类型
             * size 文件大小 单位是字节
             */
            var file = input.files[key];
            var name = file.name || val;
            total += file.size;
            //校验文件
            switch (type) {
                case 'file': //一般文件
                    if (ext && !RegExp('\\w\\.(' + ext + ')$', 'i').test(escape(name))) {
                        layer.msg('不支持该文件格式', msgConf);
                        return input.value = '';
                    }
                    break;
                case 'video': //视频文件
                    if (!RegExp('\\w\\.(' + (ext || 'avi|mp4|wma|rmvb|rm|flash|3gp|flv') + ')$', 'i').test(escape(name))) {
                        layer.msg('不支持该视频格式', msgConf);
                        return input.value = '';
                    }
                    break;
                case 'audio': //音频文件
                    if (!RegExp('\\w\\.(' + (ext || 'mp3|wav|mid') + ')$', 'i').test(escape(name))) {
                        layer.msg('不支持该音频格式', msgConf);
                        return input.value = '';
                    }
                    break;
                default: //图片文件
                    if (!RegExp('\\w\\.(' + (ext || 'jpg|png|gif|bmp|jpeg') + ')$', 'i').test(escape(name))) {
                        layer.msg('不支持该图片格式', msgConf);
                        return input.value = '';
                    }
                    break;
            }
        }

        options.before && options.before(input);

        if (that.options.progress){
            that.progress();
        }
        item.parent().submit();

        var iframe = $('#' + elemIframe), timer = setInterval(function () {
            var res;
            try {
                res = iframe.contents().find('body').text();
            } catch (e) {
                layer.msg('上传接口存在跨域', msgConf);
                if (that.options.progress){
                    stopProgress = true;
                    that.setProgress(100);
                    setTimeout(function () {
                        that.closeProgress();
                    },400);
                }
                clearInterval(timer);
            }
            if (res) {
                if (that.options.progress){
                    stopProgress = true;
                    that.setProgress(100);
                    setTimeout(function () {
                        that.closeProgress();
                    },400);
                }
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
        var isSupport = false;
        if('onprogress' in (new XMLHttpRequest())){
            isSupport = true;
        }
        if (!isSupport){
            layer.msg('对不起您的浏览器不支持http进度事件！请更换谷歌或者火狐浏览器！');
        }
    };

    //暴露接口
    exports(MOD_NAME, function (options) {
        return new Uploader(options);
    });
});

