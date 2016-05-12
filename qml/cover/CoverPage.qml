/* Cover Page
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../types"
import "../Settings.js" as Settings

CoverBackground {
    ColourBox {
        id: colourBox
        y: Theme.paddingLarge
        labelSize: Theme.fontSizeMedium
        timerInterval: Settings.time(Settings.CoverName, Settings.CoverInt)
        // update the colour only when we are active:
        timerAutostart: parent.status == Cover.Active
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            property bool triggered: false
            iconSource: triggered ? "image://theme/icon-cover-play" : "image://theme/icon-cover-pause"
            onTriggered: {
                colourBox.timerAutostart = triggered
                triggered = !triggered
            }
        }
    }
}
