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
            height: totalHeight()
            anchors.leftMargin: Theme.paddingMedium
            anchors.rightMargin: Theme.paddingMedium

            function totalHeight() {
                var h = 0;
                var l = col.children.length;

                for (var i = 0; i < l; ++i)
                    h += col.children[i].height;

                return h + l * col.spacing;
            }

            PageHeader {
                id: header
                title: qsTr("About Hexclock")
            }

            SailText {
                id: version
                text: 'Hexclock Version 0.2'
            }

            TextWithLink {
                id: about
                text: qsTr("displaying the time as colour<br>idea from") + " <a href=\"http://www.kraftfuttermischwerk.de/blogg/die-uhrzeit-als-hexadezimale-farbdefinition/\">" + "<font color=\"" + Theme.highlightColor + "\">kraftfuttermischwerk.de</font></a>"
            }
            SailText {
                id: copyright
                text: qsTr("Copyright © 2016 Robert Bienert")
            }

            TextWithLink {
                id: license
                text: qsTr("This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.<br>This program is distributed in the hope that it will be useful, but <strong>without any warranty</strong>; without even the implied warranty of <strong>merchantability</strong> or <strong>fitness for a particular purpose</strong>.") +  ' <a href="http://www.gnu.org/licenses/gpl-3.0"><font color="' + Theme.highlightColor + '">' + qsTr("See the GNU General Public License for more details.</font></a>")
            }
        }
        ScrollDecorator {}
    }
}
