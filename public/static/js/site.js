/*!
 * Site.js
 * URL:http://
 * Only for Guest mode
 * Sort as
 * 		Utils/ModuleFunction/Other Global InitFunction
 */
var config = {
    shade: ['0.372', '#000'],
    width: {
        max: '800px',
        small: '700px',
        min: '600px'
    },
    height: {
        max: '500px',
        small: '400px',
        min: '300px'
    },
    imageError: '/static/images/not-capture.png',
    layuiBase: '/static/js/',
    initComponents: ['jquery', 'element', 'layer', 'form', 'flow', 'laydate'],
    allComponents: ['jquery', 'element', 'layer', 'util', 'form', 'code', 'laydate', 'flow', 'layedit', 'upload', 'laypage']
};

var _width = document.documentElement.clientWidth;//获取页面可见宽度
var _height = document.documentElement.clientHeight;//获取页面可见高度
var jquery, element, layer, util, form, code, laydate, flow, layedit, upload, laypage;

if (typeof Site === "undefined") {
    Site = {};
}
/* 初始化操作 */
Site.init = function () {
    //layui
    layui.config({
        base: config.layuiBase
    }).use(config.initComponents, function () {
        window.jQuery = window.$ = layui.jquery;
        window.element = element = layui.element;
        window.layer = layer = layui.layer;
        window.form = form = layui.form;
        window.flow = flow = layui.flow;
        window.laydate = laydate = layui.laydate;
        if (typeof $ === "undefined") {
            $ = layui.jquery;
        }
        var device = layui.device();
        element();
        //阻止IE7以下访问
        if (device.ie && device.ie < 8) {
            layer.alert('Layui最低支持ie8，您当前使用的是古老的 IE' + device.ie + '，依旧怀旧');
        }
        //手机设备的简单适配
        var treeMobile = $('.site-tree-mobile');
        var shadeMobile = $('.site-mobile-shade');

        treeMobile.on('click', function () {
            $('body').addClass('site-mobile');
        });

        shadeMobile.on('click', function () {
            $('body').removeClass('site-mobile');
        });
    });
};

/*  */
Site.getModule = function (name, parentWin) {
    var module;

    switch (name) {
        case 'jquery': {
            module = top.window.jQuery ? top.window.jQuery : (window.jQuery ? window.jQuery : (jQuery ? jQuery : layui.jQuery ) );
        }
            break;
        case 'element': {
            module = top.window.element ? top.window.element : (window.element ? window.element : (element ? element : layui.element ) );
            if (typeof module === 'function') {
                module = module();
            }
        }
            break;
        case 'layer': {
            if (parentWin === false) {
                module = layui.layer ? layui.layer : (layer ? layer : (window.layer ? window.layer : top.window.layer ));
            } else {
                module = top.window.layer ? top.window.layer : (window.layer ? window.layer : (layer ? layer : layui.layer ));
            }
        }
            break;
        case 'form': {
            module = window.form ? window.form : (form ? form : layui.form );
            if (!module) {
                layui.use(['form'], function () {
                    module = layui.form;
                });
            }
        }
            break;
        case 'laydate': {
            module = top.window.laydate ? top.window.laydate : (window.laydate ? window.laydate : (laydate ? laydate : layui.laydate ) );
        }
            break;
        case 'flow': {
            module = top.window.flow ? top.window.flow : (window.flow ? window.flow : (flow ? flow : layui.flow )  );
        }
            break;
        default: {
        }
            break;
    }

    return module;
};

/*  */
Site.getUtil = function (callback, component) {
    if (util !== undefined) {
        if (typeof callback === 'function') {
            callback(util);
        }
    } else {
        if (!component) {
            component.push('util');
        } else {
            component = 'util';
        }
        layui.config({
            base: config.layuiBase
        }).use(component, function () {
            window.util = util = layui.util;
            if (typeof callback === 'function') {
                callback(util);
            }
        });
    }
};

/*  */
Site.getCoder = function (component, callback) {
    if (code !== undefined) {
        if (typeof callback === 'function') {
            callback(code);
        }
    } else {
        layui.config({
            base: config.layuiBase
        }).use(component, function () {
            window.code = code = layui.code;
            if (typeof callback === 'function') {
                callback(code);
            }
        });
    }
};

/*  */
Site.getLayEditor = function (component, callback) {
    if (layedit !== undefined) {
        if (typeof callback === 'function') {
            callback(layedit);
        }
    } else {
        layui.config({
            base: config.layuiBase
        }).use(component, function () {
            window.layedit = layedit = layui.layedit;
            if (typeof callback === 'function') {
                callback(layedit);
            }
        });
    }
};

/*  */
Site.getUploader = function (component, callback) {
    if (upload !== undefined) {
        if (typeof callback === 'function') {
            callback(upload);
        }
    } else {
        layui.config({
            base: config.layuiBase
        }).use(component, function () {
            window.upload = upload = layui.upload;
            if (typeof callback === 'function') {
                callback(upload);
            }
        });
    }
};

/*  */
Site.getLayPager = function (callback) {
    if (laypage !== undefined) {
        if (typeof callback === 'function') {
            callback(laypage);
        }
    } else {
        layui.config({
            base: config.layuiBase
        }).use('laypage', function () {
            window.laypage = laypage = layui.laypage;
            if (typeof callback === 'function') {
                callback(laypage);
            }
        });
    }
};

/*  */
Site.loadScript = function (url) {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = url;
    document.body.appendChild(script);
};

