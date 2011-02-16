/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 将字符串模板格式化处理
 * 
 * @author: meizz
 * @namespace: mz.string.format
 * @version: 2010-01-23
 *
 * @param {String} str 字符串模板
 * 使用示例：
 *   mz.string.format("00#{0}000#{1}00", "aa", "bb")
 * @return {String} 格式化后的字符串
 */

mz.string.format = function(str, json) {
    var a = Array.prototype.slice.call(arguments, 1),
        n = a.length;

    while (n--){
        str = str.replace(new RegExp("#\\{"+ n +"\\}", "g"), a[n]);
    }

    return str;
};
