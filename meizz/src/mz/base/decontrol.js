/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 解除 window[mz.puid]._instances 对所有类实例的引用关系
 * 
 * @author: meizz
 * @namespace: mz.base.decontrol
 * @version: 2010-05-09
 *
 * @param   {String}    puid    类的唯一标识
 */
mz.base.decontrol = function(puid) {
    var i = window[mz.puid]["\x06instances"];
    i && (delete i[puid]);
};