/*  */
Site.showUrl = function (title, url, width, height, type, maxmin, ele, shade, scroll, shadeClose, refresh,end) {
    var content = '', stop = true;
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    type = type || 1;
    type = parseInt(type);
    if (parseInt(type) !== 2) {
        $.post(url, {}, function (data) {
            content = data;
            stop = false;
        }, "html");
    } else {
        scroll = scroll === false ?  'no' : 'yes';
        content = [url, scroll];
        stop = false;
    }
    if (stop) {
        return;
    }
    width = width || config.width.max;
    height = height || config.height.max;
    maxmin = maxmin !== undefined && maxmin === true && parseInt(type) === 2;
    if (shade === true) {
        shade = config.shade;
    }
    shade = shade || (maxmin !== undefined && maxmin === true && parseInt(type) === 2 ? 0 : 0.3);
    shadeClose = shadeClose || false;
    refresh = refresh || false;
    return myLayer.open({
        type: type,
        area: [width, height],
        maxmin: maxmin,
        shade: shade,
        shadeClose: shadeClose,
        refresh: refresh,
        id: ele,
        title: '<p style="text-align: center;">' + title + '</p>',
        content: content,
        end:end
    });
};

/*  */
Site.msg = function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    return myLayer.msg(content, {time: 2000});
};

/*  */
Site.wait = function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    if (!content) {
        content = "请稍后....";
    }
    return myLayer.msg(content, {shade: 0.3, time: 1000});
};

/*  */
Site.loading = function (icon) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    icon = icon || 1;
    return myLayer.load(icon, {type: 3, icon: icon, shade: 0.3});
};

/*  */
Site.load = function (url, content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    if (!content) {
        content = "加载中....";
    }

    myLayer.msg(content, {shade: 0.3, time: 628});
    setTimeout(function () {
        window.location.href = url;
    }, 628);
};

/*  */
Site.loadFrame = function (title, url, width, height, ele, btn) {
    var content;
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    title = title || '标题';
    content = [url, 'no'];
    width = width || config.width.max;
    height = height || config.height.min;
    btn = btn === true ? ['全部关闭'] : undefined;

    //多窗口模式，层叠置顶
    return myLayer.open({
        type: 2 //此处以iframe举例
        , title: title
        , area: [width, height]
        , shade: 0
        , shadeClose: true
        , maxmin: true
        , id: ele
        , content: content
        , btn: btn //只是为了演示
        , yes: function () {
            layer.closeAll();
        }
        , zIndex: myLayer.zIndex //重点1
    });
};

/*  */
Site.hide = function () {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    myLayer.closeAll();
    if (top.window.layer) {
        top.window.layer.closeAll();
    }
};

/*  */
Site.close = function (index) {
    if (top.window.layer) {
        top.window.layer.close(index);
    }
};

/*  */
Site.error = function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    return myLayer.msg(content, {icon: 2, time: 2000});
};

/*  */
Site.success = function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    return myLayer.msg(content, {icon: 1, time: 2000});
};

/*  */
Site.tip = function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    return myLayer.msg(content, {icon: 0, time: 2000});
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
Site.showTip = function (msg,icon,shift,time,shade) {
    msg = (msg !== undefined && msg !== '') ? msg : '提示信息缺失' ;
    icon = (icon === undefined) ? 0 : ( (parseInt(icon) >= 0 && parseInt(icon) <=6) ? parseInt(icon) : 0 );
    shift = (shift === undefined) ? 0 : ( (parseInt(shift) >= 0 && parseInt(shift) <=6) ? parseInt(shift) : 0 );
    time = (time === undefined) ? 1000 : ( parseInt(time) > 0? parseInt(time) : 1000 );
    shade = (shade === undefined) ? 0 : ( (shade >= 0 && shade <=1) ? shade : 0 );
    var config = {icon: icon,shift: shift,time:time,shade:shade};
    return top.layer.msg(msg,config);
};

/* 确认对话框 */
Site.confirm = function (url, msg, width, height, shade) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    width = width || config.width.min;
    height = height || config.height.min;
    if (shade === true) {
        shade = config.shade;
    }
    shade = shade || config.shade;
    return myLayer.open({
        area: [width, height],
        shade: shade,
        shadeClose: true,
        content: msg,
        yes: function () {
            window.location.href = url;
            return false;
        }
    });
};

/*  */
Site.showDialog = function (title, msg, callBack, width, height, shade) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    width = width || config.width.min;
    height = height || config.height.min;
    if (shade === true) {
        shade = config.shade;
    }
    shade = shade || config.shade;
    return myLayer.open({
        title: title,
        area: [width, height],
        shade: shade,
        shadeClose: true,
        content: msg,
        yes: function (index) {
            myLayer.close(index);
            if (callBack && (typeof callBack === "function" )) {
                callBack();
            }
            return false;
        }
    });
};

/*  */
Site.tab = function (options, parentWin, width, height, shade) {
    parentWin = parentWin || true;
    var myLayer = Site.getModule('layer', parentWin);
    if (!myLayer) {
        myLayer = layer;
    }

    options = options || [{title: 'TAB1', content: '内容1'}, {title: 'TAB2', content: '内容2'}];

    width = width || config.width.min;
    height = height || config.height.min;
    if (shade === true) {
        shade = config.shade;
    }
    shade = shade || config.shade;
    return myLayer.tab({
        area: [width, height],
        shade: shade,
        shadeClose: true,
        tab: options
    });
};

