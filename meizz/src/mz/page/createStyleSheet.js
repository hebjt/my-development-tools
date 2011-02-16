/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */

/// include mz.browser.ie;
/// include mz.dom.insertHTML;

/**
 * 创建CSS样式集对象 style sheet
 * 
 * @namespace: mz.page.createStyleSheet
 * @author: meizz
 * @create: 2010-06-12
 * @version: 2010-07-07
 *
 * @param   {JSON}      options     配置信息
 * @config  {Document}  document    指定在哪个document下创建，默认是当前文档
 * @config  {String}    url         css文件的URL
 * @config  {Number}    index       在文档里的排序索引
 * @return  {Object}                styleSheet对象
 */
mz.page.createStyleSheet = function(options){
    var op = options || {},
        doc = op.document || document;

    if (mz.browser.ie) {
        return doc.createStyleSheet(op.url, op.index);
    } else {
        var s = "<style type='text/css'></style>";
        op.url && (s="<link type='text/css' rel='stylesheet' href='"+op.url+"'/>");
        mz.dom.insertHTML(doc.getElementsByTagName("HEAD")[0],"beforeEnd",s);


        var sheet = doc.styleSheets[doc.styleSheets.length - 1],
            rules = sheet.rules || sheet.cssRules;
        return {
            self : sheet
            ,rules : sheet.rules || sheet.cssRules
            ,addRule : function(selector, style, i) {
                if (sheet.addRule) {
                    return sheet.addRule(selector, style, i);
                } else if (sheet.insertRule) {
                    isNaN(i) && (i = rules.length);
                    return sheet.insertRule(selector +"{"+ style +"}", i);
                }
            }
            ,removeRule : function(i) {
                if (sheet.removeRule) {
                    sheet.removeRule(i);
                } else if (sheet.deleteRule) {
                    isNaN(i) && (i = 0);
                    sheet.deleteRule(i);
                }
            }
        }
    }
};
/*
 * styleSheet对象 有两个方法 
 *  addRule(selector, style, i)
 *  removeRule(i)
 *  这两个方法已经做了浏览器兼容处理
 * 一个集合
 *  rules
 */