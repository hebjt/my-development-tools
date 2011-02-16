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
/// include mz.fx.getTransition;

/**
 * 收拢DOM元素
 * 
 * @namespace: mz.fx.collapse
 * @author: meizz
 * @create: 2010-01-23
 * @version: 2010-07-07
 *
 * @param {HTMLElement} element DOM元素或者ID
 * @param {JSON}        options 类实例化时的参数配置
 * @return {fx}     效果类的实例
 */

mz.fx.collapse = function(element, options) {
    if (!(element = mz.dom(element))) return null;

    var e = element, offsetHeight;

    var fx = mz.fx.create(e, mz.object.extend({
        //[Implement Interface] initialize
        initialize : function() {
            this.protect("height");
            this.protect("overflow");
            this.restoreAfterFinish = true;
            offsetHeight = e.offsetHeight;
            e.style.overflow = "hidden";
        }

        //[Implement Interface] transition
        ,transition : mz.fx.getTransition("cosine")

        //[Implement Interface] render
        ,render : function(schedule) {
            e.style.height = Math.floor(schedule * offsetHeight) +"px";

            // 20100509 在元素绝对定位时，收缩到最后时可能会有一次闪烁
            this.percent > 0.95 && (e.style.height = "0px");
        }

        //[Implement Interface] finish
        ,finish : function(){e.style.display = "none";}
    }, options || {}), "mz.fx.expand_collapse");

    return fx.launch();
};

