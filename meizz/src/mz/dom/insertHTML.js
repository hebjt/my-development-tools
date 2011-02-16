/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 在指定的位置插入 HTML String
 * 以此方法代替 document.createElement() 可以更节约内存，更高效
 * 
 * @author: meizz
 * @namespace: mz.dom.insertHTML
 * @version: 2010-01-23
 *
 * @param {String|HTMLElement} element 定位插入的HTML的目标DOM元素
 * @param {String} where 指定字符串插入的位置（beforeBegin afterBegin beforeend afterend）
 * @param {String} html 被创建的DOM元素HTML String
 */

mz.dom.insertHTML = function(element, where, html){
    if ((element = mz.dom(element)) && element.insertAdjacentHTML) {
        element.insertAdjacentHTML(where, html);
    } else if (typeof HTMLElement != "undefined" && !window.opera) {
        var range = element.ownerDocument.createRange();
        range.setStartBefore(element);
        var fragment = range.createContextualFragment(html);
        switch(where.toLowerCase()){
            case "beforebegin" :
                element.parentNode.insertBefore(fragment, element);
                break;
            case "afterbegin" :
                element.insertBefore(fragment, element.firstChild);
                break;
            case "beforeend" :
                element.appendChild(fragment);
                break;
            case "afterend" :
                if (!element.nextSibling) {
                    element.parentNode.appendChild(fragment);
                } else {
                    element.parentNode.insertBefore(fragment, element.nextSibling);
                }
                break;
        }
    }
};
