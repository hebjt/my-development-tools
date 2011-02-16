/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;

/**
 * 给系统 DOM 对象添加事件监听函数
 * 
 * @namespace: mz.event.attach
 * @author: meizz
 * @create: 2010-01-23
 * @version: 2010-07-07
 *
 * @param {HTMLElement|Window|Document} object 事件的宿主（HTMLElement|window|document）
 * @param {String} type 事件名称（事件名可以不带 on 前缀）
 * @param {Function} listener 监听函数
 */

mz.event.attach = function(object, type, listener) {
    //判断 object 是 window or document
    if (!(object && (object.nodeType == 9 || object.navigator))) {
        object = mz.dom(object);
    }

    // type 事件名可以不带 on 前缀
    type = type.replace(/^on/i, "").toLowerCase();

    if (object.attachEvent) {
        /**
         * 通过这个 call 将 listener 里的 this 指向当前被绑定的对象，兼容W3C
         */
        var fn = function(){
            listener.call(object);
        }

        object.attachEvent("on"+ type, fn);
    } else if (object.addEventListener) {
        object.addEventListener(type, listener, false);
    }

    window[mz.puid]._listeners.push([object, type, listener, fn || listener]);
};
