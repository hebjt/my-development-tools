/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.base.puid;

/**
 * 所有自定义类的基类
 * 
 * @author: meizz
 * @namespace: mz.base.Class
 * @version: 2010-02-04
 *
 * @config {String}     puid    每个类实例对应的页面级唯一的 key
 * @config {Function}   dispose 析构方法
 */

mz.base.Class = function(puid) {
    // 20110115 在子类里可以预设定 this.puid
    this.puid = this.puid || puid || mz.base.puid();
    window[mz.puid]["\x06instances"][this.puid] = this;
};

window[mz.puid]["\x06instances"] = window[mz.puid]["\x06instances"] || {};

/**
 * 自定义类的析构方法，释放对象所持有的资源。
 * 好像没有将_listeners中绑定的事件剔除掉..
 */
mz.base.Class.prototype.dispose = function(){
    delete window[mz.puid]["\x06instances"][this.puid];

    for(var property in this){
        if (typeof this[property] != "function"){
            delete this[property];
        }
    }
    this.disposed = true;   // 20100716
};

/**
 * 重载了默认的toString方法，使得返回信息更加准确一些。
 * @return {String} 对象的String表示形式
 */
mz.base.Class.prototype.toString = function(){
    return "[object " + (this._className || "Object" ) + "]";
};

/**
 * 按唯一标识 puid 字符串取到对象的实例
 *
 * @param {String} puid 类实例对应的唯一标识
 * @return {object} 对应的实例
 */
window["mzInstance"] = function(puid) {
    var e = window[mz.puid]["\x06instances"];
    return e && e[puid];
};
