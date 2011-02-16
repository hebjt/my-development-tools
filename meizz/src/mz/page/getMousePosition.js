/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.dom;
/// include mz.event.attach;
/// include mz.page.getScrollTop;
/// include mz.page.getScrollLeft;

/**
 * 取得当前页面里的目前鼠标所在的坐标（x y）
 * 
 * @author: meizz
 * @namespace: mz.page.getMouseCoords
 * @version: 2010-05-23
 * @modified: 2010-10-30
 *
 * @return  {JSON}              当前鼠标的坐标值({x, y})
 */
(function(){

    mz.page.getMouseCoords = function(){
        return {
            x : mz.page.getScrollLeft() + xy.x,
            y : mz.page.getScrollTop() + xy.y
        };
    };

    var xy = {x:0, y:0};
    function mm(e) {
        e = window.event || e;
        xy.x = e.clientX;
        xy.y = e.clientY;
    }

    // 监听当前网页的 mousemove 事件以获得鼠标的实时坐标
    mz.event.attach(document, "onmousemove", mm);

})();

// [TODO 20100908] 右键菜单弹出时，onmousemove事件失效，此时会导致坐标值不准而带来一个跳跃的BUG，暂时的修复见 mz.dom.drag