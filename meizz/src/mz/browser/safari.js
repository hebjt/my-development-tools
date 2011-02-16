/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 判断浏览器是否为 safari 浏览器
 * 值为浏览器版本号，若值为 0 则表示浏览器不是 safari
 * 
 * @author: meizz
 * @namespace: mz.browser.safari
 * @version: 2010-01-23
 */
mz.browser.safari = /Version\/(\d+(\.\d+)*)\s+Safari\/\d+/.test
    (navigator.userAgent) ? parseFloat(RegExp["\x241"]) : 0;
