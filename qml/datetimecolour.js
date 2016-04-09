/* datetimecolour library
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

/* The model has to implement the following methods:
 * upDate():    update its internal date/time values
 * getHours()
 * getMinutes()
 * getSeconds()
 */
var model = null;

function upDate() {
    if (! model)
        return [0, 0, 0];

    model.upDate();

    return [format(model.getHours(), 2),
            format(model.getMinutes(), 2),
            format(model.getSeconds(), 2)];
}

/* logarithm for base 10
 */
function lg(n) {
    if (n < 1) return 0;

    return Math.log(n)/Math.LN10;
}

/* zero padding
 */
function format(no, digits) {
    var nod = parseInt(lg(no)) + 1;
    var zeros = digits - nod;
    no = String(no);

    for (var i = 0; i < zeros; ++i)
        no = '0' + no;

    return no;
}

function name() {
    var dt = upDate();

    return dt[0] + ':' + dt[1] + ':' + dt[2];
}

function colour() {
    var dt = upDate();

    return '#' + dt[0] + dt[1] + dt[2];
}