/*  */
Site.imgLoading = function (ele) {
    var $this = $(ele);
    if ($this === undefined || $this.attr('lay-src') === undefined || $this.attr('lay-filter') !== 'loading') {
        return;
    }

    var _width = layui.getStyle(ele, 'width'), _height = layui.getStyle(ele, 'height');

    var img = '<div style="display: flex;width: ' + _width + ';height: ' + _height + ';"><div style="margin: auto;"><img src="/static/images/loading-2.gif"></div></div>';
    $this.html(img);

    var _src = $this.attr('lay-src'),
        _class = $this.attr('lay-class') || '',
        _title = $this.attr('lay-title') || '',
        _alt = $this.attr('lay-alt') || '',
        _error = $this.attr('lay-error') || '/static/images/lockscreenbg.png';
    var attr = '';
    if (_class !== '') {
        attr += ' class="' + _class + '"';
    }
    if (_title !== '') {
        attr += ' title="' + _title + '"';
    }
    if (_alt !== '') {
        attr += ' alt="' + _alt + '"';
    }
    setTimeout(function () {
        layui.img(_src, function () {
            img = '<img src="' + _src + '" ' + attr + '>';
            $this.html(img);
        }, function () {
            img = '<img src="' + _error + '" ' + attr + ' style="height: 100%;width: 100%;overflow: hidden;">';
            $this.html(img);
        })
    }, 800);
};

/*  */
Site.photos = function (options) {
    var photoConfig = {
        elem:undefined,
        url:'',
        json:[],
        parentWin:true,
        width:config.width.max,
        height:config.height.max,
        shade:config.shade,
        callback:null
    };
    photoConfig = $.extend(photoConfig,options);
    var myLayer = Site.getModule('layer', photoConfig.parentWin);
    if (!myLayer) {
        myLayer = layer;
    }
    var index, load;

    if (photoConfig.url !== '') {
        $.ajax({
            type: "post",
            url: photoConfig.url,
            dataType: 'json',
            beforeSend: function () {
                load = Site.loading();
            },
            success: function (data) {
                /**
                 *  data 返回格式
                 {
                     "title": "", //相册标题
                     "id": 123, //相册id
                     "start": 0, //初始显示的图片序号，默认0
                     "data": [   //相册包含的图片，数组格式
                         {
                             "alt": "图片名",
                             "pid": 666, //图片id
                             "src": "", //原图地址
                             "thumb": "" //缩略图地址
                         }
                     ]
                 }
                 */

                setTimeout(Site.close(load), 500);
                index = myLayer.photos({
                    photos: data,
                    tab: function (pic, layero) {
                        console.log(pic) //当前图片的一些信息
                    },
                    anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
                });
            },
            error: function (data) {
                Site.close(load);
                Site.error('加载失败', true);
            }
        });
    } else {
        /**
         //HTML示例
         <div id="layer-photos-demo" class="layer-photos-demo">
         <img layer-pid="图片id，可以不写" layer-src="大图地址" src="缩略图" alt="图片名">
         <img layer-pid="图片id，可以不写" layer-src="大图地址" src="缩略图" alt="图片名">
         </div>
         */

        index = myLayer.photos({
            photos: photoConfig.json,
            area: [photoConfig.width, photoConfig.height],
            shade: photoConfig.shade,
            shadeClose: true,
            tab: function (pic, layero) {
                console.log(pic) //当前图片的一些信息
            },
            anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
        });
    }
    return index;
};

/*  */
Site.uploader = function (options) {
    var _config = {
        elem:'.layui-upload-file',
        url:'/manage/ajax/uploader',
        before:null,  // 上传成功后的回调函数,参数 input 表单
        success:null, // 上传成功后的回调函数,参数res代表后天返回的数据，input是文件input 表单
    };
    _config = $.extend(_config,options);
    layui.use(['upload'], function () {
        var upload = layui.upload,
            index;
        upload({
            elem:_config.elem,
            url: _config.url,
            before: function (input) {
                index = Site.loading();
                if (typeof _config.before === 'function'){
                    _config.before(input);
                }
            },
            success: function (res, input) {
                Site.close(index);
                if (typeof _config.success === 'function'){
                    _config.success(res,input);
                }
            }
        });

    });
};



/*  */
Site.resizeShowTab = function () {
    if (window.parent) {
        window.parent.$(".layui-show").find("iframe").load();
    }else {
        $(".layui-show").find("iframe").load();
    }
};

/*  */
Site.getUrlParam = function (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};

/*  */
Site.pjax = function (_url, _type, _data, _dataType, _beforeSend, _success, _error) {
    if (typeof _url !== 'string') {
        return;
    }
    _type = _type || "POST";
    _data = _data || {};
    _dataType = _dataType || {};
    _beforeSend = _beforeSend || function () {
        };
    _success = _success || function () {
        };
    _error = _error || function () {
        };
    $.ajax({
        url: _url,
        type: _type,
        data: _data,
        dataType: _dataType,
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-PJAX', 'true');
            if (typeof _beforeSend === 'function') {
                _beforeSend();
            }
        },
        success: function (data) {
            if (typeof _success === 'function') {
                _success(data);
            }
            var title = $('head title').html() || '没有标题';
            var state = {
                title: title,
                url: _url,
                otherkey: {}
            };
            window.history.pushState(state, title, _url);
        },
        error: function (data) {
            if (typeof _error === 'function') {
                _error();
            }
        }
    });
};

