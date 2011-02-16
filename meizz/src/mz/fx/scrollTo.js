/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;
/// include mz.fx.scrollBy;

/**
 * 滚动条滚动到指定位置
 * 
 * @author: meizz
 * @create: 2010-07-14
 * @namespace: mz.fx.scrollTo
 * @version: 2010-07-14
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {Array|JSON}    point       移动的距离 [,] | {x,y}
 * @param   {JSON}          options     类实例化时的参数配置
 * @return  {fx}     效果类的实例
 */
mz.fx.scrollTo = function(element, point, options) {
    if (!(element = mz.dom(element)) || typeof point != "object") return null;
    
    var d = {};
    d.x = (point[0] || point.x || 0) - element.scrollLeft;
    d.y = (point[1] || point.y || 0) - element.scrollTop;

    return mz.fx.scrollBy(element, d, options);
};
