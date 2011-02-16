/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.event;

/**
 * 在 window.onunload 事件中释放所有事件监听
 * 
 * @author: meizz
 * @namespace: mz.base.onunload
 * @version: 2010-01-23
 *
 */

mz.event.onunload = function(){
    var list = window[mz.puid]._listeners,
        len = list.length,
        item;

    while (len--) {
        item = list[len];

        if (item[0].detachEvent) {
            item[0].detachEvent("on"+ item[1], item[2]);
        } else {
            item[0].removeEventListener(item[1], item[2], false);
        }
    }

    list.length = 0;
    window[mz.puid]._instances = null;
}

if (window.attachEvent) {
    window.attachEvent("onunload", mz.event.onunload)
} else {
    window.addEventListener("unload", mz.event.onunload, false);
}