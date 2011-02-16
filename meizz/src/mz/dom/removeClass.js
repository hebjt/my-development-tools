/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 移除 DOM 元素上指定的 className
 * 
 * @author: meizz
 * @namespace: mz.dom.removeClass
 * @version: 2010-01-23
 *
 * @param {HTMLString} element DOM元素
 * @param {String} className 指定的className
 */

mz.dom.removeClass = function(element, className){
    var e  = mz.dom(element), s  = e.className;

    /**
     * \x24是 $ 符
     */
    var cn = className.replace(/^\s+|\s+$/g, "").replace(/(\W)/g,"\\\x241");
    var s2 = s.replace(new RegExp("(^| +)" + cn + "( +|\x24)", "g"), "\x242");

    if (s != s2) {e.className = s2;}
};
