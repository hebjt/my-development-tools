/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 为 DOM 元素添加 className
 * 
 * @author: meizz
 * @namespace: mz.dom.addClass
 * @version: 2010-01-23
 *
 * @param {HTMLElement} element 目标DOM元素
 * @param {String} className 要添加的样式名
 */

mz.dom.addClass = function(element, className){
    var e  = mz.dom(element);
    var cn = className.replace(/^\s+|\s+$/g, "");

    /**
     * 如果className里带有[.*?]等正则表达式敏感的字符，拼接成正则会有问题
     * \x24 是 $ 符
     */
    var r  = new RegExp("(^| )" + cn.replace(/(\W)/g,"\\\x241") + "( |\x24)");

    if (!r.test(e.className)) {
        e.className = e.className.split(/\s+/).concat(cn).join(" ");
    }
};
