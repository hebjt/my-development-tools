/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.fx.zoomOut;
/// include mz.object.extend;

/**
 * 将DOM元素放大，关逐渐透明消失
 * 
 * @namespace: mz.fx.puff
 * @author: meizz
 * @create: 2010-07-14
 * @version: 2010-07-14
 *
 * @param   {HTMLElement}   element     DOM元素或者ID
 * @param   {JSON}          options     类实例化时的参数配置
 *          {transformOrigin, from,     to}
 *          {"0px 0px"        number    number}
 * @return  {fx}     效果类的实例
 */
mz.fx.puff = function(element, options) {
    return mz.fx.zoomOut(element,
        mz.object.extend({
            to:1.8
            ,duration:800
            ,transformOrigin:"50% 50%"
        }, options||{})
    );
};
