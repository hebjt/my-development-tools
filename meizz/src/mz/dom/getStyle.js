/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 取元素当前正在应用的样式
 * 
 * @author: meizz
 * @namespace: mz.dom.getStyle
 * @version: 2010-01-23
 *
 * @param {HTMLElement} element     DOM元素
 * @param {String}      styleName   被查询的样式名
 * @return {String}     元素当前的样式的值
 */

mz.dom.getStyle = function(element, styleName) {
    var e = mz.dom(element),
        // IE 非DOM树的DOM元素没有currentStyle
        style = e.currentStyle || (navigator.userAgent.indexOf("MSIE ") > 0 ?
            // 可跨 window
            e.style : e.ownerDocument.defaultView.getComputedStyle(e, null)),
        name = styleName.indexOf("-") == -1 ? styleName :
            // 这样正则表达式里套函数 IE5.0- 不支持
            styleName.replace(/-([a-z])/g,function(m,a){return a.toUpperCase()});

    return style[name];
};

// 这个方法会触发浏览器的 repaint，效率上可能有问题