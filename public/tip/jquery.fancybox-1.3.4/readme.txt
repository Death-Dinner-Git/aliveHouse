���õ�jqueryͼƬ���Ų��Fancyboxʹ�÷���

�ϴθ���ҽ�����һ����׵�jqueryͼƬ���Ų��LightBox��ʹ�÷�����û���������ѿ���ȥ����������ʮ�ּ򵥣�Ҳ�ܺ��á��������ҽ��ܵ�jqueryͼƬ���Ų����Fancybox�����LightBox��˵��Fancybox����Ӵ�㣬����Ҳ���ḻһЩ���������ϲ���ġ�

Fancybox���ص����£�
        ����֧��ͼƬ��html�ı���flash������iframe�Լ�ajax��֧��

        �����Զ��岥������CSS��ʽ

        �����������ʽ���в���

        ����������������mouse wheel plugin�����������Ļ�Fancybox����֧�������ֹ���������ͼƬ

        Fancybox������֧��ͶӰ����������ĸо�

Fancyboxʹ�÷�����
1������jquery���Ŀ��Fancybox�����

1
2
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
��ѡ - �����Ҫ�õ�fancy transition��һЩ����Ч�����㻹��Ҫ�������½ű�

1
<script type="text/javascript" src="/fancybox/jquery.easing-1.4.pack.js"></script>
��ѡ - �����Ҫ֧�������ֹ���Ч���㻹��Ҫ�������½ű�

1
<script type="text/javascript" src="/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
2�������ʽ���ļ�

1
<link rel="stylesheet" href="/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
3����ҳ���ϴ�������Ԫ��

A��ͼƬԪ��

1
<a id="single_image" href="image_big.jpg"><img src="image_small.jpg" alt=""/></a>
B����ͨ�ı�

<a id="inline" href="#data">This shows content of element who has id="data"</a> 
<div style="display:none">
    <div id="data">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>
</div>
C��Iframe

1
<a href="http://www.example?iframe">This goes to iframe</a>
����

1
<a class="iframe" href="http://www.example">This goes to iframe</a>
D��Ajax

1
<a href="http://www.example/data.php">This takes content using ajax</a>
�����Ҫ��ʾ������Ϣ�������������ϼ���title����������Ϣ�ŵ�title�С�

4�����յ�jquery��ʼ������

$(document).ready(function() {
    /* ������ģ�ʹ����Ĭ������ */   
    $("a#single_image").fancybox();    
    /* ʹ�����Զ������� */    
    $("a#inline").fancybox({
        'hideOnContentClick': true
    });
    /* һ������֧���鲥�� */  
    $("a.group").fancybox({
        'transitionIn'  :   'elastic',
        'transitionOut' :   'elastic',
        'speedIn'       :   600, 
        'speedOut'      :   200, 
        'overlayShow'   :   false
    });    
});
��rel��ǩ���������

<a class="grouped_elements" rel="group1" href="image_big_1.jpg"><img src="image_small_1.jpg" alt=""/></a>
<a class="grouped_elements" rel="group1" href="image_big_2.jpg"><img src="image_small_2.jpg" alt=""/></a>     
<a class="grouped_elements" rel="group2" href="image_big_3.jpg"><img src="image_small_3.jpg" alt=""/></a> 
<a class="grouped_elements" rel="group2" href="image_big_4.jpg"><img src="image_small_4.jpg" alt=""/></a> 
$("a.grouped_elements").fancybox();