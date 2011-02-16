/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 按字节计算字符串长度，一个汉字按双字节计算长度
 * 
 * @author: meizz
 * @namespace: mz.string.byteLength
 * @version: 2010-01-23
 *
 * @param {String} str 需要计算字节长度的字符串
 * @return {Number} 字符串字节长
 */

(function(){
    var reg = /[^\x00-\xff]/g;

    mz.string.byteLength = function(str){
        return str.replace(reg, "mm").length;
    };
})();
