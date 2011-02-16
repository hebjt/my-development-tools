/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.fx.fadeOut;

/// include mz.dom.remove;
/// include mz.object.extend;

/**
 * 在删除元素的时候添加 fadeout 的效果
 * 
 * @namespace: mz.fx.remove
 * @author: meizz
 * @create: 2010-01-23
 * @version: 2010-07-07
 *
 * @param {HTMLElement} element DOM元素或者ID
 * @param {JSON}        options 类实例化时的参数配置
 * @return {fx}     效果类的实例
 */

mz.fx.remove = function(element, options) {
    return mz.fx.fadeOut(element, mz.object.extend(options||{}, {
        onafterfinish: function(){mz.dom.remove(this.element);}
    }));
};
