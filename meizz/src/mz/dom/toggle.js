/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 显示 / 隐藏一个DOM元素
 * 
 * @author: meizz
 * @namespace: mz.dom.toggle
 * @version: 2010-01-23
 *
 * @param {HTMLElement} element DOM元素
 */

mz.dom.toggle = function(element) {
    var style = mz.dom(element).style;
    style.display = style.display == "none" ? "" : "none";
};
