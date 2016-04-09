/* Implementation of a simple for loop faking the time
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

function LoopModel() {
    this.h = 0;
    this.m = 0;
    this.s = 0;

    // methods
    this.upDate = function() {
        ++this.s;
        if (60 == this.s) {
            this.s = 0;

            ++this.m
            if (60 == this.m) {
                this.m = 0;

                this.h = (this.h + 1) % 24;
            }
        }
    }

    this.getHours   = function() { return this.h; }
    this.getMinutes = function() { return this.m; }
    this.getSeconds = function() { return this.s; }
}
