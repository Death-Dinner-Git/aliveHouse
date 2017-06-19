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
    layuiBase:'/static/js/',
    initComponents:['jquery', 'element', 'layer', 'form', 'flow','laydate'],
    allComponents:['jquery', 'element', 'layer', 'util', 'form', 'code', 'laydate', 'flow', 'layedit', 'upload','laypage']
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
        base:config.layuiBase
    }).use(config.initComponents, function () {
        window.jQuery = window.$ = layui.jquery;
        window.element = element = layui.element;
        window.layer = layer = layui.layer;
        window.form = form = layui.form;
        window.flow = flow = layui.flow;
        window.laydate = laydate = layui.laydate;
        if (typeof $ === "undefined"){
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
Site.getModule = function (name,parentWin) {
    var module;

    switch (name){
        case 'jquery':{
            module = top.window.jQuery ? top.window.jQuery : (window.jQuery ? window.jQuery : (jQuery ? jQuery : layui.jQuery ) );
        }break;
        case 'element':{
            module = top.window.element ? top.window.element : (window.element ? window.element : (element ? element : layui.element ) );
            if (typeof module === 'function'){
                module = module();
            }
        }break;
        case 'layer':{
            if (parentWin === false){
                module = layui.layer ? layui.layer : (layer ? layer : (window.layer ? window.layer : top.window.layer ));
            }else {
                module = top.window.layer ? top.window.layer : (window.layer ? window.layer : (layer ? layer : layui.layer ));
            }
        }break;
        case 'form':{
            module = window.form ? window.form : (form ? form : layui.form );
            if (!module){
                layui.use(['form'], function(){
                    module = layui.form;
                });
            }
        }break;
        case 'laydate':{
            module = top.window.laydate ? top.window.laydate : (window.laydate ? window.laydate : (laydate ? laydate : layui.laydate ) );
        }break;
        case 'flow':{
            module = top.window.flow ? top.window.flow : (window.flow ? window.flow : (flow ? flow : layui.flow )  );
        }break;
        default:{
        }break;
    }

    return module;
};

/*  */
Site.getUtil = function (callback,component) {
    if (util !== undefined){
        if (typeof callback === 'function'){
            callback(util);
        }
    }else {
        if (!component){
            component.push('util');
        }else {
            component = 'util';
        }
        layui.config({
            base:config.layuiBase
        }).use(component, function () {
            window.util = util = layui.util;
            if (typeof callback === 'function'){
                callback(util);
            }
        });
    }
};

/*  */
Site.getCoder = function (component,callback) {
    if (code !== undefined){
        if (typeof callback === 'function'){
            callback(code);
        }
    }else {
        layui.config({
            base:config.layuiBase
        }).use(component, function () {
            window.code = code = layui.code;
            if (typeof callback === 'function'){
                callback(code);
            }
        });
    }
};

/*  */
Site.getLayEditor = function (component,callback) {
    if (layedit !== undefined){
        if (typeof callback === 'function'){
            callback(layedit);
        }
    }else {
        layui.config({
            base:config.layuiBase
        }).use(component, function () {
            window.layedit = layedit = layui.layedit;
            if (typeof callback === 'function'){
                callback(layedit);
            }
        });
    }
};

/*  */
Site.getUploader = function (component,callback) {
    if (upload !== undefined){
        if (typeof callback === 'function'){
            callback(upload);
        }
    }else {
        layui.config({
            base:config.layuiBase
        }).use(component, function () {
            window.upload = upload = layui.upload;
            if (typeof callback === 'function'){
                callback(upload);
            }
        });
    }
};

/*  */
Site.getLayPager = function (callback) {
    if (laypage !== undefined){
        if (typeof callback === 'function'){
            callback(laypage);
        }
    }else {
        layui.config({
            base:config.layuiBase
        }).use('laypage', function () {
            window.laypage = laypage = layui.laypage;
            if (typeof callback === 'function'){
                callback(laypage);
            }
        });
    }
};

/*  */
Site.loadScript =  function (url) {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = url;
    document.body.appendChild(script);
};

/*  */
Site.showUrl =  function (title, url, width, height, type, maxmin, ele, shade, scroll, shadeClose, refresh) {
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
        scroll = scroll === true ? 'yes' : 'no';
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
    myLayer.open({
        type: type,
        area: [width, height],
        maxmin: maxmin,
        shade: shade,
        shadeClose: shadeClose,
        refresh: refresh,
        id: ele,
        title: '<p style="text-align: center;">' + title + '</p>',
        content: content
    });
};

/*  */
Site.msg =  function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    myLayer.msg(content, {time: 2000});
};

/*  */
Site.wait =  function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    if (!content) {
        content = "请稍后....";
    }
    myLayer.msg(content, {shade: 0.3, time: 10000});
};

/*  */
Site.loading =  function (icon) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    icon = icon || 1;
    myLayer.load(icon, {type: 3, icon: icon, shade: 0.3});
};

