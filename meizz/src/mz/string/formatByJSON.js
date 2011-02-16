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
 * @namespace: mz.string.formatByJSON
 * @version: 2010-01-23
 *
 * @param {String} str 字符串模板
 * @param {Object} json 填充的字符来源对象
 * @return {String} 格式化后的字符串
 */

mz.string.formatByJSON = function(str, json) {
    for (var i in json) {
        var s = i.replace(/(\W)/g, "\\\x241");
        var r = new RegExp("#\\{"+ s +"\\}", "g");
        str = str.replace(r, json[i]);
    }
    return str;
};
