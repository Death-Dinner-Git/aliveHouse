/*!
 * Config.js
 * URL:http://
 * Only for Guest mode
 * Sort as
 * 		Utils/ModuleFunction/Other Global InitFunction
 */

if (typeof Config === "undefined") {
    Config = {
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
}
