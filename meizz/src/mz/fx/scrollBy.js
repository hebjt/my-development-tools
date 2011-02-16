/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;
/// include mz.fx.create;
/// include mz.object.extend;

/// include mz.fx.getTransition;

/**
 * 按指定量移动滚动条
 * 
 * @author: meizz
 * @create: 2010-07-14
 * @namespace: mz.fx.scrollBy
 * @version: 2010-07-14
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {Array|JSON}    distance    移动的距离 [,] | {x,y}
 * @param   {JSON}          options     类实例化时的参数配置
 * @return  {fx}     效果类的实例
 */
mz.fx.scrollBy = function(element, distance, options) {
    if (!(element = mz.dom(element)) || typeof distance != "object") return null;
    
    var d = {}, mm = {};
    d.x = distance[0] || distance.x || 0;
    d.y = distance[1] || distance.y || 0;

    var fx = mz.fx.create(element, mz.object.extend({
        //[Implement Interface] initialize
        initialize : function() {
            var t = mm.sTop   = element.scrollTop;
            var l = mm.sLeft  = element.scrollLeft;

            mm.sx = Math.min(element.scrollWidth - element.clientWidth - l, d.x);
            mm.sy = Math.min(element.scrollHeight- element.clientHeight- t, d.y);
        }

        //[Implement Interface] transition
        ,transition : mz.fx.getTransition("sin")

        //[Implement Interface] render
        ,render : function(schedule) {
            element.scrollTop  = (mm.sy * schedule + mm.sTop);
            element.scrollLeft = (mm.sx * schedule + mm.sLeft);
        }

        ,restore : function(){
            element.scrollTop   = mm.sTop;
            element.scrollLeft  = mm.sLeft;
        }
    }, options), "mz.fx.scroll");

    return fx.launch();
};
