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
 * 将指定的事件监听函数移除
 * 
 * @namespace: mz.event.detach
 * @author: meizz
 * @create: 2010-01-23
 * @version: 2010-07-07
 *
 * @param {HTMLElement|Window|Document} object 事件的宿主（HTMLElement|window|document）
 * @param {String} type 事件名称（事件名可以不带 on 前缀）
 * @param {Function} listener 监听函数
 */

mz.event.detach = function(object, type, listener) {
    //判断 object 是 window or document
    if (!(object && (object.nodeType == 9 || object.navigator))) {
        object = mz.dom(object);
    }

    // type 事件名可以不带 on 前缀
    type = type.replace(/^on/i, "").toLowerCase();

    var list = window[mz.puid]._listeners,
        len = list.length,
        item;

    while (len --) {
        item = list[len];
        if (item[1] == type
            && item[0] === object
            && item[2] === listener) {
            if (object.detachEvent) {
                object.detachEvent("on"+ type, item[3]);
            } else if (object.removeEventListener) {
                object.removeEventListener(type, item[2], false);
            }
            list.splice(len, 1);
        }
    }
};
