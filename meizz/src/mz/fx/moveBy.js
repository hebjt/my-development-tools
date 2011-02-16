/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;
/// include mz.fx.move;
/// include mz.object.extend;
/// include mz.dom.getStyle;
/// include mz.fx.getTransition;

/**
 * 将元素按指定的移动量移动
 * 
 * @namespace: mz.fx.moveBy
 * @author: meizz
 * @create: 2010-06-04
 * @version: 2010-07-07
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {Array|JSON}    distance    移动的距离 [,] | {x,y}
 * @param   {JSON}          options     类实例化时的参数配置
 * @return  {fx}     效果类的实例
 */
mz.fx.moveBy = function(element, distance, options) {
    if (!(element = mz.dom(element))
        || mz.dom.getStyle(element, "position") == "static"
        || typeof distance != "object") return null;

    var d = {transition:mz.fx.getTransition("spring")};
    d.x = distance[0] || distance.x || 0;
    d.y = distance[1] || distance.y || 0;

    var fx = mz.fx.move(element, mz.object.extend(d, options||{}));

    return fx;
};
