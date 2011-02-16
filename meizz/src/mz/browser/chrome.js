/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 判断浏览器是否为 chrome 浏览器
 * 值为浏览器版本号，若值为 0 则表示浏览器不是 chrome
 * 
 * @author: meizz
 * @namespace: mz.browser.chrome
 * @version: 2010-01-23
 */
mz.browser.chrome = /Chrome\/(\d+(\.\d+)*)/.test
    (navigator.userAgent) ? parseFloat(RegExp["\x241"]) : 0;
