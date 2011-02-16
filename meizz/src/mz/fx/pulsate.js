/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;
/// include mz.object.extend;

/// include mz.fx.create;

/**
 * 心跳效果
 * 
 * @namespace: mz.fx.pulsate
 * @author: meizz
 * @create: 2010-01-23
 * @version: 2010-07-07
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {Number}        loop       心跳的次数
 * @param   {JSON}          options     类实例化时的参数配置 [loop]为必传，小于0则永远心跳不停
 * @return  {fx}            效果类的实例
 */
mz.fx.pulsate = function(element, loop, options) {
    if (!(element = mz.dom(element))) return null;
    if (isNaN(loop) || loop == 0) return null;

    var e = element;

    var fx = mz.fx.create(e, mz.object.extend({
        //[Implement Interface] initialize
        initialize : function() {this.protect("visibility");}

        //[Implement Interface] transition
        ,transition : function(percent) {return Math.cos(2*Math.PI*percent);}

        //[Implement Interface] render
        ,render : function(schedule) {
            e.style.visibility = schedule > 0 ? "visible" : "hidden";
        }

        //[Implement Interface] finish
        ,finish : function(){
            setTimeout(function(){
                mz.fx.pulsate(element, --loop, options);
            }, 10);
        }
    }, options), "mz.fx.pulsate");

    return fx.launch();
};
