/*
 * JavaScript framework: mz
 * Copyright (c) 2010 meizz, http://www.meizz.com/
 *
 * http://www.meizz.com/mz/license/ MIT-style license
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 */


/**
 * 轮循数组的每一项，作为某个程序的参数
 * 
 * @author: meizz
 * @namespace: mz.array.each
 * @version: 2010-01-23
 *
 * @param {Object}      array   Array对象
 * @param {Function}    fn      处理程序
 * @param {Object}      context [可选]fn处理函数的宿主
 * @return {Object}     被轮循的那个数组/JSON对象
 */
mz.array.each = function(array, fn, context) {
    if (array && typeof fn == "function") {
        for (var i=0; i<array.length; i++) { /* array*/
            //被循环执行的函数，默认会传入三个参数(array[i], i, array)
            var result = fn.call(context||null, array[i], i, array);

            //被循环执行的函数的返回值若为"continue"和"break"时可以影响each方法的流程
            if (result == "continue") {continue;}
            else if (result == "break") {break;}
        }
    }
    return array;
};