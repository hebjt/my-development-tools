/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.browser.ie;

/**
 * 删除一个指定的DOM元素
 * 此方法一为解决浏览器兼容问题；二为避免删除节点时的内存泄漏
 * 
 * @author: meizz
 * @version: 2010-01-23
 * @namespace: mz.dom.remove
 *
 * @param {HTMLElement} element DOM元素
 */

mz.dom.remove = function(element) {
    var e = mz.dom(element);

    // 20101128 删除标签元素上的事件引用，打断循环引用。
    if (e.clearAttributes) {
        e.clearAttributes();
    } else {
        for (var att in e) {
            e.hasOwnProperty(att) && (delete e[att]);
        }
    }

    if (mz.browser.ie) {
        // 解决 IE 里删除节点内存问题
        // 这种删除法是彻底删除，再访问该元素时会报错
        var div = document.createElement("DIV");
        div.appendChild(e);
        div.innerHTML = "";
    } else {
        // 修正对 document.createElement() 创建的非DOM树元素的删除的出错
        (e.parentNode) && e.parentNode.removeChild(e);
    }
};