�����ļ�����ʱ�䣺2016-08-19���޸Ĺ������õ�ַ���ܷ������⣩

jQuery File Upload ��һ��JqueryͼƬ�ϴ������֧�ֶ��ļ��ϴ���ȡ����ɾ�����ϴ�ǰ����ͼԤ�����б���ʾͼƬ��С��֧���ϴ���������ʾ��֧�ָ��ֶ�̬���Կ����ķ������ˡ�

jQuery File Upload�ж���ļ�ѡ���Ϸ��ϴ��ؼ��Ϸ�֧�֣�����������֤��Ԥ��ͼ����Ƶ����Ƶ ��

֧�ֿ��򣬷ֿ�Ϳɻָ����ļ��ϴ��Ϳͻ���ͼ���С�������������κη�������ƽ̨��PHP, Python, Ruby on Rails, Java, Node.js, Go etc.�� ��֧�ֱ�׼��HTML���ļ��ϴ���

��Ʒ�ص�

���ļ��ϴ���
����ѡ�����ļ�һ�Σ��������ϴ�ͬʱ���С�

�Ϸ�֧�֣�

���Դ�����������ļ����������Ϸ�����������������������ϴ��ļ���

�ϴ���������

��ʾһ����������ʾΪ�������ļ��������ϴ�����ϴ����ȡ�

��ȡ���ϴ���

�����ļ��ϴ�����ȡ����ֹͣ�ϴ����ȡ�

�ɻָ��ϴ���

��ֹ���ϴ������������֧�ֵ�Blob API���лָ���

�ֿ��ϴ���

���ļ������ϴ���С�Ŀ��������֧�ֵ�Blob��API ��

�ͻ���ͼ���С������

ͼ������Զ�������С�Ŀͻ����������֧�������JS API�ġ�

Ԥ��ͼ����Ƶ����Ƶ��

ͼ����Ƶ����Ƶ�ļ���Ԥ�������������֧�������API�ϴ�ǰ��ʾ��

û����������������ʹ��Adobe��Flash ��Ҫ��

��ʵ���ǻ��ڿ��ŵı�׼����HTML5��JavaScript�ģ�����Ҫ���������������

�����ĺ󱸾ɰ���������

���֧�ֵĻ���ʹ������ҳ����Ϊ�󱸾ɰ������ͨ����XMLHttpRequest�ϴ��ļ���

HTML�ļ��ϴ������ˣ�

ͨ��ʹ�ñ�׼��HTML�ļ��ϴ����Ŀؼ�Ԫ����������ǿ��

��վ����ļ��ϴ���

֧���ϴ��ļ�����ͬ�������վ���XMLHttpRequest��iframe�ض���

������ʵ����

����ʹ����ͬһ����ҳ�ϵĶ�����ʵ����

�ɶ��ƺͿ���չ�ģ�

�ṩ��һ��API�����ø���ѡ�������ص������ĸ������¼���

���غ��ļ��������ϴ���

�ļ����Ա��ϴ�Ϊ��׼�ġ��ಿ��/��������ݡ����ļ��������� HTTP PUT�ļ��ϴ��� ��

�����κη�������Ӧ��ƽ̨��

�������κη�������ƽ̨��PHP, Python, Ruby on Rails, Java, Node.js, Go etc.�� ��֧�ֱ�׼��HTML���ļ��ϴ���

�÷�
����ѹ��������ѹ����վ�Ϳ��ã���demo��һ����PHP��������

��С����װ�򵼣���������Ҫ�Լ��������Ԫ�ص�ͯЬ����

��Ҫһ��inputԪ�أ�<input id="fileupload" type="file" name="file[]" multiple>

��Ҫ���ص�js�ļ���:

jquey-1.8.3.min.js

jquery-ui-widget.js

jquery.iframe-transport.js

jquery.fileupload.js

�������ӣ�ժ�Թٷ�����

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
��С��װ�����ʾ�ϴ���������

���֧����ʾÿ���ļ����ϴ�����(progress)��ʾ�������ļ��������ϴ�����(progressall)��ʾ��


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
��Ҫһ��<div>����������ʾ����

<div id="progress">
    <div class="bar" style="width: 0%;"></div>
</div>
��Ҫ����������ͬ��ɫ��ʾ���У�����ͨ��CSS�����ã�


.bar {
    height: 18px;
    background: green;
}
��Ҫ�ϴ����ļ�����ʾ��һ��Ԫ�ؽڵ��ϣ�

����Ծ���Ҫ���ϴ����ļ���ʾ���ض���Ԫ���ϣ��������ͨ��add�ص�������ʵ�֣�

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
���ͨ�������ť����ʼ�ϴ���

�����������ϣ�����ͨ����ť����¼��������ϴ����������Զ��ϴ�����


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
