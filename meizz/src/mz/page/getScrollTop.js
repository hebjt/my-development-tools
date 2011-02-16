/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/**
 * 取得当前页面 scrollTop 值（多浏览器兼容）
 * 
 * @author: meizz
 * @namespace: mz.page.getScrollTop
 * @create: 2007-08-06
 * @version: 2010-05-23
 *
 * @return  {Number}    scrollTop值
 */
mz.page.getScrollTop = function(){
    var d = document;
    return d.documentElement.scrollTop || d.body.scrollTop;
};
