/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom.drag;
/// include mz.object.extend;

/**
 * 使元素可被拖曳
 * 
 * @author: meizz
 * @namespace: mz.dom.draggable
 * @version: 2010-05-20
 *
 * @param   {HTMLElement/String}    e       DOM元素或者DOM元素的id
 * @param   {JSON}                  options 拖曳的配置顶
 *          {handler, capture, interval, range, toggle, ondragstart, ondragend, ondraging}
 * @return  {HTMLElement} 对应的DOM元素
 */

mz.dom.draggable = function(e, options) {
    options = mz.object.extend({toggle : function(){return true}}, options || {});
    options.autoStop = true;

    // 拖曳只针对有 position 定位的元素
    if ((e = mz.dom(e)) && mz.dom.getStyle(e, "position") != "static") {
        // 对拖曳的扳机元素监听 onmousedown 事件，以便进行拖曳行为
        mz.event.attach(options.handler || e, "onmousedown", function() {
            // 可以通过配置项里的这个开关函数暂停或启用拖曳功能
            if (typeof options.toggle == "function" && !options.toggle()) return;

            mz.dom.drag(e, options);
        });
    }
};