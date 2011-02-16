/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.fx.create;

/// include mz.dom;
/// include mz.object.extend;
/// include mz.array.each;
/// include mz.dom.getStyle;

/// include mz.fx.getTransition;

/**
 * 展开DOM元素
 * 
 * @namespace: mz.fx.expand
 * @author: meizz
 * @create: 2010-01-23
 * @version: 2010-07-07
 *
 * @param {HTMLElement} element DOM元素或者ID
 * @param {JSON}        options 类实例化时的参数配置
 * @return {fx}     效果类的实例
 */

mz.fx.expand = function(element, options) {
    if (!(element = mz.dom(element))) return null;

    var e = element, height, offsetHeight,
        stylesValue = ["paddingBottom","paddingTop","borderTopWidth","borderBottomWidth"];

    var fx = mz.fx.create(e, mz.object.extend({
        //[Implement Interface] initialize
        initialize : function() {
            e.style.display = "";
            this.protect("height");
            this.protect("overflow");
            this.restoreAfterFinish = true;
            height = offsetHeight = e.offsetHeight;

            // 20101205 修正border和padding所引起的偏差
            function getNum(tag, style) {
                var n = parseInt(mz.dom.getStyle(tag, style));
                n = isNaN(n) ? 0 : n;
                return n;
            }

            mz.array.each(stylesValue, function(item){
                height -= getNum(e, item);
            });

            e.style.overflow = "hidden";
            e.style.height = "1px";
        }

        //[Implement Interface] transition
        ,transition : mz.fx.getTransition("square")

        //[Implement Interface] render
        ,render : function(schedule) {
            e.style.height = Math.floor(schedule * offsetHeight) +"px";
        }
    }, options || {}), "mz.fx.expand_collapse");

    return fx.launch();
};
