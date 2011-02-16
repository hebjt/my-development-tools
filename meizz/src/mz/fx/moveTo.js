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
 * 将元素移动到指定的坐标点
 * 
 * @namespace: mz.fx.moveTo
 * @author: meizz
 * @create: 2010-06-07
 * @version: 2010-07-07
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {Array|JSON}    point       目标点坐标
 * @param   {JSON}          options     类实例化时的参数配置
 * @return  {fx}     效果类的实例
 */
mz.fx.moveTo = function(element, point, options) {
    if (!(element = mz.dom(element))
        || mz.dom.getStyle(element, "position") == "static"
        || typeof point != "object") return null;

    var p = [point[0] || point.x || 0, point[1] || point.y || 0];
    var x = parseInt(mz.dom.getStyle(element, "left")) || 0;
    var y = parseInt(mz.dom.getStyle(element, "top"))  || 0;

    var fx = mz.fx.move(element, mz.object.extend({
        x: p[0]-x
        ,y: p[1]-y
        ,transition:mz.fx.getTransition("spring")}, options||{}));

    return fx;
};
