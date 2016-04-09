/* AboutPage
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../types"

Page {
    id: aboutPage

    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: col.height + Theme.paddingLarge

        Column {
            id: col
            spacing: Theme.paddingLarge
            width: parent.width
            height: header.height + about.implicitHeight + copyright.implicitHeight + license.implicitHeight + 4 * spacing
            anchors.leftMargin: Theme.paddingMedium
            anchors.rightMargin: Theme.paddingMedium

            PageHeader {
                id: header
                title: qsTr("About Hexclock")
            }

            SailText {
                id: about
                text: qsTr("displaying the time as colour<br>idea from <a href=\"http://www.kraftfuttermischwerk.de/blogg/die-uhrzeit-als-hexadezimale-farbdefinition/\">kraftfuttermischwerk.de</a>")
                textFormat: Text.StyledText
                onLinkActivated: Qt.openUrlExternally(link)
            }
            SailText {
                id: copyright
                text: qsTr("Copyright © 2016 Robert Bienert")
            }

            SailText {
                id: license
                text: qsTr("This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.<br>This program is distributed in the hope that it will be useful, but <strong>without any warranty</strong>; without even the implied warranty of <strong>merchantability</strong> or <strong>fitness for a particular purpose</strong>. <a href=\"http://www.gnu.org/licenses/gpl-3.0\">See the GNU General Public License for more details.</a>")
            }
        }
        ScrollDecorator {}
    }
}
