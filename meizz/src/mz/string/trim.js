/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 删除字符串前后两端的空格
 * 2010-07-22 \s==[ \f\n\r\t\v] 不仅指空格
 * 
 * @author: meizz
 * @create: 2010-01-22
 * @namespace: mz.string.trim
 * @version: 2010-07-22
 *
 * @param   {String}    str 需要删除前后空格的字符串
 * @return  {String}        已经处理后的字符串
 */
(function(){
    // 将正则表达式预创建，可提高效率
    var reg = /(^[ \xa0\u3000]+)|([\u3000\xa0 ]+$)/g;

    mz.string.trim = function(str){return str.replace(reg, "");};
})();
