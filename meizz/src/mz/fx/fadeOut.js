/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;
/// include mz.object.extend;
/// include mz.fx.opacity;

/**
 * DOM元素渐隐效果
 * 
 * @namespace: mz.fx.fadeOut
 * @author: meizz
 * @create: 2010-06-13
 * @version: 2010-07-07
 *
 * @param {HTMLElement} element DOM元素或者ID
 * @param {JSON}        options 类实例化时的参数配置
 * @return {fx}     效果类的实例
 */
mz.fx.fadeOut = function(element, options) {
    if (!(element = mz.dom(element))) return null;

    var fx = mz.fx.opacity(element,
        mz.object.extend({from:1, to:0, restoreAfterFinish:true}, options||{})
    );
    fx.addEventListener("onafterfinish", function(){this.element.style.display = "none";});
    fx._className = "mz.fx.fadeOut";

    return fx;
};