/*  */
Site.initPjax = function () {
    if ($.support.pjax) {

        $(document).on('click', 'a[lay-filter^="pjax"]', function (event) {
            var container = $(this).closest('[data-pjax-container]');
            if (typeof container !== undefined) {
                var $container = $(container);
                var containerId = $(container).attr('id');
                if (typeof containerId === undefined) {
                    containerId = 'layui_layout';
                    $container.attr('id', containerId);
                }
                var containerSelector = '#' + containerId;
                $.pjax.click(event, {container: containerSelector})
            }
        });

        $(document).on('click', '[lay-pjax="submit"]', function (event) {
            var container = $(this).closest('[data-pjax-container]');
            if (typeof container !== undefined) {
                var $container = $(container);
                var containerId = $(container).attr('id');
                if (typeof containerId === undefined) {
                    containerId = 'layui_layout';
                    $container.attr('id', containerId);
                }
                var containerSelector = '#' + containerId;
                $.pjax.click(event, {container: containerSelector})
            }
        });

        $(document).on('submit', '[data-pjax-container] form[lay-pjax-form]', function (event) {
            e.preventDefault();
            e.stopPropagation();
            var container = $(this).closest('[data-pjax-container]');
            if (typeof container !== undefined) {
                var $container = $(container);
                var containerId = $(container).attr('id');
                if (typeof containerId === undefined) {
                    containerId = 'dinner-layui-form';
                    $container.attr('id', containerId);
                }
                var containerSelector = '#' + containerId;
                // $.pjax.submit(event, {container: containerSelector});
            }
        });

    }
};

/*  */
Site.addPjax = function (selector, container, options) {
    if ($.support.pjax) {
        $(document).pjax(selector, container, options);
    }
};

/*  */
Site.loadPage = function (pageElement, total) {
    Site.getLayPager(function () {
        var laypage = layui.laypage;
        total = total || true;
        pageElement = pageElement || 'paging_0124';
        var _page = $('#' + pageElement),
            currPage = Site.getUrlParam('pageNumber'),
            count = _page.attr('data-count'),
            pages = _page.attr('data-pages');
        currPage = currPage > 1 ? currPage : 1;
        count = count ? count : 0;
        _page.attr('data-page', currPage);
        laypage({
            curr: currPage,
            cont: pageElement,
            pages: pages,
            skip: true,
            jump: function (obj, first) {
                if (obj.curr != currPage) {
                    var url = location.href;
                    if (url.indexOf("?") == -1) {
                        location.href = url + "?pageNumber=" + obj.curr;
                    } else {
                        var page = Site.getUrlParam('pageNumber');
                        if (page) {
                            location.href = url.replace("pageNumber=" + page, "pageNumber=" + obj.curr);
                        } else {
                            location.href = url.replace("?", "?pageNumber=" + obj.curr + "&");
                        }
                    }
                }
                if (total) {
                    _page.prepend('<span class="dinner-page-total"> 数量: ' + (count) + ' </span>');
                }
            }
        });
    });
};

/**
 * 单张图片懒加载
 * @param options
 */
Site.loadImage = function (options) {
    var $config = {
        img: undefined,
        url: null,
        error: null,
        callback: null,
        removeUrl: true
    };
    $config = $.extend($config, options);
    var $this = $($config.img), url = $this.data('url'), $parent = $this.data('target'), status = false;
    if (!url) {
        return;
    }
    var img = new Image(); // 创建一个Image对象，实现图片的预下载

    img.onload = function () {
        if (typeof(img.readyState) == 'undefined') {
            img.readyState = 'undefined';
        }
        //在IE8以及以下版本中需要判断readyState而不是complete
        if ((img.readyState == 'complete' || img.readyState == "loaded") || img.complete) {
            status = true;
        } else {
            img.onreadystatechange(event);
        }
        img.onload = null;
        reImage();
    };

    //当加载出错或者图片不存在
    img.onerror = function () {
        if (typeof $config.error === 'function') {
            $config.error.call();
        } else {
            var _width = 200, _height = 200;
            if ($this.width() < _width) {
                _width = $this.width();
            }
            if ($this.height() < _height) {
                _height = $this.height();
            }
            $this.parent().css({
                position: 'relative',
                display: 'inline-block',
                width: $this.width(),
                height: $this.height(),
                background: '#f4f4f4'
            });
            $this.attr('src', config.imageError).css({
                position: 'absolute',
                width: _width,
                height: _height,
                left: '50%',
                top: '50%',
                marginLeft: -(_width / 2),
                marginTop: -(_height / 2)
            });
        }
    };

    //当加载状态改变
    img.onreadystatechange = function (e) {
        //此方法只有IE8以及一下版本会调用
    };

    img.src = url;

    if (img.complete) { // 如果图片已经存在于浏览器缓存，直接调用回调函数
        reImage();
        return; // 直接返回，不用再处理onload事件
    }

    function reImage() {
        if (status || img.complete) { // 如果图片已经存在于浏览器缓存，直接调用回调函数
            if (typeof $config.callback === 'function') {
                $config.callback.call(img);
            }
            if (!$parent) {
                if ($this.is('img')) {
                    $this.attr('src', url);
                    if ($config.removeUrl) {
                        $this.removeAttr('data-url');
                    }
                }
            } else {
                $($parent).append("<img src='" + url + " />");
            }
        }
    }
};

/**
 * 图片延迟加载 图片懒加载
 * @param options
 */
