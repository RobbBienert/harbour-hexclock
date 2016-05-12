.pragma library
.import QtQuick.LocalStorage 2.0 as Sql

/* loading and saving settings using the LocalStorage
 *
 * Copyright (C) 2016 Robert Bienert
 * project harbour-hexclock
 *
 * Idea and demo code as described in:
 * http://doc.qt.io/qt-5/qtquick-localstorage-localstorage-hello-qml.html
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU General Public License <http://www.gnu.org/licenses/gpl-3.0>
 * for more details.
 */

// constants
var MainName = 'ColourBox';
var MainInt = 1000;
var CoverName = 'CoverPage';
var CoverInt = 1000;
var SimulName = 'Simulation';
var SimulInt = 100;

// database connection
var _db = Sql.LocalStorage.openDatabaseSync("HexClock", "1.0", "HexClock Settings");

// init
_db.transaction(function(tx) {
    tx.executeSql('CREATE TABLE IF NOT EXISTS times (id INTEGER PRIMARY KEY AUTOINCREMENT, name TINYTEXT, interval INTEGER)');
});


function setTime(name, interval) {
    _db.transaction(function(tx){
        var res = tx.executeSql('UPDATE times SET interval=? WHERE name=?',
                      [interval, name]);
    });
}


function setTimes(times) {
    for (var i = 0; i < times.length; ++i)
        setTime(times[i][0], times[i][1]);
}


function time(name, defaultInterval) {
    var res = null;

    _db.transaction(function(tx) {
        res = tx.executeSql('SELECT id, name, interval FROM times WHERE name=?', [name]);
    });

    if (res.rows.length >= 1)
        return res.rows.item(0).interval;

    _db.transaction(function(tx) {
        tx.executeSql('INSERT INTO times (name, interval) VALUES (?,?)',
                      [name, defaultInterval]);
    });
    return defaultInterval;
}


function timeS(name, defaultInterval) {
    return time(name, defaultInterval) / 1000;
}


/*
function get() {
    var resa = Array();

    _db.transaction(function(tx) {
        var res = tx.executeSql('SELECT id, colour, name FROM colours');
        var rows = res.rows;

        for (var i = 0; i < rows.length; ++i) {
            resa.push({theId: rows.item(i).id, colour: rows.item(i).colour, name: rows.item(i).name});
        }
    });

    return resa;
}


/*
function remove(itemId) {
    _db.transaction(function(tx) {
        tx.executeSql('DELETE FROM colours WHERE id=?', [itemId]);
    });
}
*/
