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
/// include mz.dom.getStyle;
/// include mz.object.extend;

/// include mz.fx.create;
/// include mz.fx.getTransition;

/**
 * 将DOM元素放大
 * 2010-07-02 添加opacityTrend属性定制，可以手动控制透明的趋势
 * 
 * @namespace: mz.fx.scale
 * @author: meizz
 * @create: 2010-06-30
 * @version: 2010-07-07
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {JSON}          options     类实例化时的参数配置
 *          {transformOrigin, from,     to, restoreAfterFinish, opacityTrend}
 *          {"0px 0px"        number    number  boolean         boolean}
 * @return  {fx}     效果类的实例
 */
mz.fx.scale = function(element, options) {
    if (!(element = mz.dom(element))) return null;
    options = mz.object.extend({from : 0.1,to : 1}, options || {});

    // "0px 0px" "50% 50%" "top left"
    var r = /^(-?\d+px|\d?\d(\.\d+)?%|100%|left|center|right)(\s+(-?\d+px|\d?\d(\.\d+)?%|100%|top|center|bottom))?/i;
    !r.test(options.transformOrigin) && (options.transformOrigin = "0px 0px");

    var original = {},
        fx = mz.fx.create(element, mz.object.extend({
        //[Implement Interface] initialize
        initialize : function() {
            element.style.display = "";
            var me = this,
                o = original,
                s = element.style,
                save    = function(k){me.protect(k)};

            // IE浏览器使用 zoom 样式放大
            if (mz.browser.ie) {
                save("top");
                save("left");
                save("position");
                save("zoom");
                save("filter");

                this.offsetX = parseInt(mz.dom.getStyle(element, "left")) || 0;
                this.offsetY = parseInt(mz.dom.getStyle(element, "top"))  || 0;

                if (mz.dom.getStyle(element, "position") == "static") {
                    s.position = "relative";
                }

                // IE 的ZOOM没有起始点，以下代码就是实现起始点
                r.test(this.transformOrigin);
                var t1 = RegExp["\x241"].toLowerCase(),
                    t2 = RegExp["\x244"].toLowerCase(),
                    ew = this.element.offsetWidth,
                    eh = this.element.offsetHeight,
                    dx, dy;

                if (/\d+%/.test(t1)) dx = parseInt(t1, 10) / 100 * ew;
                else if (/\d+px/.test(t1)) dx = parseInt(t1);
                else if (t1 == "left") dx = 0;
                else if (t1 == "center") dx = ew / 2;
                else if (t1 == "right") dx = ew;

                if (!t2) dy = eh / 2;
                else {
                    if (/\d+%/.test(t2)) dy = parseInt(t2, 10) / 100 * eh;
                    else if (/\d+px/.test(t2)) dy = parseInt(t2);
                    else if (t2 == "top") dy = 0;
                    else if (t2 == "center") dy = eh / 2;
                    else if (t2 == "bottom") dy = eh;
                }

                // 设置初始的比例
                s.zoom = this.from;
                o.cx = dx; o.cy = dy;   // 放大效果起始原点坐标
            } else {
                save("WebkitTransform");
                save("WebkitTransformOrigin");   // Chrome Safari
                save("MozTransform");
                save("MozTransformOrigin");         // Firefox Mozllia
                save("OTransform");
                save("OTransformOrigin");             // Opera 10.5 +
                save("transform");
                save("transformOrigin");               // CSS3
                save("opacity");
                save("KHTMLOpacity");

                // 设置初始的比例和效果起始点
                s.WebkitTransform =
                    s.MozTransform =
                    s.OTransform =
                    s.transform = "scale("+ this.from +")";

                s.WebkitTransformOrigin = 
                    s.MozTransformOrigin = 
                    s.OTransformOrigin =
                    s.transformOrigin = this.transformOrigin;
            }
        }

        ,transition : mz.fx.getTransition("sinoidal")

        //[Implement Interface] render
        ,render : function(schedule) {
            var s = element.style,
                b = this.to == 1,
                b = typeof this.opacityTrend == "boolean" ? this.opacityTrend : b,
                p = b ? this.percent : 1 - this.percent,
                n = this.to * schedule + this.from * (1 - schedule);

            if (mz.browser.ie) {
                s.zoom = n;
                s.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity:"+
                    Math.floor(p * 100) +")";
                // IE 下得计算 transform-origin 变化
                s.top = this.offsetY + original.cy * (1 - n);
                s.left= this.offsetX + original.cx * (1 - n);
            } else {
                s.WebkitTransform =
                    s.MozTransform =
                    s.OTransform =
                    s.transform = "scale("+ n +")";
                s.KHTMLOpacity = s.opacity = p;
            }
        }
    }, options), "mz.fx.scale");

    return fx.launch();
};