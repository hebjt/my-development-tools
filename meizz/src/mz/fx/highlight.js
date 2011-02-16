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
/// include mz.dom.getStyle;
/// include mz.object.extend;
/// include mz.string.formatColor;

/**
 * 背景颜色渐变的效果
 * 
 * @namespace: mz.fx.highlight
 * @author: meizz
 * @create: 2010-01-23
 * @version: 2010-07-07
 *
 * @param {HTMLElement} element DOM元素或者ID
 * @param {JSON}        options 类实例化时的参数配置[beginColor, endColor, finalColor, textColor]
 * @return {fx}     效果类的实例
 */
mz.fx.highlight = function(element, options) {
    if (!(element = mz.dom(element))) return null;

    var e = element;

    var fx = mz.fx.create(e, mz.object.extend({
        //[Implement Interface] initialize
        initialize : function() {
            var me = this,
                CS = mz.dom.getStyle,
                FC = mz.string.formatColor,
                color = FC(CS(e, "color")) || "#000000",
                bgc   = FC(CS(e, "backgroundColor"));

            // 给用户指定的四个配置参数做一个保护值
            me.beginColor = me.beginColor || bgc || "#FFFF00";
            me.endColor   = me.endColor   || bgc || "#FFFFFF";
            me.finalColor = me.finalColor || me.endColor || me.element.style.backgroundColor;
            me.textColor == color && (me.textColor = "");

            this.protect("color");
            this.protect("backgroundColor");

            me.c_b = []; me.c_d = []; me.t_b = []; me.t_d = [];
            for (var n, i=0; i<3; i++) {
                n = 2 * i + 1;
                me.c_b[i]=parseInt(me.beginColor.substr(n, 2), 16);
                me.c_d[i]=parseInt(me.endColor.substr(n, 2), 16) - me.c_b[i];

                // 如果指定了文字的颜色，则文字颜色也渐变
                if (me.textColor) {
                    me.t_b[i]=parseInt(color.substr(n, 2), 16);
                    me.t_d[i]=parseInt(me.textColor.substr(n,2),16)-me.t_b[i];
                }
            }
        }

        //[Implement Interface] render
        ,render : function(schedule) {
            for (var me=this, a="#", b="#", n, i=0; i<3; i++) {
                n = Math.round(me.c_b[i] + me.c_d[i] * schedule).toString(16);
                a += ("00"+ n).substr(n.length);

                // 如果指定了文字的颜色，则文字颜色也渐变
                if (me.textColor) {
                    n = Math.round(me.t_b[i]+me.t_d[i]*schedule).toString(16);
                    b += ("00"+ n).substr(n.length);
                }
            }
            e.style.backgroundColor = a;
            me.textColor && (e.style.color = b);
        }

        //[Implement Interface] finish
        ,finish : function(){
            this.textColor && (e.style.color = this.textColor);
            e.style.backgroundColor = this.finalColor;
        }
    }, options || {}), "mz.fx.highlight");

    return fx.launch();
};
