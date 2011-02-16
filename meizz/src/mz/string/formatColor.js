/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 将各种浏览器里的颜色值转换成 #RRGGBB 的格式
 * 
 * @author: meizz
 * @namespace: mz.string.formatColor
 * @version: 2010-01-23
 *
 * @param {String}  color  颜色值字符串
 * @return {String} #RRGGBB格式的字符串或空
 */
(function(){
    // 将正则表达式预创建，可提高效率
    var reg1 = /^\#[\da-f]{6}$/i;
    var reg2 = /^rgb\((\d+), (\d+), (\d+)\)$/;

    mz.string.formatColor = function(color) {
        if(reg1.test(color)) {
            // #RRGGBB 直接返回
            return color;
        } else if(reg2.test(color)) {
            // 非IE中的 rgb(0, 0, 0)
            for (var s, i=1, color="#"; i<4; i++) {
                s = parseInt(RegExp["\x24"+ i]).toString(16);
                color += ("00"+ s).substr(s.length);
            }
            return color;
        } else if(/^\#[\da-f]{3}$/.test(color)) {
            // 简写的颜色值: #F00
            var s1 = color.charAt(1),
                s2 = color.charAt(2),
                s3 = color.charAt(3);
            return "#"+ s1 + s1 + s2 + s2 + s3 + s3;
        }
        return "";
    };
})();

