/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/**
 * 取得当前页面 scrollLeft 值（多浏览器兼容）
 * 
 * @author: meizz
 * @create: 2007-08-06
 * @namespace: mz.page.getScrollLeft
 * @version: 2010-08-10
 *
 * @param   {Document}  d       doucment对象
 * @return  {Number}            scrollLeft值
 */
mz.page.getScrollLeft = function(d){
    d = d || document;
    return d[d.compatMode == "BackCompat" ? "body" : "documentElement"].scrollLeft;
};