Site.lazyLoadScroll = function (options) {
    //配置些参数
    var _config = {
        element: null,
        lazyClass: 'lazy',
        hasLazyClass: 'hasLazy',
        removeUrl: true
    };
    _config = $.extend(_config, options);
    var temp = -1;//用来判断是否是向下滚动（向上滚动就不需要判断延迟加载图片了）
    var type = 0;
    _config.scrollHeight = Site.scrollTop(); // 滚动的高度
    _config.bodyHeight = Site.clientHeight(); // body（页面）可见区域的总高度
    if (_config.element){
        _config.scrollHeight = Site.scrollTop(_config.element); // 滚动的高度
        _config.bodyHeight = Site.clientTop(_config.element); // body（页面）可见区域的总高度
    }else{
        type = 1;
        _config.element = document;
    }
    $(_config.element).find('img').each(function () {
        var $this = $(this);
        $this.removeClass(_config.lazyClass).addClass(_config.lazyClass);
    });
    $(_config.element).find('img' + '.' + _config.lazyClass).each(function () {
        var $this = $(this);
        var imgTop = Site.offsetTop($this);//（图片纵坐标）
        if ( ((imgTop - _config.scrollHeight) >= 0 && (imgTop - _config.scrollHeight) <= _config.bodyHeight) || ((imgTop - _config.scrollHeight) <= Site.clientHeight() && type ) ) {
            Site.loadImage({img: $this});
            $this.removeClass(_config.lazyClass).removeClass(_config.hasLazyClass).addClass(_config.hasLazyClass);
            if (_config.removeUrl) {
                $this.removeAttr('data-url');
            }
        }
    });
    $(document).on('scroll', _config.element, function (e) {
        if (type){
            _config.scrollHeight = Site.scrollTop(); // 滚动的高度
            _config.bodyHeight = Site.clientHeight(); // body（页面）可见区域的总高度
        }else {
            _config.scrollHeight = Site.scrollTop(_config.element); // 滚动的高度
            _config.bodyHeight = $(_config.element).height(); //可见区域的总高度
        }
        $(this).find('img' + '.' + _config.lazyClass).each(function () {
            var $this = $(this);
            var imgTop = Site.offsetTop($this);//（图片纵坐标）
            if (temp < _config.scrollHeight) {//为true表示是向下滚动，否则是向上滚动，不需要执行动作。
                if (((imgTop - _config.scrollHeight) <= _config.bodyHeight) || ((imgTop - _config.scrollHeight) <= Site.clientHeight() && type )) {
                    Site.loadImage({img: $this});
                    $this.removeClass(_config.lazyClass).removeClass(_config.hasLazyClass).addClass(_config.hasLazyClass);
                    if (_config.removeUrl) {
                        $this.removeAttr('data-url');
                    }
                }
                temp = _config.scrollHeight;
            } else {
                if (((imgTop - _config.scrollHeight) >= 0 && (imgTop - _config.scrollHeight) <= _config.bodyHeight) ||　((imgTop - _config.scrollHeight) <= Site.clientHeight() && type )) {
                    Site.loadImage({img: $this});
                    $this.removeClass(_config.lazyClass).removeClass(_config.hasLazyClass).addClass(_config.hasLazyClass);
                    if (_config.removeUrl) {
                        $this.removeAttr('data-url');
                    }
                }
            }
        });
    });
};

/**
 * 图片懒加载
 * @param options
 */
Site.lazyLoad = function (options) {
    //配置些参数
    var _config = {
        element: null,
        eleGroup: [],
        eleTop: null,
        eleHeight: null,
        screenHeight: null,
        visibleHeight: null,
        scrollHeight: null,
        scrolloverHeight: null,
        limitHeight: null
    };
    _config = $.extend(_config, options);
    var _element = _config.element;
    var _eleGroup = _config.eleGroup;

    //没有数据中断
    if (!(_config.element || _eleGroup)) {
        return;
    }

    // 对数据进行初始化
    if (_config.element) {
        var $element = $(_config.element);
        if ($element.is('img')) {
            _eleGroup.push($element);
        } else {
            $element.find('img').each(function () {
                _eleGroup.push($(this));
            });
        }
    }

    _config.screenHeight = _config.screenHeight || Site.clientTop();
    _config.scrolloverHeight = _config.scrolloverHeight || Site.scrollTop();

    if (Site.scrollTop() === 0) {
        _config.limitHeight = _config.scrolloverHeight + _config.screenHeight;
    } else {
        _config.limitHeight = Site.scrollTop() + _config.screenHeight;
    }
    for (var i = 0, j = _config.eleGroup.length; i < j; i++) {
        if (Site.offsetTop(_config.eleGroup[i]) <= limitHeight && _config.eleGroup[i].attr('data-url')) {
            Site.loadImage({img: _config.eleGroup[i]});
        }
    }
};

/**
 *
 * @param data
 * @param options
 */
