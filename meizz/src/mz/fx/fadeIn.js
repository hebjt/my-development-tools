/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;
/// include mz.fx.opacity;

/**
 * DOM元素渐显效果
 * 
 * @namespace: mz.fx.fadeIn
 * @author: meizz
 * @create: 2010-06-13
 * @version: 2010-07-07
 *
 * @param {HTMLElement} element DOM元素或者ID
 * @param {JSON}        options 类实例化时的参数配置
 * @return {fx}     效果类的实例
 */

mz.fx.fadeIn = function(element, options) {
    if (!(element = mz.dom(element))) return null;

    var fx = mz.fx.opacity(element,
        mz.object.extend({from:0, to:1, restoreAfterFinish:true}, options||{})
    );
    fx._className = "mz.fx.fadeIn";

    return fx;
};