/*  */
Site.load =  function (url, content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    if (!content) {
        content = "加载中....";
    }

    myLayer.msg(content, {shade: 0.3, time: 1000});
    setTimeout(function () {
        window.location.href = url;
    }, 1000);
};

/*  */
Site.loadFrame =  function (title, url, width, height, ele, btn) {
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
    myLayer.open({
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
Site.hide =  function () {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    myLayer.closeAll();
    if (window.layer){
        window.layer.closeAll();
    }
};

/*  */
Site.error =  function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    myLayer.msg(content, {icon: 2, time: 2000});
};

/*  */
Site.success =  function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    myLayer.msg(content, {icon: 1, time: 2000});
};

/*  */
Site.tip =  function (content) {
    var myLayer = Site.getModule('layer');
    if (!myLayer) {
        myLayer = layer;
    }
    myLayer.msg(content, {icon: 0, time: 2000});
};

/* 确认对话框 */
Site.confirm =  function (url, msg, width, height, shade) {
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
    myLayer.open({
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
Site.showDialog =  function (title, msg, callBack, width, height, shade) {
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
    myLayer.open({
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
Site.tab =  function (options, parentWin, width, height, shade) {
    parentWin = parentWin || true;
    var myLayer = Site.getModule('layer',parentWin);
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
    myLayer.tab({
        area: [width, height],
        shade: shade,
        shadeClose: true,
        tab: options
    });
};

/*  */
Site.imgLoading =  function (ele) {
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
Site.photos =  function (type, target, json, parentWin, width, height, shade) {
    parentWin = parentWin || true;
    var myLayer = Site.getModule('layer',parentWin);
    if (!myLayer) {
        myLayer = layer;
    }

    type = type || '1';
    width = width || config.width.min;
    height = height || config.height.min;
    if (shade === true) {
        shade = config.shade;
    }
    shade = shade || config.shade;

    if (parseInt(type) === '1') {
        $.ajax({
            type: "post",
            url: target,
            dataType: 'json',
            beforeSend: function () {
                loading();
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

                setTimeout(hide(), 500);
                myLayer.photos({
                    photos: data,
                    tab: function (pic, layero) {
                        console.log(pic) //当前图片的一些信息
                    },
                    anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
                });
            },
            error: function (data) {
                hide();
                error('加载失败', true);
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

        myLayer.photos({
            photos: target,
            area: [width, height],
            shade: shade,
            shadeClose: true,
            tab: function (pic, layero) {
                console.log(pic) //当前图片的一些信息
            },
            anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
        });

    }
};

/*  */
Site.resizeShowTab =  function () {
    if (window.parent) {
        window.parent.$(".layui-show").find("iframe").load();
    }
    else {
        $(".layui-show").find("iframe").load();
    }
};

/*  */
Site.getUrlParam =  function (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};

/*  */
Site.pjax =  function (_url, _type, _data, _dataType, _beforeSend, _success, _error) {
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
Site.initPjax =  function () {
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
Site.addPjax =  function (selector, container, options) {
    if ($.support.pjax) {
        $(document).pjax(selector, container, options);
    }
};

/*  */
Site.loadPage =  function (pageElement,total) {
    Site.getLayPager(function () {
        var laypage = layui.laypage;
        total = total || true;
        pageElement = pageElement || 'paging_0124';
        var _page = $('#'+pageElement),
            currPage = Site.getUrlParam('pageNumber'),
            count = _page.attr('data-count'),
            pages = _page.attr('data-pages');
        currPage = currPage > 1 ? currPage : 1;
        count = count ? count : 0;
        _page.attr('data-page',currPage);
        laypage({
            curr:currPage,
            cont: pageElement,
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
                if (total){
                    _page.prepend('<span class="dinner-page-total"> 数量: '+(count)+' </span>');
                }
            }
        });
    });
};

/*  */
Site.initBanner = function (data, options) {
    if (data === undefined || data.length <= 0){
        return;
    }
    var $default = {
        banner:"#webBanner",
        bannerBody:"bannerBody",
        bannerPrev:"bannerPrev",
        bannerNext:"bannerNext",
        switchStyle:"switchBtn",
        bannerBottom:"bannerBottom",
        height:"0",
        width:"0",
        playTime:"4000",
        animateTime:"1500",
        btnType:"1",
        targetType:"2",
        wideScreen:false
    };
    var config = $.extend($default,options),index = 1,t,num = data.length,content='',bottom='';
    var $banner = $(config.banner);
    //没有容器，中断
    if ($banner.length <=0){
        return;
    }
    if (config.wideScreen){
        config.width = _width;
        config.height = _height;
    }else{
        var width = $banner.width();
        var height = $banner.height();
        if (config.width<=0){
            config.width = width > 0 ? width : _width;
        }
        if (config.height <= 0){
            config.height = height > 0 ? height : config.width/1200*400 ;
        }
    }

    //渲染HTML
    for (var i=0;i<num;i++){
        var aPicAttr='',aDescAttr='',alt='',desc='',btnIndex='';
        if (data[i].target !== undefined){
            if (config.targetType == '2'){
                aPicAttr = ' target="_blank" href="'+ data[i].target +'"';
                aDescAttr = ' target="_blank" href="'+ data[i].target +'"';
            }else if (config.targetType == '1'){
                aPicAttr = ' target="_blank" href="'+ data[i].target +'"';
            }
        }
        if (data[i].title !== undefined){
            alt = ' alt="'+ data[i].title +'"';
        }
        if (data[i].desc !== undefined){
            desc = '<a hidefocus="true" '+aDescAttr+'><h>'+ data[i].desc +'</h></a> ';
        }
        content += '<span class="item">' +
            '<a hidefocus="true" '+aPicAttr+'>' +
            '<img src="'+data[i].src+'" '+alt+' style="width:'+config.width+'px;height:'+config.height+'px;" />' +
            '</a> ' + desc + '</span>';

        if (config.btnType == '1'){
            btnIndex = (i+1);
        }
        bottom += '<span>'+btnIndex+'</span>';
    }

    content = '<div class="'+config.bannerBody+'">'+content+'</div>' +
        '<div class="'+config.bannerPrev+ ' ' +config.switchStyle +'"></div> ' +
        '<div class="'+config.bannerNext+ ' ' +config.switchStyle +'"></div> ' +
        '<div class="'+ config.bannerBottom +'">'+bottom+'</div>';

    $banner.html(content).css({width:config.width,height:config.height});
    var $bannerBody = $(config.banner+' .'+config.bannerBody);
    var $bannerPrev = $(config.banner+' .'+config.bannerPrev);
    var $bannerNext = $(config.banner+' .'+config.bannerNext);
    var $bannerBottom = $(config.banner+' .'+config.bannerBottom);

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

    // Site.wait('Most people can not see this message, please share with us! <br> 【God is a girl, please treat her as a lover】');
});