Site.initBanner = function (data, options) {
    if (data === undefined || data.length <= 0) {
        return;
    }
    var imageData = [],
        loadImage = [],
        imageWidth,
        position = 0,
        size = 0,
        index = 0,
        t, $index;
    var $default = {
        banner: "#webBanner",
        bannerBody: "bannerBody",
        bannerPrev: "bannerPrev",
        bannerNext: "bannerNext",
        switchStyle: "switchBtn",
        bannerBottom: "bannerBottom",
        height: "0",
        width: "0",
        playTime: "4000",
        animateTime: "1500",
        barType: "1", //底部类型
        hiddenBar: false,//设置是否隐藏底部导航条
        targetType: "2",
        wideScreen: false,
        autoPlay: true,//自动播放
        interval: 6000,//播放间隔
        barColor: false,//背景色
        hiddenControl: false,//设置隐藏左右切换按钮
    };
    var config = $.extend($default, options);
    var $banner = $(config.banner);
    $banner.css({overflow: "hidden"});
    //没有容器，中断
    if ($banner.length <= 0) {
        return;
    }
    if (config.wideScreen) {
        config.width = _width;
        config.height = _height;
    } else {
        var width = $banner.width();
        var height = $banner.height();
        if (config.width <= 0) {
            config.width = width > 0 ? width : _width;
        }
        if (config.height <= 0) {
            config.height = height > 0 ? height : config.width / 1200 * 400;
        }
    }
    imageData = data;
    imageWidth = config.width;
    var barButton = [],//底部导航条
        contentBody = [],  //轮播主体
        content,
        bar = '',
        control = '';
    //渲染HTML
    for (var i = 0; i < imageData.length; i++) {
        var item = '', aPicAttr = '', aDescAttr = '', alt = '', desc = '', btn = '', barDesc = '';
        if (imageData[i].target !== undefined && imageData[i].target !== '') {
            if (config.targetType == '2') {
                aPicAttr = ' target="_blank" href="' + imageData[i].target + '"';
                aDescAttr = ' target="_blank" href="' + imageData[i].target + '"';
            } else if (config.targetType == '1') {
                aPicAttr = ' target="_blank" href="' + imageData[i].target + '"';
            }
        }
        if (imageData[i].title !== undefined) {
            alt = ' alt="' + imageData[i].title + '"';
        }
        if (imageData[i].desc !== undefined && imageData[i].desc !== '') {
            desc = '<h3><a hidefocus="true" ' + aDescAttr + ' ><span>' + imageData[i].desc + '</span></a></h3>';
            barDesc = imageData[i].desc;
        }
        item = '<span class="item">' +
            '<a hidefocus="true" ' + aPicAttr + '>' +
            '<img data-url="' + imageData[i].src + '" ' + alt + ' style="width:' + config.width + 'px;height:' + config.height + 'px;" />' +
            '</a> ' + desc + '</span>';

        btn = '<span data-cid="' + i + '" data-title="' + barDesc + '"></span>';
        if (config.barType == '1') {
            btn = '<span data-cid="' + i + '" data-title="' + barDesc + '">' + (i + 1) + '</span>';
        }

        barButton.push(btn);
        contentBody.push(item);
    }
    if (contentBody.length > 0) {
        contentBody.push(contentBody[0]);
    }
    size = contentBody.length;
    if (!config.hiddenControl) {
        control = '<div class="' + config.bannerPrev + ' ' + config.switchStyle + '" style="display: none;"></div> ' +
            '<div class="' + config.bannerNext + ' ' + config.switchStyle + '" style="display: none;"></div> ';
    }
    if (!config.hiddenBar) {
        bar = '<div class="' + config.bannerBottom + '">' + barButton.join("") + '</div>';
    }
    content = '<div class="' + config.bannerBody + '">' + contentBody.join("") + '</div>' + control + bar;
    if (config.wideScreen){
        $banner.css({position:"absolute",width: "100%",left:'0',right:"0"}).after('<div style="height: '+config.height+'px;visibility: visible;"></div>');
        content = '<div style="position: relative;width:'+config.width+'px;height:'+config.height+'px;">' + content + '</div>';
    }
    $banner.html(content).css({width: config.width, height: config.height});
    //======= HTML 渲染结束 ========//

    var $bannerBody = $(config.banner + ' .' + config.bannerBody);
    var $bannerPrev = $(config.banner + ' .' + config.bannerPrev);
    var $bannerNext = $(config.banner + ' .' + config.bannerNext);
    var $bannerBottom = $(config.banner + ' .' + config.bannerBottom);

    /**
     * 初始化
     */
    $bannerBody.css({width: size * imageWidth, left: 0});
    for (var j = 0; j < size; j++) {
        if (j < index) {
            position = -(j * imageWidth);
        } else if (j > index) {
            position = j * imageWidth;
        } else {
            position = 0;
        }
        loadImage.push(false);
        $index = $bannerBody.find('.item').eq(j);
        !$index || $index.stop().css({left: position});
    }
    $bannerBottom.find('span').eq(0).addClass('active');
    load(0);
    load(size - 1);

    if (config.autoPlay) {
        autoShow();
    }
    $banner.hover(function () {
        $bannerPrev.css({display: "flex"});
        $bannerNext.css({display: "flex"});
        clearTimeout(t);
    }, function () {
        if (config.autoPlay) {
            autoShow();
        }
        $bannerPrev.css({display: "none"});
        $bannerNext.css({display: "none"});
    });

    /*
     * *****事件委托，点击下一张图片******
     * */
    $bannerNext.on("click", function () {
        NEXT();
    });

    /*
     * ********事件委托，上一张图片*******
     * */
    $bannerPrev.on("click", function () {
        LAST();
    });

    /*
     * ***** 事件委托，底部导航条点击
     * */
    $bannerBottom.find('span').on('click', function () {
        index = $(this).attr("data-cid");
        MOVE();
    });
    $bannerBottom.find('span').hover(function () {
        index = $(this).attr("data-cid");
        MOVE();
    }, function () {
        index = $(this).attr("data-cid");
        MOVE();
    });

    /*
     * ******自定义方法*****
     *
     */

    //图片懒加载
    function load(k) {
        k = k || index;
        if (loadImage[k] === true) {
            return;
        }
        var img = $bannerBody.find('.item').eq(k).find('img');
        Site.loadImage({img: img});
        loadImage[k] = true;
    }

    //图片自动播放
    function autoShow() {
        t = setInterval(function () {
            NEXT();
        }, config.interval);
    }

    /*
     * *******下一张图片
     * */
    function NEXT() {
        index++;
        if (index === size) {
            index = 1;
            $bannerBody.css({left: 0});
        }
        MOVE();
    }

    /*
     * ***上一张
     * */
    function LAST() {
        index--;
        if (index === -1) {
            index = size - 2;
            $bannerBody.css({left: -(size - 1) * imageWidth});
        }
        MOVE();
    }

    /**
     * 初始化
     */
    function MOVE() {
        updateBar();
        load();
        $bannerBody.stop().animate({left: -imageWidth * index}, config.animateTime);
        $bannerBody.find('.item').eq(index).removeClass('active').addClass('active').siblings().removeClass('active');
    }

    /**
     * 更新底部导航条
     */
    function updateBar() {
        var i = index
        if (index === (size - 1)) {
            i = 0;
        }
        !$bannerBottom.find('span').eq(i).removeClass('active').addClass('active').siblings().removeClass('active');
    }

};

