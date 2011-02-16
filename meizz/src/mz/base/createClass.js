/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.base.Class;
/// include mz.base.decontrol;

/**
 * 创建一个类，包括创造类的构造器、继承基类Class
 * 创建新类时都采用这个方法：var newClass = mz.base.createClass(fn, className);
 * 创造出来的构造器拥有两个静态方法：
 *  extend({json})              可以直接扩展 prototype 原型对象
 *  register(function(this){})  向已有的对象注册一个函数，在对象被 new 的时候执行
 * 
 * @author: meizz
 * @version: 2010-05-13
 * @namespace: mz.base.createClass
 *
 * @param   {function}  constructor 类的构造器函数
 * @param   {JSON}      options   (可选){className, parentClass, decontrolled}
 * @return  {Class} 一个类对象
 */

mz.base.createClass = function(constructor, options) {
    options = options || {};
    var parentClass = options.parentClass || mz.base.Class;

    // 创建新类的真构造器函数
    var fn = function(){
        if (arguments.length > 0) {
            var op = arguments[arguments.length - 1];
            typeof op == "object" && (this.puid = op.puid);
        }
        // 继承父类的构造器
        parentClass.call(this);
        constructor.apply(this, arguments);

        // 20101030 某类在添加该属性控制时，puid将不在全局instances里控制
        options.decontrolled && mz.base.decontrol(this.puid);

        for (var i=0, n=fn["\x06r"].length; i<n; i++) {
            fn["\x06r"][i](this);
        }
    };

    // 一个静态属性，存放全局配置
    fn.options = options.options || {};

    // 为以后的模块拆分而做
    fn["\x06r"] = [];
    fn.register = function(f){typeof f == "function" && fn["\x06r"].push(f);};

    var C = function(){},
        cp = constructor.prototype;
    C.prototype = parentClass.prototype;

    // 继承父类的原型（prototype)链
    var fp = fn.prototype = new C();

    // 继承传参进来的构造器的 prototype 不会丢
    for (var i in cp) fp[i] = cp[i];

    typeof options.className == "string" && (fp._className = options.className);

    // 修正这种继承方式带来的 constructor 混乱的问题
    fp.constructor = cp.constructor;

    // 给类扩展出一个静态方法，以代替 mz.object.extend()
    fn.extend = function(json){
        for (var i in json) {
            fn.prototype[i] = json[i];
        }
        return fn;  // 这个静态方法也返回类对象本身
    };

    return fn;
};
