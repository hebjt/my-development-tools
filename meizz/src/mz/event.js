/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * mz.event 所有与 系统Event 相关的操作方法都在此命名空间之下
 * 
 * @author: meizz
 * @namespace: mz.event
 * @version: 2010-01-23
 */

mz.event = mz.event || {};

window[mz.puid]._listeners = window[mz.puid]._listeners || [];
