/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/**
 * 获取线型函数
 * 
 * @author: meizz
 * @create: 2010-07-15
 * @namespace: mz.fx.getTransition
 *
 * @param   {String}    name    transition的名称
 * @return  {function}          线型函数
 */
mz.fx.getTransition = function(name) {
    var a = mz.fx.transitions;
    if (!name || typeof a[name] != "string") name = "linear";
    return new Function("percent", a[name]);
};

mz.fx.transitions = {
    none : "return 0"
    ,full : "return 1"
    ,linear : "return percent"  // 斜线
    ,reverse : "return 1 - percent" // 反斜线
    ,sine : "return Math.sin(Math.PI*percent/2)"
    ,cosine : "return Math.cos(Math.PI*percent/2)"
    ,square : "return Math.sqrt(percent)"
    ,arcsine : "return 1 - Math.sin((1 - percent) * Math.PI / 2)"
    ,pow : "return Math.pow(2, 8 * (percent - 1))"
    ,sinoidal : "return (-Math.cos(percent * Math.PI)/2) + 0.5" // 正弦波
    ,spring : "return 1 - (Math.cos(percent * 4.5 * Math.PI) * Math.exp(-percent * 6))" // 弹性阻尼

    ,ellipse : "return 1 - Math.sin(Math.acos(percent))"
    ,bounce : "var value;for (var a = 0, b = 1; 1; a += b, b /= 2){if (percent >= (7 - 4 * a) / 11){value = b * b - Math.pow((11 - 6 * a - 11 * percent) / 4, 2);break;}}return value;"
    ,elastic : "return Math.pow(2, 10 * --percent) * Math.cos(20 * percent * Math.PI / 3)"  // 弹性
};

/*
    // from mootools

	Pow: function(p, x){
		return Math.pow(p, x[0] || 6);
	},

	Expo: function(p){
		return Math.pow(2, 8 * (p - 1));
	},

	Circ: function(p){
		return 1 - Math.sin(Math.acos(p));
	},

	Sine: function(p){
		return 1 - Math.sin((1 - p) * Math.PI / 2);
	},

	Back: function(p, x){
		x = x[0] || 1.618;
		return Math.pow(p, 2) * ((x + 1) * p - x);
	},

	Bounce: function(p){
		var value;
		for (var a = 0, b = 1; 1; a += b, b /= 2){
			if (p >= (7 - 4 * a) / 11){
				value = b * b - Math.pow((11 - 6 * a - 11 * p) / 4, 2);
				break;
			}
		}
		return value;
	},

	Elastic: function(p, x){
		return Math.pow(2, 10 * --p) * Math.cos(20 * p * Math.PI * (x[0] || 1) / 3);
	}
*/

/*
//from: http://github.com/madrobby/scriptaculous/blob/master/src/effects.js

Transitions: {
    linear: Prototype.K,
    sinoidal: function(pos) {
      return (-Math.cos(pos*Math.PI)/2) + .5;
    },
    reverse: function(pos) {
      return 1-pos;
    },
    flicker: function(pos) {
      var pos = ((-Math.cos(pos*Math.PI)/4) + .75) + Math.random()/4;
      return pos > 1 ? 1 : pos;
    },
    wobble: function(pos) {
      return (-Math.cos(pos*Math.PI*(9*pos))/2) + .5;
    },
    pulse: function(pos, pulses) {
      return (-Math.cos((pos*((pulses||5)-.5)*2)*Math.PI)/2) + .5;
    },
    spring: function(pos) {
      return 1 - (Math.cos(pos * 4.5 * Math.PI) * Math.exp(-pos * 6));
    },
    none: function(pos) {
      return 0;
    },
    full: function(pos) {
      return 1;
    }
}
//*/