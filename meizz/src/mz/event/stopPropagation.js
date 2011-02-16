/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 阻止/设置 事件的冒泡
 * 
 * @author: meizz
 * @namespace: mz.event.stopPropagation
 * @version: 2010-01-23
 *
 * @param {Event}   e   系统的事件
 * @param {Boolean} b   是否阻止事件冒泡
 * @return {Boolean}    是否阻止事件冒泡
 */
mz.event.stopPropagation = function(e, b) {
    if (b) {
        if (window.event) {
            window.event.cancelBubble = true;
        } else if (e && e.stopPropagation) {
            e.stopPropagation();
        }
    }
    return b;
};
