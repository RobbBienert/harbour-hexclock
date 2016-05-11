/* ColourBox type
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../types"
import "../datetimecolour.js" as DateTimeColour
import "../DateTimeModel.js" as DateTimeModel
import "../Settings.js" as Settings


Rectangle {
    // read-write properties
    property int timerInterval: Settings.time('ColourBox', 1000)
    property bool timerAutostart: true
    property var model: new DateTimeModel.DateTimeModel()
    property var timeLabel: null
    property var parentPage: parent
    property int labelSize: Theme.fontSizeHuge

    // read-only properties
    property string tmplTime: qsTr("Time %1 …")
    property var colourObject: DateTimeColour


    id: colourtime
    x: Theme.paddingLarge
    radius: Theme.paddingLarge
    color: DateTimeColour.colour()
    border.width: Theme.paddingSmall
    border.color: Theme.highlightColor
    // adjust size to square fitting onto page
    anchors.horizontalCenter: parentPage.isPortrait ? parent.horizontalCenter : undefined
    //anchors.horizontalCenter: parent.horizontalCenter
    //width: (parentPage.isPortrait ? parent.height : parent.width) - 2 * Theme.paddingLarge
    width: parent.width - 2 * Theme.paddingLarge
    height: width

    Label {
        id: colourHex
        x: Theme.paddingLarge
        color: "white"
        anchors.centerIn: parent
        font.pixelSize: labelSize
        text: DateTimeColour.colour()
    }

    Component.onCompleted: {
        DateTimeColour.model = model
    }

    Timer {
        id: timer
        interval: parent.timerInterval
        running: parent.timerAutostart
        repeat: true
        onTriggered: {
            colourtime.color = DateTimeColour.colour()
            colourHex.text  = DateTimeColour.colour()
            if (timeLabel)
                timeLabel.text = tmplTime.arg(DateTimeColour.name())
        }
    }
}
