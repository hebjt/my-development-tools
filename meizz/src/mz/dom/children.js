/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 取得指定的DOM元素下的所有 element 集合
 * 
 * @author: meizz
 * @namespace: mz.dom.children
 * @version: 2010-01-23
 *
 * @param {HTMLElement/String}  obj DOM元素或者DOM元素对应的ID
 * @return {Collection}             对应的DOM元素下的所有 element 集合
 */
mz.dom.children = function(obj) {
    obj = mz.dom(obj);

    if (obj.children) {
        return obj.children;
    } else {
        var r = [], j = 0,
            item, name,
            a = obj.childNodes,
            i = a.length;
        while (i--) {
            item = a[i];
            if (item.nodeType == 1) {
                r[j++] = item;

                // 建立以 id 作为下标的目标索引
                item.id && (r[item.id] = item);

                // 建立以 name 作为下标的目标集合
                if (name = item.name) {
                    !r[name] && (r[name] = []);
                    r[name][r[name].length] = item;
                }
            }
        }
        return r.reverse();
    }
};
