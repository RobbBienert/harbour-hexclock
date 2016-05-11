/* simulation mode
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../types"
import "../LoopModel.js" as LoopModel
import "../Settings.js" as Settings

Page {
    id: page

    Column {
        spacing: Theme.paddingLarge
        width: parent.width

        PageHeader {
            id: header
            title: qsTr("Simulation")
        }

        Row {
            width: parent.width - 2 * Theme.paddingLarge

            TextField {
                id: interval
                placeholderText: Settings.time('Simulation', 100).toString()
                text: placeholderText
                width: parent.width / 2
                horizontalAlignment: Text.AlignLeft
                inputMethodHints: Qt.ImhDigitsOnly
                label: qsTr("Timer Interval/ms")
            }
            StartStopButton {
                id: btnStart
                onClicked: {
                    // toggled is set in the base class!
                    if (toggled) {
                        colourBox.timerInterval = parseInt(interval.text)
                        colourBox.timerAutostart = true

                        Settings.setTime('Simulation', colourBox.timerInterval, 100)
                    }
                    else {
                        colourBox.timerAutostart = false
                    }
                }
            }
        }

        ColourBox {
            id: colourBox
            timerInterval: parseInt(interval.text)
            timerAutostart: false
            model: new LoopModel.LoopModel()
            parentPage: page
        }
    }
}
