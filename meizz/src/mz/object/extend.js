/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 拷贝某对象的所有属性/方法
 * 
 * @author: meizz
 * @namespace: mz.object.extend
 * @version: 2010-01-23
 * 
 * @param {Object} obj JS对象
 * @param {JSON} json 被合并的JSON对象
 * @param {JSON} defaults 合并操作前JS对象的初始值
 * @return {Object} 合并后的JS对象
 */
mz.object.extend = function(obj, json, defaults) {
    if(defaults) {
        mz.object.extend(obj, defaults);
    }

    if(obj && json && typeof json == "object") {
        for(var p in json) {
            json.hasOwnProperty(p) && (obj[p] = json[p]);
        }
    }
    return obj;
};