/* model for a Date object
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

function DateTimeModel() {
    this._date = new Date();

    // methods
    this.upDate = function() {
        this._date = new Date();
    }

    this.getHours   = function() { return this._date.getHours(); }
    this.getMinutes = function() { return this._date.getMinutes(); }
    this.getSeconds = function() { return this._date.getSeconds(); }
}
