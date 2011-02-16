/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * @author: meizz
 * @namespace: mz.event.preventDefault
 * @version: 2010-01-23
 *
 * @param {Event}   e   系统的事件
 * @param {Boolean} b   设置事件的返回值
 * @return {Boolean}    事件返回值
 */
mz.event.preventDefault = function(e, b) {
    if (b === false) {
        if (window.event) {
            window.event.returnValue = false;
        } else if (e && e.preventDefault) {
            e.preventDefault();
        }
    }
    return b;
};
