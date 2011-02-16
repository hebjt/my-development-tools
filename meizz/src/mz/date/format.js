/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 将 Date 对象按照指定的字符串格式输出
 * 
 * @author: meizz
 * @namespace: mz.date.date
 * @version: 2010-01-23
 * 
 * @param {Date} date JS时间对象
 * @param {String} pattern 字符串格式字符串 yyyy-MM-dd hh:mm:ss S
 * @return {String} 已经格式化好的字符串
 */

mz.date.format = function(date, pattern) {
    /**
     * 如果只需要2位或者4位的年，那可以使用这段代码
     *
    if (/(^|[^y])(yy|yyyy)([^y]|$)/.test(pattern)) {
        pattern = pattern.replace(RegExp["\x242"],
            (date.getFullYear() +"").substr(4 - RegExp["\x242"].length));
    }
    */

    // 这段代码是可以按任意位数来取年份，请注意
    // 至于为什么这么做，是因为实际年位不一定是4位的
    if (/(y+)/.test(pattern)) {
        pattern = pattern.replace(RegExp["\x241"],
            (date.getFullYear() +"").substr(4 - RegExp["\x241"].length));
    }

    var o = {
         "M+" : date.getMonth() + 1 //month
        ,"d+" : date.getDate()      //day
        ,"h+" : date.getHours()     //hour
        ,"m+" : date.getMinutes()   //minute
        ,"s+" : date.getSeconds()   //second
        ,"q+" : Math.floor((date.getMonth() + 3) / 3)   //quarter
        ,"S" : date.getMilliseconds()   //millisecond
    }

    for (var k in o) {
        if(new RegExp("("+ k +")").test(pattern)) {
            pattern = pattern.replace(RegExp["\x241"],
                RegExp["\x241"].length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return pattern;
};

