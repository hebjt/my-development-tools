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

/// include mz.fx.scale;

/**
 * 将DOM元素放大
 * 
 * @namespace: mz.fx.zoomIn
 * @author: meizz
 * @create: 2010-06-07
 * @version: 2010-07-07
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {JSON}          options     类实例化时的参数配置
 *          {transformOrigin, from,     to}
 *          {"0px 0px"        number    number}
 * @return  {fx}     效果类的实例
 */
mz.fx.zoomIn = function(element, options) {
    return mz.fx.scale(element, mz.object.extend({
        to:1
        ,from:0.1
        ,restoreAfterFinish:true
    }, options||{}));
};
