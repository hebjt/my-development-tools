/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom.getStyle;
/// include mz.event.attach;
/// include mz.event.detach;
/// include mz.object.extend;
/// include mz.event.preventDefault;
/// include mz.page.getMouseCoords;

/**
 * 拖曳一个 DOM 元素
 * 20100625 添加cursorAt 属性"x y"，标识拖曳起始时元素与鼠标的坐标偏移量
 * 20101116 添加mouseEvent，主要是drag方法启动时的鼠标坐标，可以解决getMouseCoords不准的问题
 * 
 * @author: meizz
 * @namespace: mz.dom.drag
 * @version: 2010-01-23
 *
 * @param   {HTMLElement/String}    element 被拖曳的DOM元素
 * @param   {JSON}                  options 拖曳配置项
 *          {autoStop, interval, capture, range,    cursorAt,   mouseEvent, ondragstart, ondragend, ondrag}
 *           boolean   number    boolean  array     "x y"       Event       function     function   function
 */
(function(){
    var target, // 被拖曳的DOM元素
        op, ox, oy, timer, top, left, mozUserSelect;
    
    mz.dom.drag = function(element, options) {
        if (!(target = mz.dom(element))) return false;
        op = mz.object.extend({
            autoStop:true   // false 用户手动结束拖曳 ｜ true 在mouseup时自动停止拖曳
            ,capture : true // 鼠标拖曳粘滞
            ,interval : 20  // 拖曳行为的触发频度（时间：毫秒）
        }, options);

        top = parseInt(mz.dom.getStyle(target, "top")) || 0;
        left= parseInt(mz.dom.getStyle(target, "left"))|| 0;

        // [20100908] 在右键菜单弹出的时候 onmousemove 事件失效；
        // 而当元素发生 onmousedown 触发drag操作时，优先级要高于 document.onmousemove
        // 因此导致取得的坐标值有一个跳跃，因此使用延时来补救之，但延时会破坏代码的先后执行顺序，以后待改之
        setTimeout(function(){
            var xy = mz.page.getMouseCoords();  // 得到当前鼠标坐标值
            ox = xy.x;  oy = xy.y; clearTimeout(timer);

            timer = setInterval(render, op.interval);
        },  1);

        // 这项为 true，缺省在 onmouseup 事件终止拖曳
        op.autoStop && mz.event.attach(document, "mouseup", mouseUp);

        // 在拖曳过程中页面里的文字会被选中高亮显示，在这里修正
        mz.event.attach(document.body, "selectstart", unselect);

        // 设置鼠标粘滞
        if (op.capture && target.setCapture) {
            target.setCapture();
        } else if (op.capture && window.captureEvents) {
            window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);
        }

        // fixed for firefox
        mozUserSelect = document.body.style.MozUserSelect;
        document.body.style.MozUserSelect = "none";

        // ondragstart 事件
        typeof op.ondragstart == "function" && op.ondragstart(target, op);

        return {stop: stop, dispose:stop, update:function(option){}};
    };

    // dispose 20101003
    function dispose() {
        stop();
    }

    // 停止拖曳
    function stop() {
        clearTimeout(timer);

        // 解除鼠标粘滞
        if (op.capture && target.releaseCapture) {
            target.releaseCapture();
        } else if (op.capture && window.captureEvents) {
            window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);
        }

        // 拖曳时网页内容被框选
        document.body.style.MozUserSelect = mozUserSelect;
        mz.event.detach(document.body, "selectstart", unselect);

        // ondragend 事件
        typeof op.ondragend == "function" && op.ondragend(target, op);
    }

    // 对DOM元素进行top/left赋新值以实现拖曳的效果
    function render(e) {
        var rg = op.range,
            xy = mz.page.getMouseCoords(),
            el = left + xy.x - ox,
            et = top  + xy.y - oy;

        // 如果用户限定了可拖动的范围
        if (typeof rg == "object" && rg && rg.length == 4) {
            el = Math.max(rg[3], el);
            el = Math.min(rg[1] - target.offsetWidth,  el);
            et = Math.max(rg[0], et);
            et = Math.min(rg[2] - target.offsetHeight, et);
        }

        target.style.top  = et +"px";
        target.style.left = el +"px";

        typeof op.ondrag == "function" && op.ondrag(target, op);
    }

    // 在 document.onmouseup 事件时对事件监听进行对应的解除绑定操作
    function mouseUp(e){
        stop();
        mz.event.detach(document, "mouseup", mouseUp);
    }

    // 对document.body.onselectstart事件进行监听，避免拖曳时文字被选中
    function unselect(e) {
        return mz.event.preventDefault(e, false);
    }
})();

// [TODO] 20100625 添加cursorAt属性，absolute定位的定位的元素在不设置top|left值时，初始值有问题，得动态计算
// [TODO] 20101101 在drag方法的返回对象中添加 dispose() 方法析构drag