/**
 * 动态锚点 平滑滚动
 * 通过 offsetTop 获取对象到窗体顶部的距离，然后赋值给 scrollTop，就能实现锚点的功能
 * 需要注意的是，各浏览器下获取 scrollTop 有所差异
 * 将总距离分成很多小段，然后每隔一段时间跳一段
 * @param {object} options {index:"xxx",selector:"xxx",type:true}
 */
Site.jump = function (options) {
    var _config = $.extend({index: 0, selector: ".jump-this", type: true}, options);
    var jump = document.querySelectorAll(_config.selector);
    // 获取需要滚动的距离
    var total = jump[index].offsetTop;
    var distance = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
    var step = total / 50;
    // 平滑滚动，时长500ms，每10ms一跳，共50跳
    if (_config.type !== true) {
        // Chrome
        document.body.scrollTop = total;
        // Firefox
        document.documentElement.scrollTop = total;
        // Safari
        window.pageYOffset = total;
    }
    if (total > distance) {
        smoothDown()
    } else {
        var newTotal = distance - total;
        step = newTotal / 50;
        smoothUp()
    }
    function smoothDown() {
        if (distance < total) {
            distance += step;
            document.body.scrollTop = distance;
            document.documentElement.scrollTop = distance;
            window.pageYOffset = distance;
            setTimeout(smoothDown, 10);
        } else {
            document.body.scrollTop = total;
            document.documentElement.scrollTop = total;
            window.pageYOffset = total
        }
    }

    function smoothUp() {
        if (distance > total) {
            distance -= step;
            document.body.scrollTop = distance;
            document.documentElement.scrollTop = distance;
            window.pageYOffset = distance;
            setTimeout(smoothUp, 10);
        } else {
            document.body.scrollTop = total;
            document.documentElement.scrollTop = total;
            window.pageYOffset = total
        }
    }
};

/**
 * 动态锚点 平滑滚动
 * 将总距离分成很多小段，然后每隔一段时间跳一段
 * @param {Number} distance
 */
Site.jumpAnimate = function (distance) {

};

/**
 * 鼠标滚动
 */
Site.srcoll = function () {

};

/**
 * 阻止浏览器冒泡事件
 */
Site.stopPropagation = function (event) {
    event.stopPropagation();
};

/**
 * 阻止浏览器默认事件
 */
Site.preventDefault = function (event) {
    event.preventDefault();
};

/**
 *
 * @param obj
 * @param type
 * @param func
 * @returns {Array}
 */
Site.addEvent = function (obj, type, func) {
    if (obj.addEventListener) {
        obj.addEventListener(type, func, false);
    } else if (obj.attachEvent) {
        obj.attachEvent('on' + type, func);
    }
};

/**
 * 获取元素的距离页面顶端的距离
 * @param element
 * @returns {String||Number}
 */
Site.offsetTop = function (element) {
    element = element || document.body;
    var that = $(element);
    return that.offset().top;
};

/**
 * 获取滚动条距离页面顶端的距离
 * @param element
 * @returns {String||Number}
 */
Site.scrollTop = function (element) {
    var scrollTop = 0;
    if (element === undefined){
        scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
    }else {
        scrollTop = $(element).scrollTop();
    }
    return scrollTop;
};

/**
 * 获取元素距离浏览器可见区域顶端的距离
 * @param element
 * @returns {String||Number}
 */
Site.clientTop = function (element) {
    element = element || document.body;
    var that = $(element);
    return that.scrollTop() - Site.offsetTop();
};

/**
 * 获取页面可见高度
 * @param element
 * @returns {String||Number}
 */
Site.clientHeight = function (element) {
    var _height = document.documentElement.clientHeight;//获取页面可见高度
    if (element !== undefined){
        _height = $(element).height();
    }
    return _height;
};

/**
 * 获取页面可见宽度
 * @param element
 * @returns {String||Number}
 */
Site.clientWidth = function (element) {
    var _width = document.documentElement.clientWidth;//获取页面可见宽度
    if (element !== undefined){
        _width = $(element).width();
    }
    return _width;
};

/**
 *
 * @param selecter
 * @param checked
 * @returns {Array}
 */
Site.getSelectCheckboxValues = function (selecter, checked) {
    selecter = selecter || '[lay-filter="selected"]';
    var values = [];
    if (checked === undefined || checked === true) {
        $('input' + selecter + ':checked').each(function () {
            values.push($(this).val());
        });
    } else {
        $('input' + selecter + ':not(:checked)').each(function () {
            values.push($(this).val());
        });
    }
    return values;
};

Site.getTab = function () {
    if (typeof top.window.getActive === 'function'){
        return top.window.getActive();
    }
};

Site.reLoad = function () {
    Site.getTab().location.reload();
};

/**
 *
 * @param str
 * @returns {*}
 */
Site.reconvert = function (str) {
    str = str.replace(/(\\u)(\w{4})/gi, function ($0) {
        return (String.fromCharCode(parseInt((escape($0).replace(/(%5Cu)(\w{4})/g, "$2")), 16)));
    });

    str = str.replace(/(&#x)(\w{4});/gi, function ($0) {
        return String.fromCharCode(parseInt(escape($0).replace(/(%26%23x)(\w{4})(%3B)/g, "$2"), 16));
    });
    return str;
};

