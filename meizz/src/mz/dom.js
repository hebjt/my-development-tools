/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * mz.dom 所有关于DOM的操作方法都在这个命名空间之下
 * 取得指定的 DOM 元素
 * 20100723 添加第二个参数：元素的宿主 document
 * 
 * @author: meizz
 * @namespace: mz.dom
 * @version: 2010-01-23
 *
 * @param   {HTMLElement/String}    e       DOM元素或者DOM元素对应的ID
 * @param   {Document}              owner   元素的宿主 document（可选）
 * @return  {HTMLElement}                   对应的DOM元素或null
 */

mz.dom = mz.dom || function(e, owner) {
    if (typeof e == "string" || e instanceof String) {
        return (owner || document).getElementById(e);
    } else if (typeof e == "object" && e && e.nodeType == 1) {
        return e;
    }
    return null;
};
