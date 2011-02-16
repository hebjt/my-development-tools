/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.browser.ie;
/// include mz.browser.firefox;
/// include mz.base.Event;
/// include mz.base.single;
/// include mz.event.attach;
/// include mz.dom.insertHTML;
/// include mz.dom.getPosition;
/// include mz.page.createStyleSheet;

/**
 * 创建一个 Popup 层
 * 
 * @namespace: mz.ui.createPopup
 * @author: meizz
 * @create: 2010-06-08
 * @version: 2010-07-07
 *
 * @param   {JSON}      options     配置信息
 */
mz.ui.createPopup = function(options) {
    var popup = mz.base.single({isOpen : false});
    popup.eid = "mzpopup_"+ popup.puid;

    // IE 浏览器使用系统的 window.createPopup()
    var POPUP, IFRAME,
        bodyStyle = "font-size:12px; margin:0;";
    try {mz.browser.ie && (POPUP = window.createPopup());}catch(ex){}

    // 非 IE 浏览器使用 <iframe> 作为 popup 的载体
    if (!POPUP) {
        var str = "<iframe id='"+ popup.eid +"' scrolling='no'"+
            " frameborder='0' style='position:absolute; z-index:1; "+
            " width:0px; height:0px; background-color:#0FFFFF'></iframe>";
        if (!document.body) {document.write(str);} else {
            mz.dom.insertHTML(document.body, "afterbegin", str);
        }
    }

    /**
     * 启动 popup 的初始化程序
     */
    popup.render = function() {
        var me = this;
        if (POPUP) {   // window.createPopup()
            me.window = POPUP;
            me.document = POPUP.document;
            var s = me.styleSheet = me.createStyleSheet();
            s.addRule("body", bodyStyle);
            me.dispatchEvent("onready");
        } else {
            // 初始化 iframe
            initIframe();
        }
        mz.event.attach(window, "onblur", function(){
            me.focusme = false;
            if (!me.isOpen) return;
            setTimeout(function(){if(!me.focusme) me.hide()}, 100);
        });
        mz.event.attach(window, "onresize", function(){me.hide()});
        mz.event.attach(document, "onmousedown", function(){me.hide()});
    };

    function initIframe(delay) {
        IFRAME = mz.dom(popup.eid);

        // 修正Firefox的一个BUG
        // Firefox 对于刚刚动态创建的 <iframe> 写入的时候无法渲染内容
        if ((!delay && mz.browser.firefox) || !IFRAME) {
            setTimeout(function(){initIframe(true)}, 10);
            return;
        }

        popup.window = IFRAME.contentWindow;
        var d = popup.document = popup.window.document;
        var s = "<html><head><style type='text/css'>"+
            "body{"+ bodyStyle +" background-color:#FFFFFF;}\n"+
            "</style></head><body onfocus='parent.mzInstance(\""+
            popup.puid +"\").focusme=true'></body></html>";
        d.open(); d.write(s); d.close();
        popup.styleSheet = popup.createStyleSheet();
        popup.dispatchEvent("onready");
    }

    /**
     * 创建 popup 层里的 style sheet 对象
     */
    popup.createStyleSheet = function(op) {
        op = op || {};
        op.document = this.document;
        return mz.page.createStyleSheet(op);
    };

    /**
     * 显示 popup 层
     */
    popup.show = function(left, top, width, height, trigger) {
        if (POPUP) {
            POPUP.show(0, trigger.offsetHeight, width, height, trigger || document.body);
            this.isOpen = POPUP.isOpen;
        } else if (IFRAME) {
            mz.dom(this.eid).style.display = "";
            this.isOpen = true;
            var s = IFRAME.style;
            s.width = width +"px";
            s.height = height +"px";
            s.top = (top + trigger.offsetHeight) +"px";
            s.left = left +"px";
        }
        this.dispatchEvent("onshow");
    };

    /**
     * 显示 popup 层
     */
    popup.bind = function(trigger, width, height, position) {
        var pos = mz.dom.getPosition(trigger);
        if (position == "top") pos.top = pos.top - height - trigger.offsetHeight;
        this.show(pos.left, pos.top, width, height, trigger);
    };

    /**
     * 隐藏 popup 层
     */
    popup.hide = function() {
        if (this.isOpen) {
            if (POPUP) {
                POPUP.hide();
                this.isOpen = POPUP.isOpen;
            } else if (IFRAME) {    // iframe mode
                this.isOpen = false;

                var s = IFRAME.style;
                s.width = "0px";
                s.height = "0px";
                mz.dom(this.eid).style.display = "none";
            }
            this.dispatchEvent("onhide");
        }
    };

    /**
     * 向 popup 层写入内容
     */
    popup.write = function(str) {
        var me = this;
        this.document.body.innerHTML = str;
        //this.document.close();
    };

    return popup;
};