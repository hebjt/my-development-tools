/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 通用 AJAX 向 Server 端发起请求
 * 
 * @author: meizz
 * @create: 2010-07-26
 * @namespace: mz.ajax.request
 *
 * @param   {String}    url         请求的 URL
 * @param   {Object}    options     配置参数
 * @return  {Object}                XMLHttpRequest 对象
 */
mz.ajax.request = function(url, options) {
    var op          = options || {}
        ,data       = op.data || ""
        ,async      = !(op.async === false)
        ,username   = op.username || ""
        ,password   = op.password || ""
        ,method     = (op.method || "GET").toUpperCase()
        ,headers    = op.headers || {}
        ,eventHandlers = {}
        ,key, xhr;

    for (key in op) {
        typeof op[key] == "function" && (eventHandlers[key] = op[key]);
    }
    
    // 打一个烙印
    headers["X-Request-By"] = "mz.ajax";
    

    
    // 获取 XMLHttpRequest 对象实例
    function getInstance() {
        if (window.ActiveXObject) {
            try {return new ActiveXObject("Msxml2.XMLHTTP");}catch(e){
            try {return new ActiveXObject("Microsoft.XMLHTTP");}catch(e){}}
        }
        if (window.XMLHttpRequest) {
            return new XMLHttpRequest();
        }
    }

    // 派发事件
    function dispatch(type) {
        type.indexOf("on") != 0 && (type = "on"+ type);

        var handler = eventHandlers[type],
            globelHandler = mz.ajax[type];
        
        if (handler) handler(xhr, xhr.responseText);
        else if (globelHandler && type != "onsuccess") globelHandler(xhr);
    }

    // 请求结束后执行
    function stateChangeHandler() {
        if (xhr.readyState == 4) {
            // 在请求时，如果网络中断，Firefox会无法取得status
            try {var stat = xhr.status;}catch(ex){dispatch("onfailure");return}
            
            dispatch("on"+ stat);
            
            // IE error sometimes returns 1223 when it 
            // should be 204, so treat it as success
            if ((stat >= 200 && stat < 300) || stat == 304 || stat == 1223) {
                dispatch("onsuccess");
            } else {
                dispatch("onfailure");
            }
            
            /*
             * NOTE: Testing discovered that for some bizarre reason, on Mozilla, the
             * JavaScript <code>XmlHttpRequest.onreadystatechange</code> handler
             * function maybe still be called after it is deleted. The theory is that the
             * callback is cached somewhere. Setting it to null or an empty function does
             * seem to work properly, though.
             * 
             * On IE, there are two problems: Setting onreadystatechange to null (as
             * opposed to an empty function) sometimes throws an exception. With
             * particular (rare) versions of jscript.dll, setting onreadystatechange from
             * within onreadystatechange causes a crash. Setting it from within a timeout
             * fixes this bug (see issue 1610).
             * 
             * End result: *always* set onreadystatechange to an empty function (never to
             * null). Never set onreadystatechange from within onreadystatechange (always
             * in a setTimeout()).
             */
            window.setTimeout(
                function() {
                    // 避免内存泄露
                    xhr.onreadystatechange = new Function();
                    async && (xhr = null);
                }, 1);
        }
    }



    try {
        xhr = getInstance();
        
        if (method == 'GET') {
            op["noCache"] && (data += (data ? "&" : "")
                +"mz"+ (new Date().getTime().toString(36)) +"=1");

            data && (url += (url.indexOf("?") > 0 ? "&" : "?") + data);
        }
        
        if (username) { xhr.open(method, url, async, username, password);}
        else {xhr.open(method, url, async);}
        
        async && (xhr.onreadystatechange = stateChangeHandler);
        
        // 在open之后再进行http请求头设定
        if (method == 'POST') {
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        }
        
        for (key in headers) {
            if (headers.hasOwnProperty(key)) {
                xhr.setRequestHeader(key, headers[key]);
            }
        }
        
        dispatch("onbeforerequest");
        xhr.send(data);
        
        !async && stateChangeHandler();

    } catch (ex) {
        dispatch("onfailure");
    }
    
    return xhr;
};