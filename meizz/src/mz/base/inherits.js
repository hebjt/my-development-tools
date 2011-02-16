/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 给Function原型添加一个“继承”方法，用户自己写的类都可以通过这个方法从父类
 * 
 * @author: meizz
 * @namespace: mz.base.inherits
 * @version: 2010-01-23
 * 
 * @param {JSClass} parentClass 被继承的父类
 * @param {String}  className   给本类指定一个类名（在toString()中可被显示）
 * @return {Object} 本类的原型对象prototype
 */
mz.base.inherits = function (parentClass, childClass, className) {
    var i,
        p,
        op = childClass.prototype,
        C = function() {};

    C.prototype = parentClass.prototype;
    p = childClass.prototype = new C();
    if (typeof className == "string") {
        p._className = className;
    }
    for (i in op) {
        p[i] = op[i];
    }
    childClass.prototype.constructor = op.constructor;
    op = C = null;
    return p;
};