/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;
/// include mz.browser.ie;
/// include mz.object.extend;

/// include mz.fx.create;

/**
 * 控制元素的透明度 渐变
 * 
 * @namespace: mz.fx.opacity
 * @author: meizz
 * @create: 2010-06-08
 * @version: 2010-07-07
 *
 * @param   {HTMLElement}   element DOM元素或者ID
 * @param   {JSON}          options 类实例化时的参数配置
 *          {from, to, interval, duration, restoreAfterFinish}
 * @return {fx}     效果类的实例
 */

mz.fx.opacity = function(element, options) {
    if (!(element = mz.dom(element))) return null;

    options = mz.object.extend({from: 0,to: 1}, options||{});

    var e = element;

    var fx = mz.fx.create(e, mz.object.extend({
        //[Implement Interface] initialize
        initialize : function() {
            element.style.display = "";

            if (mz.browser.ie) {
                this.protect("filter");
            } else {
                this.protect("opacity");
                this.protect("KHTMLOpacity");
            }

            this.distance = this.to - this.from;
        }

        //[Implement Interface] render
        ,render : function(schedule) {
            var n = this.distance * schedule + this.from;

            if(!mz.browser.ie) {
                e.style.opacity = n;
                e.style.KHTMLOpacity = n;
            } else {
                e.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity:"+
                    Math.floor(n * 100) +")";
            }
        }
    }, options), "mz.fx.opacity");

    return fx.launch();
};
