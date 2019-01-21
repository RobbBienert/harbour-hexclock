/* a Label for a partial of the page
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

Label {
    property int divisor: parent.columns
    property int padding: Theme.paddingMedium

    width: parent.width/divisor - (divisor+1) * padding
    horizontalAlignment: Text.AlignHCenter
}

