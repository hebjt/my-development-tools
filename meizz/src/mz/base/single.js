/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.base.Class;

/**
 * 创建一个类的单例
 * 
 * @author: meizz
 * @namespace: mz.base.single
 * @version: 2010-01-23
 *
 * @return {object} 一个类的单例
 */

mz.base.single = function(options) {
    var obj = new mz.base.Class();

    for (var i in options) {
        obj[i] = options[i];
    }

    return obj;
};
