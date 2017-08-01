/** layui-v1.0.9_rls MIT License By http://www.layui.com */
;layui.define("layer", function (e) {
    "use strict";
    var t = layui.jquery, i = layui.layer, a = layui.hint(), n = layui.device(), l = "form", o = ".layui-form",
        s = "layui-this", d = "layui-hide", r = "layui-disabled", c = function () {
            this.config = {
                verify: {
                    required: [/[\S]+/, "必填项不能为空"],
                    phone: [/^1\d{10}$/, "请输入正确的手机号"],
                    email: [/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, "邮箱格式不正确"],
                    url: [/(^#)|(^http(s*):\/\/[^\s]+\.[^\s]+)/, "链接格式不正确"],
                    number: [/^\d+$/, "只能填写数字"],
                    date: [/^(\d{4})[-\/](\d{1}|0\d{1}|1[0-2])([-\/](\d{1}|0\d{1}|[1-2][0-9]|3[0-1]))*$/, "日期格式不正确"],
                    identity: [/(^\d{15}$)|(^\d{17}(x|X|\d)$)/, "请输入正确的身份证号"]
                }
            }
        };
    c.prototype.set = function (e) {
        var i = this;
        return t.extend(!0, i.config, e), i
    }, c.prototype.verify = function (e) {
        var i = this;
        return t.extend(!0, i.config.verify, e), i
    }, c.prototype.on = function (e, t) {
        return layui.onevent(l, e, t)
    }, c.prototype.render = function (e, i) {
        void 0 === i && e instanceof t && (i = e, e = "all");
        var n = this, c = {
            select: function () {
                var e, a = "layui-form-select", n = "layui-select-title", c = "layui-select-none", u = "",
                    f = void 0 == i ? t(o).find("select") : i.find("select"), h = function (i, l) {
                        t(i.target).parent().hasClass(n) && !l || (t("." + a).removeClass(a + "ed"), e && u && e.val(u)), e = null
                    }, v = function (i, o, f, v) {
                        function p() {
                            k.off("click").on("click", function () {
                                var e = t(this), a = e.attr("lay-value"), n = y.attr("lay-filter");
                                return !e.hasClass(r) && (y.val(a).removeClass("layui-form-danger"), g.val(e.text()), e.addClass(s).siblings().removeClass(s), layui.event.call(this, l, "select(" + n + ")", {
                                        elem: y[0],
                                        value: a,
                                        othis: i
                                    }), C(), !1)
                            })
                        }

                        var y = t(this), m = i.find("." + n), g = m.find("input"), x = i.find("dl"), k = x.children("dd");
                        if (!o || !v) {
                            var b = function (e) {
                                if (!(i.hasClass("layui-select-disabled") || i.hasClass(a + "ed") && void 0 == e)) {
                                    if (i.addClass(a + "ed"), (e = void 0) && x.children("dd").removeClass(d), void 0 !== y.attr("lay-fixed")) {
                                        var n = {left: 0, top: 0};
                                        m.parents().each(function () {
                                            "fixed" == t(this).css("position") && (n.left += t(this).offset().left, n.top += t(this).offset().top), "auto" == t(this).css("display") && (n.left += t(this).scrollLeft(), n.top += t(this).scrollTop())
                                        });
                                        var l = m.offset().left, o = m.offset().top, r = m.innerWidth(),
                                            c = m.innerHeight(), u = t(document).innerWidth(),
                                            f = t(document).innerHeight();
                                        x.css({
                                            position: "fixed",
                                            "min-width": r,
                                            left: "auto",
                                            top: o - n.top + c + 2,
                                            bottom: "auto",
                                            "z-index": 19891231
                                        }), f - o - c < x.outerHeight() && f - o < o + n.top && x.css({top: o - n.top - x.outerHeight() - 2}), u - l < x.outerWidth() && x.css({right: 0})
                                    }
                                    if (x.find("dd." + s).length > 0) {
                                        var h = x.find("dd." + s), v = h.position().top, p = x.scrollTop();
                                        (v < 0 || v > x.height() - h.height()) && x.scrollTop(v + p)
                                    }
                                }
                            }, C = function () {
                                i.removeClass(a + "ed"), x.css({
                                    left: "auto",
                                    bottom: "auto",
                                    right: "auto",
                                    top: "auto"
                                }), g.blur(), w(g.val(), function (e) {
                                    e && (u = x.find("." + s).html(), g && g.val(u))
                                })
                            }, w = function (e, i, a) {
                                e = e.toUpperCase();
                                var n = 0;
                                layui.each(x.children("dd"), function () {
                                    var i = t(this), l = i.text().toUpperCase(), o = -1 === l.indexOf(e);
                                    ("" === e || "blur" === a ? e !== l : o) && n++, "keyup" === a && i[o ? "addClass" : "removeClass"](d)
                                });
                                var l = n === x.children("dd").length;
                                return i(l), l
                            };
                            if (v) {
                                m.off("click").on("click", function (e) {
                                    i.hasClass(a + "ed") ? C() : (h(e, !0), b()), x.find("." + c).remove()
                                }), m.find(".layui-edge").off("click").on("click", function () {
                                    g.focus()
                                }), g.off("keyup").on("keyup", function (e) {
                                    9 === e.keyCode && b()
                                }).off("keydown").on("keydown", function (e) {
                                    var t = e.keyCode;
                                    9 === t ? C() : 13 === t ? e.preventDefault() : j(t)
                                });
                                var T = function (e) {
                                    var t = x.find("dd").not("." + d).not("." + r).first();
                                    x.find("dd." + s).not("." + d).length > 0 && (t = x.find("dd." + s).not("." + d)), 13 == e && (t.length > 0 ? t.click() : (g.val(x.find("dd." + s).text()), i.removeClass(a + "ed")), g.focus())
                                }, j = function (e) {
                                    var t = x.find("dd").not("." + d).not("." + r).first();
                                    if (x.find("dd." + s).not("." + d).length > 0 && (t = x.find("dd." + s).not("." + d)), 40 == e) {
                                        if (b(), t.hasClass(s) ? t.nextAll().not("." + d).not("." + r).length > 0 && (t.removeClass(s), t = t.nextAll().not("." + d).first(), t.addClass(s)) : t.addClass(s), g.val(t.text()), t.length > 0) {
                                            var i = t.position().top, a = x.height(), n = x.scrollTop();
                                            i + n > a && x.scrollTop(i + n - x.height() + 30)
                                        }
                                    } else if (38 == e && (b(), t.prevAll().not("." + d).not("." + r).length > 0 && (t.removeClass(s), t = t.prevAll().not("." + d).first(), t.addClass(s)), g.val(t.text()), t.length > 0)) {
                                        var i = t.position().top, n = x.scrollTop();
                                        i < 5 && x.scrollTop(n + i - 5)
                                    }
                                }, A = !1, H = function (e) {
                                    clearTimeout(A);
                                    var t = this.value, n = e.keyCode;
                                    if (9 === n || 13 === n || 37 === n || 38 === n || 39 === n || 40 === n) T(n); else {
                                        var o = y.attr("lay-filter"), s = layui.getEvent(l, "search(" + o + ")");
                                        null != s ? A = setTimeout(function () {
                                            s({
                                                value: t, othis: i, options: function (e) {
                                                    y.html(""), x.html(""), e.length > 0 ? layui.each(e, function (e, t) {
                                                        y.append('<option value="' + t.value + '">' + t.text + "</option>"), x.append('<dd lay-value="' + t.value + '">' + t.text + "</dd>")
                                                    }) : x.append('<p class="' + c + '">无匹配项</p>'), k = x.children("dd"), p(), b(!0)
                                                }
                                            })
                                        }, 200) : (i.addClass(a + "ed"), w(t, function (e) {
                                            e ? x.find("." + c)[0] || x.append('<p class="' + c + '">无匹配项</p>') : x.find("." + c).remove()
                                        }, "keyup"), b(!0))
                                    }
                                    "" === t && x.find("." + c).remove()
                                };
                                f && g.off("keyup").on("keyup", H).off("blur").on("blur", function (t) {
                                    e = g, u = x.find("." + s).html(), setTimeout(function () {
                                        w(g.val(), function (e) {
                                            e && !u && g.val("")
                                        }, "blur")
                                    }, 200)
                                }), i.find("dl>dt").off("click").on("click", function (e) {
                                    return !1
                                }), t(document).off("click", h).on("click", h)
                            }
                            p()
                        }
                    };
                f.each(function (e, i) {
                    var l = t(this), o = l.next("." + a), d = this.disabled, c = i.value,
                        u = t(i.options[i.selectedIndex]), f = 0 == i.selectedIndex && "" == c ? "" : u.text();
                    if ("string" == typeof l.attr("lay-ignore"))return l.show();
                    var h = "string" == typeof l.attr("lay-search");
                    if (0 == l.next("." + a).length) {
                        var p = t(['<div class="layui-unselect ' + a + (d ? " layui-select-disabled" : "") + '">', '<div class="' + n + '"><input type="text" placeholder="' + (i.options[0].innerHTML ? i.options[0].innerHTML : "请选择") + '" value="' + (c ? u.html() : "") + '" ' + (h ? "" : "readonly") + ' class="layui-input layui-unselect' + (d ? " " + r : "") + '">', '<i class="layui-edge"></i></div>', '<dl class="layui-anim layui-anim-upbit' + (l.find("optgroup")[0] ? " layui-select-group" : "") + '">' + function (e) {
                            var t = [];
                            return layui.each(e, function (e, i) {
                                (0 !== e || i.value) && ("optgroup" === i.tagName.toLowerCase() ? t.push("<dt>" + i.label + "</dt>") : t.push('<dd lay-value="' + i.value + '" class="' + (c === i.value ? s : "") + (i.disabled ? " " + r : "") + '">' + i.innerHTML + "</dd>"))
                            }), t.join("")
                        }(l.find("*")) + "</dl>", "</div>"].join(""));
                        o[0] && o.remove(), l.after(p), v.call(this, p, d, h, !0)
                    } else {
                        var y = l.next().find("dl");
                        d ? (l.next().addClass("layui-select-disabled"), l.next().find("input").addClass("layui-disabled")) : l.next().find("input").removeClass("layui-select-disabled"), l.next().find("input").val(f), y.html(""), layui.each(l.find("option"), function (e, t) {
                            (0 !== e || t.value) && ("optgroup" === t.tagName.toLowerCase() ? y.append("<dt>" + t.label + "</dt>") : y.append('<dd lay-value="' + t.value + '" class="' + (c === t.value ? s : "") + (t.disabled ? " " + r : "") + '">' + t.innerHTML + "</dd>"))
                        }), v.call(this, l.next(), d, h, !1)
                    }
                })
            }, checkbox: function () {
                var e = {
                    checkbox: ["layui-form-checkbox", "layui-form-checked", "checkbox"],
                    _switch: ["layui-form-switch", "layui-form-onswitch", "switch"]
                }, a = function (e, i) {
                    var a = t(this);
                    e.on("click", function () {
                        var t = a.attr("lay-filter"), n = (a.attr("lay-text") || "").split("|");
                        a[0].disabled || (a[0].checked ? (a[0].checked = !1, e.removeClass(i[1]).find("em").text(n[1])) : (a[0].checked = !0, e.addClass(i[1]).find("em").text(n[0])), layui.event.call(a[0], l, i[2] + "(" + t + ")", {
                            elem: a[0],
                            value: a[0].value,
                            othis: e
                        }))
                    })
                };
                (void 0 == i ? t(o).find("input[type=checkbox]") : i.find("input[type=checkbox]")).each(function (i, n) {
                    var l = t(this), o = l.attr("lay-skin"), s = (l.attr("lay-text") || "").split("|"),
                        d = this.disabled;
                    "switch" === o && (o = "_" + o);
                    var c = e[o] || e.checkbox;
                    if ("string" == typeof l.attr("lay-ignore"))return l.show();
                    var u = l.next("." + c[0]),
                        f = t(['<a href="javascript:" class="layui-unselect ' + c[0] + (n.checked ? " " + c[1] : "") + (d ? " layui-checkbox-disbaled " + r : "") + '" lay-skin="' + (o || "") + '">', {_switch: "<em>" + ((n.checked ? s[0] : s[1]) || "") + "</em><i></i>"}[o] || (n.title.replace(/\s/g, "") ? "<span>" + n.title + "</span>" : "") + '<i class="layui-icon">' + (o ? "&#xe605;" : "&#xe618;") + "</i>", "</a>"].join(""));
                    u[0] && u.remove(), l.after(f), a.call(this, f, c)
                })
            }, radio: function () {
                var e = "layui-form-radio", a = ["&#xe643;", "&#xe63f;"], n = function (i) {
                    var n = t(this), s = "layui-anim-scaleSpring";
                    i.on("click", function () {
                        var d = n[0].name, r = n.parents(o), c = n.attr("lay-filter"),
                            u = r.find("input[name=" + d.replace(/(\.|#|\[|\])/g, "\\$1") + "]");
                        n[0].disabled || (layui.each(u, function () {
                            var i = t(this).next("." + e);
                            this.checked = !1, i.removeClass(e + "ed"), i.find(".layui-icon").removeClass(s).html(a[1])
                        }), n[0].checked = !0, i.addClass(e + "ed"), i.find(".layui-icon").addClass(s).html(a[0]), layui.event.call(n[0], l, "radio(" + c + ")", {
                            elem: n[0],
                            value: n[0].value,
                            othis: i
                        }))
                    })
                };
                (void 0 == i ? t(o).find("input[type=radio]") : i.find("input[type=radio]")).each(function (i, l) {
                    var o = t(this), s = o.next("." + e), d = this.disabled;
                    if ("string" == typeof o.attr("lay-ignore"))return o.show();
                    var c = t(['<a href="javascript:" class="layui-unselect ' + e + (l.checked ? " " + e + "ed" : "") + (d ? " layui-radio-disbaled " + r : "") + '">', '<i class="layui-anim layui-icon">' + a[l.checked ? 0 : 1] + "</i>", "<span>" + (l.title || "未命名") + "</span>", "</a>"].join(""));
                    s[0] && s.remove(), o.after(c), n.call(this, c)
                })
            }
        };
        return e && "all" != e ? c[e] ? c[e]() : a.error("不支持的" + e + "表单渲染") : layui.each(c, function (e, t) {
            t()
        }), n
    };
    var u = function () {
        var e = t(this), a = f.config.verify, s = null, d = {}, r = e.parents(o), c = r.find("*[lay-verify]"),
            u = e.parents("form")[0], h = r.find("input,select,textarea"), v = e.attr("lay-filter");
        if (layui.each(c, function (e, l) {
                var o = t(this), d = o.attr("lay-verify").split("|"), r = "", c = o.val();
                if (o.removeClass("layui-form-danger"), layui.each(d, function (e, t) {
                        var d = "function" == typeof a[t];
                        if (a[t] && (d ? r = a[t](c, l) : !a[t][0].test(c)))return i.msg(r || a[t][1], {
                            icon: 5,
                            shift: 6
                        }), n.android || n.ios || l.focus(), o.addClass("layui-form-danger"), s = !0
                    }), s)return s
            }), s)return !1;
        layui.each(h, function (e, t) {
            t.name && (/^checkbox|radio$/.test(t.type) && !t.checked || ("checkbox" == t.type ? void 0 == d[t.name] ? d[t.name] = [t.value] : d[t.name].push(t.value) : d[t.name] = t.value))
        });
        for (var p in d)"[object Array]" === Object.prototype.toString.call(d[p]) && (d[p] = d[p].toString());
        return layui.event.call(this, l, "submit(" + v + ")", {elem: this, form: u, field: d})
    }, f = new c, h = t(document);
    f.render(), h.on("reset", o, function () {
        var e = t(this);
        setTimeout(function () {
            f.render(e)
        }, 50)
    }), h.on("submit", o, u).on("click", "*[lay-submit]", u), e(l, function (e) {
        return f.set(e)
    })
});