$(function () {

    Site.init();

    if (typeof top.window.addTab === 'function') {
        $(document).on('click', '[lay-filter="url"]', function () {
            top.window.addTab(this);
        });
    }


    setTimeout(function () {
        $('[lay-filter="loading"]').each(function () {
            Site.imgLoading(this);
        });
    }, 200);

    window.addEventListener('popstate', function (e) {
        if (history.state) {
            var state = e.state;
            //do something(state.url, state.title);
        }
    }, false);

    Site.initPjax();

    Site.lazyLoadScroll();

    // Site.wait('Most people can not see this message, please share with us! <br> 【God is a girl, please treat her as a lover】');
});


function isArray(value) {
    return Object.prototype.toString.call(value) === "[object Array]";
}

function isFunction(value) {
    return Object.prototype.toString.call(value) === "[object Function]";
}

function isRegExp(value) {
    return Object.prototype.toString.call(value) === "[object RegExp]";
}

function isNativeJSON() {
    return window.JSON && Object.prototype.toString.call(JSON) === "[object JSON]";
}

/*
 定义类 时 需要注意 作用域 安全的构造函数
 不安全的因素：由于this是运行时分配，如使用 new 指令实例化类 this会指向 实例化对象；
 如果直接调用构造函数 那么 this 会指向全局 对象 window ，
 然后你的代码就会覆盖window原生的同名函数或属性，埋下bug;
 推荐使用安全方式编写类或函数
 */
function Helper(name) {
    if (this instanceof Helper) {
        this.name = name;
    } else {
        return new Helper(name);
    }
}

// 浏览器兼容函数编写规范
// 使用 call 或 apply 来继承
function X() {
    if (A) {
        A.call(X); // 如果存在A 让 X 继承 A
    } else if (B) {
        B.call(X); // 如果存在B 让 X 继承 B
    } else {
        throw new Error('no A or B');
    }
    return new X();
}

/*
 使用 Object.preventExtensions()  来声明 对象 是 不可扩展对象;
 var person = {name:'wdd'};
 undefined
 Object.preventExtensions(person);
 Object {name: "wdd"}
 person.age = 10;
 10
 person
 Object {name: "wdd"}
 Object.isExtensible(person);
 false
 */

/*
 密封对象 Object.seal 密封对象不可扩展，并且不能删除对象的属性或方法，但是属性值可以修改
 */

/*
 冰冻对象 Object.freeze 冰冻对象不可扩展，并且不能修改，只可访问
 */

/*
 函数节流 思想：某些代码不可以没有间断的连续重复执行 （即反复执行）
 */
var processor = {
    timeoutId: null,
    //实际进行处理的方法
    performProcessing: function () {
        console.log('重复执行中...');
    },
    //初始化调用方法
    process: function () {
        clearTimeout(this.timeoutId);
        var that = this;
        this.timeoutId = setTimeout(function () {
            that.performProcessing();
        }, 100);
    }
};

//尝试开启执行
// processor.process();

/*
 text 转 数组
 */
function toArray(data) {
    return eval('(' + data + ')');
};
/*
 中央定时器
 */

var timers = {
    timerId: 0,
    timers: [],
    add: function (fn) {
        this.timers.push(fn);
    },
    start: function () {
        if (this.timerId) {
            return;
        }
        (function runNext() {
            if (timers.timers.length > 0) {
                for (var i = 0; i < timers.timers.length; i++) {
                    if (timers.timers[i]() === false) {
                        timers.timers.splice(i, 1);
                        i--;
                    }
                }
                timers.timerId = setTimeout(runNext, 16);
            }
        })();
    }
};

/*
 AJAX 进度条
 */

function progress() {
    var myXhr = $.ajaxSettings.xhr();
    if (myXhr.upload) {
        myXhr.upload.addEventListener('progress', function (e) {
            if (e.lengthComputable) {
                $('progress').attr({
                    value: e.loaded,
                    max: e.total,
                });
            }
        }, false);
    }
    return myXhr;
}

/*
 AJAX 进度条
 */
function ajaxJump(url, _Callback) {
    $.ajax({
        url: url,
        dataType: 'jsonp',
        processData: false,
        type: 'get',
        jsonpCallback: _Callback,
        success: function (data) {
           console.log(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest.status);
            console.log(XMLHttpRequest.readyState);
            console.log(textStatus);
        }
    });
}

/*
 类型
 */
// console.log(typeof undefined); //输出 undefined
// console.log(typeof null); //输出 object
// console.log(typeof true); //输出 boolean
// console.log(typeof 42); //输出 number
// console.log(typeof "42du"); //输出 string
// console.log(typeof new Object()); //输出 object
// console.log(typeof function(){}); //输出 function

//
//        layer.open({
//            type: 2,
//            content: 'http://www.alivehouse.com/manage',
//            success: function(layero, index){
//                // 在父窗口中获取iframe中的元素
//                // 格式 $("#iframe的ID").contents().find("#iframe中的控件ID")
//                // 格式 $('#父窗口中的元素ID', parent.document)
////                $('#'+ doms[0] + index).find('iframe').contents().find(selector);
//                var body = layer.getChildFrame('body', index); //当你试图在当前页获取iframe页的DOM元素时，你可以用此方法。selector即iframe页的选择器
//                var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：
//                var _index = layer.getFrameIndex(iframeWin.name);  //重新获取iframe索引
////                layer.iframeAuto(index); // 指定iframe层自适应 ，调用该方法时，iframe层的高度会重新进行适应
////                layer.iframeSrc(index, url) //重置特定iframe url
////                layer.setTop(layero); //置顶当前窗口
////                layer.title(name, index); // 改变title
////                layer.full(index);  //全屏
////                layer.min(index);  //最小化
////                layer.restore(index)  //还原
//            }
//        });



