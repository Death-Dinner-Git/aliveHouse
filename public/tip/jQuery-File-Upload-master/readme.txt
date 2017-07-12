下载文件更新时间：2016-08-19（修改官网调用地址不能访问问题）

jQuery File Upload 是一个Jquery图片上传组件，支持多文件上传、取消、删除，上传前缩略图预览、列表显示图片大小，支持上传进度条显示；支持各种动态语言开发的服务器端。

jQuery File Upload有多个文件选择，拖放上传控件拖放支持，进度条，验证和预览图像，音频和视频 。

支持跨域，分块和可恢复的文件上传和客户端图像大小调整。适用于任何服务器端平台（PHP, Python, Ruby on Rails, Java, Node.js, Go etc.） ，支持标准的HTML表单文件上传。

产品特点

多文件上传：
允许选择多个文件一次，并将其上传同时进行。

拖放支持：

可以从您的桌面或文件管理器中拖放他们在您的浏览器窗口中上传文件。

上传进度条：

显示一个进度条显示为单独的文件和所有上传组合上传进度。

可取消上传：

单个文件上传可以取消来停止上传进度。

可恢复上传：

中止的上传可以与浏览器支持的Blob API进行恢复。

分块上传：

大文件可以上传较小的块与浏览器支持的Blob的API 。

客户端图像大小调整：

图像可以自动调整大小的客户端与浏览器支持所需的JS API的。

预览图像，音频和视频：

图像，音频和视频文件的预览可以与浏览器支持所需的API上传前显示。

没有浏览器插件（例如使用Adobe的Flash ）要求：

该实现是基于开放的标准，如HTML5和JavaScript的，不需要额外的浏览器插件。

优美的后备旧版的浏览器：

如果支持的话，使用内置页框作为后备旧版浏览器通过的XMLHttpRequest上传文件。

HTML文件上传表单回退：

通过使用标准的HTML文件上传表单的控件元素允许渐进增强。

跨站点的文件上传：

支持上传文件到不同的域与跨站点的XMLHttpRequest或iframe重定向。

多个插件实例：

允许使用在同一个网页上的多个插件实例。

可定制和可扩展的：

提供了一个API来设置各个选项，并定义回调方法的各种载事件。

多重和文件内容流上传：

文件可以被上传为标准的“多部分/窗体的数据”或文件内容流（ HTTP PUT文件上传） 。

兼容任何服务器端应用平台：

适用于任何服务器端平台（PHP, Python, Ruby on Rails, Java, Node.js, Go etc.） ，支持标准的HTML表单文件上传。

用法
下载压缩包，解压到网站就可用（与demo）一样（PHP环境）。

最小化安装向导（适用于需要自己定义界面元素的童鞋）：

需要一个input元素：<input id="fileupload" type="file" name="file[]" multiple>

需要加载的js文件有:

jquey-1.8.3.min.js

jquery-ui-widget.js

jquery.iframe-transport.js

jquery.fileupload.js

代码例子（摘自官方）：

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>jQuery File Upload Example</title>
</head>
<body>
<input id="fileupload" type="file" name="files[]" data-url="server/php/" multiple>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/vendor/jquery.ui.widget.js"></script>
<script src="js/jquery.iframe-transport.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script>
$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo(document.body);
            });
        }
    });
});
</script>
</body> 
</html>
最小安装如何显示上传进度条：

插件支持显示每个文件的上传进度(progress)显示和所有文件的总体上传进度(progressall)显示：


$('#fileupload').fileupload({
    /* ... */
    progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css(
            'width',
            progress + '%'
        );
    }
});
需要一个<div>容器用来显示进：

<div id="progress">
    <div class="bar" style="width: 0%;"></div>
</div>
需要给进度条不同颜色显示才行，可以通过CSS来设置：


.bar {
    height: 18px;
    background: green;
}
将要上传的文件名显示在一个元素节点上：

你可以经常要将上传的文件显示到特定的元素上，这个可以通过add回调函数来实现：

$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        add: function (e, data) {
            data.context = $('<p/>').text('Uploading...').appendTo(document.body);
            data.submit();
        },
        done: function (e, data) {
            data.context.text('Upload finished.');
        }
    });
});
如何通过点击按钮来开始上传：

在上例基础上，可以通过按钮点击事件来触发上传（上例是自动上传）：


$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        add: function (e, data) {
            data.context = $('<button/>').text('Upload')
                .appendTo(document.body)
                .click(function () {
                    $(this).replaceWith($('<p/>').text('Uploading...'));
                    data.submit();
                });
        },
        done: function (e, data) {
            data.context.text('Upload finished.');
        }
    });
});
