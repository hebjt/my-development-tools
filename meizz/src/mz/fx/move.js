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
/// include mz.dom.getStyle;

/**
 * 移动元素，到指定的点，等同于 movoTo
 * 
 * @author: meizz
 * @create: 2010-06-04
 * @namespace: mz.fx.move
 * @version: 2010-08-28
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {JSON}          options     类实例化时的参数配置
 *          {x, y}
 * @return  {fx}     效果类的实例
 */
mz.fx.move = function(element, options) {
    // 没有定位的元素不准动
    if (!(element = mz.dom(element))
        || mz.dom.getStyle(element, "position") == "static") return null;
    
    options = mz.object.extend({x:0, y:0}, options || {});
    if (options.x == 0 && options.y == 0) return null;

    // top(1) right(2) bottom(4) left(8) width(16) height(32)
    var gs = function(key){return parseInt(mz.dom.getStyle(element, key))};
        _t = gs("top"),
        _l = gs("left"),
        _r = gs("right"),
        _b = gs("bottom"),
        _w = gs("width"),
        _h = gs("height");
        // [TODO] 20100827 在Firefox里取四角坐标值，默认值不是 auto，这是一个 bug

    // 对于那些靠定位“拉扯”开高宽的元素，改变四角定位值时是改变大小而不是移动
    if ((_l && _r) || (_t && _b)) return null;

    var fx = mz.fx.create(element, mz.object.extend({
        //[Implement Interface] initialize
        initialize : function() {
            this.protect("top");
            this.protect("left");
            this.protect("right");
            this.protect("bottom");

            this.ot = _t || 0;
            this.or = _r || 0;
            this.ob = _b || 0;
            this.ol = _l || 0;
        }

        //[Implement Interface] render
        ,render : function(schedule) {
            var s = element.style;

            if (_t) s.top = (this.y * schedule + this.ot) +"px";
            else if (_b) s.bottom = (-this.y * schedule + this.ob) +"px";

            if (_l) s.left = (this.x * schedule + this.ol) +"px";
            else if (_r) s.right = (-this.x * schedule + this.or) +"px";
        }
    }, options), "mz.fx.move");

    return fx.launch();
};
