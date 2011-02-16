/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.base.puid;
/// include mz.base.Class;

/**
 * 自定义事件类及添加、移除自定义事件及事件派发的实现
 * 
 * @author: meizz
 * @namespace: mz.base.Event
 * @version: 2010-01-23
 *
 * @config {String}         type            事件的名称
 * @config {Boolean}        returnValue     当事件发生之后处理结果的返回值
 * @config {mz.base.Class}  target          在事件被触发后传递的对象
 * @config {mz.base.Class}  currentTarget   触发该事件的对象
 */
mz.base.Event = function(type, target){
    this.type = type;
    this.returnValue = true;
    this.target = target || null;
    this.currentTarget = null;
};


/**
 * 派发自定义事件，使得绑定到自定义事件上面的函数都会被执行。
 * 但是这些绑定函数的执行顺序无法保证。
 * 处理会调用通过addEventListenr绑定的自定义事件回调函数之外，还会调用
 * 直接绑定到对象上面的自定义事件。例如：
 * myobj.onMyEvent = function(){}
 * myobj.addEventListener("onMyEvent", function(){});
 *
 * @param {mz.base.Event|String}    event   派发的自定义事件类型
 * @param {JSON}                    options 合在event对象传递的参数
 */
mz.base.Class.prototype.dispatchEvent = function(event, options){
    !this["\x06listeners"] && (this["\x06listeners"] = {});

    // 20100528 参数可以是事件名字符串
    if (typeof event == "string") event = new mz.base.Event(event);

    // 20100501 添加本方法的第二个参数，将 options extend到event中去传递
    options = options || {};
    for (var i in options) {
        typeof event[i] == "undefined" && (event[i] = options[i]);
    }

    var i, t = this["\x06listeners"], p = event.type;
    event.target = event.target || this;
    event.currentTarget = this;

    p.indexOf("on") != 0 && (p = "on" + p);

    typeof this[p] == "function" && this[p](event);

    if (typeof t[p] == "object") {
        for (i in t[p]) {
            t[p][i].call(this, event);
        }
    }

    return event.returnValue;
};


/**
 * 扩展mz.base.Class来添加自定义事件
 * @param {String}      type    自定义事件的名称
 * @param {Function}    handler 自定义事件被触发时应该调用的回调函数
 * @param {String}      key     可选参数，绑定到事件上的函数对应的索引key
 * @param {String}      key     被附加的函数引用句柄
 */
mz.base.Class.prototype.addEventListener = function(type, handler, key){
    !this["\x06listeners"] && (this["\x06listeners"] = {});

    var t = this["\x06listeners"],
        id;
    if (typeof key == "string" && key) {
        if (/[^\w\-]/.test(key)) {
            throw("nostandard key:" + key);
        } else {
            handler._hashCode = key;
            id = key;
        }
    }

    type.indexOf("on") != 0 && (type = "on"+ type);

    typeof t[type] != "object" && (t[type] = {});

    id = id || mz.base.puid();
    handler._hashCode = id;
    //if (t[type][id]) {
    //    throw("repeat key:" + id);
    //}
    t[type][id] = handler;

    return id;
};
 
/**
 * 删除自定义事件中绑定的一个回调函数。如果第二个参数handler没有被
 * 绑定到对应的自定义事件中，什么也不做。
 * @param {String}      type    自定义事件的名称
 * @param {Function}    handler 需要删除的自定义事件的函数或者该函数对应的索引key
 */
mz.base.Class.prototype.removeEventListener = function(type, handler){
    if (typeof handler == "function") {
        handler = handler._hashCode;
    } else if (typeof handler != "string") {
        return;
    }

    !this["\x06listeners"] && (this["\x06listeners"] = {});

    type.indexOf("on") != 0 && (type = "on"+ type);

    var t = this["\x06listeners"];

    if (!t[type]) return;

    t[type][handler] && delete t[type][handler];
};
