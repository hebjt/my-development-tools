/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 数据中指定元素的索引值
 * 
 * @author: meizz
 * @namespace: mz.array.indexOf
 * @version: 2010-01-23
 *
 * @param {Array}   array       被检索的数组
 * @param {Object}  item        被检索的元素
 * @param {Number}  startIndex  [可选]开始查找的索引
 * @return {Number} 元素在数组中的索引值
 */
mz.array.indexOf = function(array, item, startIndex) {
    var n = array.length;
    var start = isNaN(startIndex) ? 0 : Number(startIndex) || 0;

    start = Math[(start < 0) ? "ceil" : "floor"](start);

    if(start < 0) start = Math.max(0, n + start);

    for(var i = start; i < n; i ++) {
        if(array[i] === item) {
            return i;
        }
    }
    return -1;
};