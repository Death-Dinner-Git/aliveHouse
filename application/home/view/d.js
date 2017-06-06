(function (FUN, undefined) {
    var list = [];
    FUN.run = function () {
        if (arguments.length < 1) {
            throw new Error("jzUtils.run 参数错误");
            return
        }
        var name = arguments[0].name,
            callMethod = arguments[0].callMethod || false,
            prompt = arguments[0].prompt || false,
            promptMsg = arguments[0].promptMsg || "功能还在加载中，请稍候",
            base = arguments[0].base || (window.Fai && Fai.top.Site) || top.Site || window,
            args = Array.prototype.slice.call(arguments),
            funcArgs = args.slice(1),
            callbackFunc = {},
            result;
        result = checkMethod(name, base);
        if (result.success) {
            callMethod = false;
            try {
                result.func.apply(result.func, funcArgs)
            } catch (e) {
                console && console.log && console.log("错误:name=" + e.name + "; message=" + e.message)
            }
        } else {
            if (prompt) {
                window.Fai && Fai.ing(promptMsg, true)
            }
        }
        if (callMethod) {
            callbackFunc.name = name;
            callbackFunc.base = base;
            callbackFunc.args = funcArgs;
            list.push(callbackFunc)
        }
    };
    FUN.trigger = function (option) {
        if (typeof option !== "object") {
            throw new Error("jzUtils.trigger 参数错误");
            return
        }
        var funcName = option.name || "",
            base = option.base || (window.Fai && Fai.top.Site) || top.Site || window,
            newList = [],
            result,
            func,
            i,
            param;
        if (funcName.length < 1) {
            return
        }
        for (i = 0; i < list.length; i++) {
            param = list[i];
            if (param.name == funcName) {
                result = checkMethod(funcName, base);
                if (result.success) {
                    try {
                        result.func.apply(result.func, param.args)
                    } catch (e) {
                        console && console.log && console.log("错误:name=" + e.name + "; message=" + e.message)
                    }
                }
            } else {
                newList.push(param)
            }
        }
        list = newList
    };
    function checkMethod(funcName, base) {
        var methodList = funcName.split("."), readyFunc = base, result = {
            "success": true, "func": function () {
            }
        }, methodName, i;
        for (i = 0; i < methodList.length; i++) {
            methodName = methodList[i];
            if (methodName in readyFunc) {
                readyFunc = readyFunc[methodName]
            } else {
                result.success = false;
                return result
            }
        }
        result.func = readyFunc;
        return result
    }
})(window.jzUtils || (window.jzUtils = {}))
var _faiAjax = function () {
    //for regexp
    var r = /\?/;
    var _o = {
        type: "get",
        url: "",
        data: "",
        error: function () {
        },
        success: function () {
        }
    };
    var _sendRequest = function (o) {
        var xmlhttp = null;
        //init option code
        o.type = o.type || _o.type;
        o.url = o.url || _o.url;
        o.data = o.data || _o.data;
        o.error = o.error || _o.error;
        o.success = o.success || _o.success;
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //the instructions param takes the form of an eval statement
        if (o.type != "post") {
            o.url += ( this.r.test(o.url) ? "&" : "?" ) + o.data;
            xmlhttp.open("GET", o.url, true);
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    o.success(xmlhttp.responseText);
                } else if (o.error) {
                    o.error();
                }
            }
            xmlhttp.send();
        } else {
            xmlhttp.open("POST", o.url, true);
            //Send the proper header information along with the request
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    o.success(xmlhttp.responseText);
                } else {
                    o.error();
                }
            }
            xmlhttp.send(o.data);
        }
    }
    return {
        ajax: function (option) {
            try {
                //此次调用的错误不让抛出给window。防止函数重入
                _sendRequest(option);
            } catch (e) {
                //alert(e);
            }
        }
    };
}();