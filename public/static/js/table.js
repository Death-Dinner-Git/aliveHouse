/**
 * table 组件
 * @description 基于laytpl 、laypage、layer 封装的组件
 */
layui.define(['layer', 'form'], function (exports) {
    "use strict";
    var $ = layui.jquery,
        layer = parent.layui.layer === undefined ? layui.layer : parent.layui.layer,
        form = layui.form;

    var Table = function () {
        this.config = {
            type: '1', //表格数据显示方式  可选值 1 或 2 ；1 为 选择确定，2为 滚动显示 ; 默认是 1
            elem: undefined, //表格容器
            toggleElem: undefined, //触发容器
            title: [], // 列标题 数组  为空自动读取
            max:8, // 表格最多显示列数 默认是 8 列
            success: undefined, //type:function
            fail: function (msg) { layer.msg(msg, { icon: 2 }); }, //type:function
            complete: undefined //type:function
        };
    };
    /**
     * 版本号
     */
    Table.prototype.v = '1.0.0';

    /**
     * 设置
     * @param {Object} options
     */
    Table.prototype.set = function (options) {
        var that = this;
        $.extend(true, that.config, options);
        return that;
    };
    /**
     * 初始化
     * @param {Object} options
     */
    Table.prototype.init = function (options) {
        var that = this;
        $.extend(true, that.config, options);
        var _config = that.config;
        if ($(_config.elem).length === 0) {
            throwError('Table Error:找不到配置的容器elem!');
        }
        if ($(_config.toggleElem).length === 0) {
            throwError('Table Error:找不到配置的容器toggleElem!');
        }
        that.render();
        return that;
    };
    /**
     * 渲染
     * @param {Object} options
     */
    Table.prototype.render = function (options) {
        var that = this;
        $.extend(true, that.config, options);
        var _config = that.config;
        var $parent = $(_config.elem), $toggle = $(_config.toggleElem);
        if (_config.type !== 2){

        }else {

        }

    };
    /**
     * 抛出一个异常错误信息
     * @param {String} msg
     */
    function throwError(msg) {
        layer.msg(msg);
    }

    var table = new Table();
    exports('table', function (options) {
        return table.set(options);
    });
});