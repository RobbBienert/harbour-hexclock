/* application MainPage
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../types"


Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About …")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: qsTr("Simulation")
                onClicked: pageStack.push(Qt.resolvedUrl("TestPage.qml"))
            }
            MenuItem {
                text: qsTr("Preferences")
                onClicked: pageStack.push(Qt.resolvedUrl("PreferencesDialog.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height + Theme.paddingLarge

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge

            CenteredLabel {
                id: time
                text: colourBox.tmplTime.arg(colourBox.colourObject.name())
            }

            CenteredLabel {
                text: qsTr("… as Colour:")
            }

            ColourBox {
                id: colourBox
                timeLabel: time
                parentPage: page
            }

            PauseButton {
                id: btnStart
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    colourBox.timerAutostart = !toggled
                }
            }
        }
    }
}
