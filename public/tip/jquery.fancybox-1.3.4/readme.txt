好用的jquery图片播放插件Fancybox使用方法

上次给大家介绍了一款简易的jquery图片播放插件LightBox的使用方法，没看过的朋友可以去看看，配置十分简单，也很好用。今天给大家介绍的jquery图片播放插件叫Fancybox，相比LightBox来说，Fancybox相对庞大点，配置也更丰富一些，相信你会喜欢的。

Fancybox的特点如下：
        可以支持图片、html文本、flash动画、iframe以及ajax的支持

        可以自定义播放器的CSS样式

        可以以组的形式进行播放

        如果将鼠标滚动插件（mouse wheel plugin）包含进来的话Fancybox还能支持鼠标滚轮滚动来翻阅图片

        Fancybox播放器支持投影，更有立体的感觉

Fancybox使用方法：
1、引入jquery核心库和Fancybox插件库

1
2
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
可选 - 如果需要用到fancy transition（一些动画效果）你还需要引入以下脚本

1
<script type="text/javascript" src="/fancybox/jquery.easing-1.4.pack.js"></script>
可选 - 如果需要支持鼠标滚轮滚动效果你还需要引入以下脚本

1
<script type="text/javascript" src="/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
2、添加样式表文件

1
<link rel="stylesheet" href="/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
3、在页面上创建链接元素

A、图片元素

1
<a id="single_image" href="image_big.jpg"><img src="image_small.jpg" alt=""/></a>
B、普通文本

<a id="inline" href="#data">This shows content of element who has id="data"</a> 
<div style="display:none">
    <div id="data">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>
</div>
C、Iframe

1
<a href="http://www.example?iframe">This goes to iframe</a>
或者

1
<a class="iframe" href="http://www.example">This goes to iframe</a>
D、Ajax

1
<a href="http://www.example/data.php">This takes content using ajax</a>
如果你要显示描述信息，可以在链接上加上title，将描述信息放到title中。

4、最终的jquery初始化代码

$(document).ready(function() {
    /* 最基本的，使用了默认配置 */   
    $("a#single_image").fancybox();    
    /* 使用了自定义配置 */    
    $("a#inline").fancybox({
        'hideOnContentClick': true
    });
    /* 一下配置支持组播放 */  
    $("a.group").fancybox({
        'transitionIn'  :   'elastic',
        'transitionOut' :   'elastic',
        'speedIn'       :   600, 
        'speedOut'      :   200, 
        'overlayShow'   :   false
    });    
});
用rel标签来创建相册

<a class="grouped_elements" rel="group1" href="image_big_1.jpg"><img src="image_small_1.jpg" alt=""/></a>
<a class="grouped_elements" rel="group1" href="image_big_2.jpg"><img src="image_small_2.jpg" alt=""/></a>     
<a class="grouped_elements" rel="group2" href="image_big_3.jpg"><img src="image_small_3.jpg" alt=""/></a> 
<a class="grouped_elements" rel="group2" href="image_big_4.jpg"><img src="image_small_4.jpg" alt=""/></a> 
$("a.grouped_elements").fancybox();