/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// Include mz.ajax.request;
/// Include mz.object.extend;

/**
 * 向 Server 端 post 递交数据
 * 
 * @author: meizz
 * @create: 2010-07-26
 * @namespace: mz.ajax.post
 *
 * @param   {String}    url         请求的 URL
 * @param   {String}    data        被提交的数据
 * @param   {Function}  onsuccess   提交成功后的回调函数
 * @param   {Object}    options     [可选]配置参数
 * @return  {Object}                XMLHttpRequest 对象
 */
mz.ajax.post = function (url, data, onsuccess, options) {
    return mz.ajax.request(url
        , mz.object.extend(options ||{},
        {
            "method": "POST"
            ,"data": data
            ,"onsuccess": onsuccess
        })
    );
};