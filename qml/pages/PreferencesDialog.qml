import QtQuick 2.0
import Sailfish.Silica 1.0
import "../types"
import "../Settings.js" as Settings

Dialog {
    id: prefPage

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: col.height + 2*col.spacing

        Column {
            id: col
            spacing: Theme.paddingMedium
            width: parent.width
            height: totalHeight()

            function totalHeight() {
                var h = 0;
                var l = col.children.length;

                for (var i = 0; i < l; ++i)
                    h += col.children[i].height;

                return h + l * col.spacing;
            }

            DialogHeader {
                id: header
                title: qsTr('Preferences')
            }

            /*
            Grid {
                id: rowColours
                height: secColours.height
                width: parent.width
                columns: 2

                Label {
                    id: secColours
                    text: qsTr('Colour Settings')
                }
                IconButton {
                    icon.source: "image://theme/icon-m-right"
                    onClicked: pageStack.push(Qt.resolvedUrl("ColourSettingsDialog.qml"))
                }
            }
            */

            SectionHeader {
                id: secRefresh
                text: qsTr('Refresh Intervals')
            }
            Grid {
                id: rowRefresh
                width: parent.width - 2*parent.spacing
                anchors.horizontalCenter: parent.horizontalCenter
                columns: 2

                Label {
                    text: qsTr('Main Page')
                }

                TextField {
                    id: inRefreshMain
                    width: parent.width / parent.columns
                    text: Settings.timeS(Settings.MainName, Settings.MainInt)
                    inputMethodHints: Qt.ImhDigitsOnly
                    label: qsTr('time in seconds')
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-enter-accept"
                    EnterKey.onClicked: prefPage.accept()
                }

                Label {
                    text: qsTr('App Cover')
                }

                TextField {
                    id: inRefreshCover
                    width: parent.width / parent.columns
                    text: Settings.timeS(Settings.CoverName, Settings.CoverInt)
                    inputMethodHints: Qt.ImhDigitsOnly
                    label: qsTr('time in seconds')
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-enter-accept"
                    EnterKey.onClicked: prefPage.accept()
                }

                Label {
                    text: qsTr('Simulation')
                }
                TextField {
                    id: inRefreshSimulation
                    width: parent.width / parent.columns
                    text: Settings.time(Settings.SimulName, Settings.SimulInt)
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    label: qsTr('time in miliseconds')
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-enter-accept"
                    EnterKey.onClicked: prefPage.accept()
                }
            }
        }
        ScrollDecorator {}
    }

    onAccepted: {
        var refrMain = parseInt(inRefreshMain.text) * 1000;
        var refrCover = parseInt(inRefreshCover.text) * 1000;
        var refrSimul = parseInt(inRefreshSimulation.text)

        Settings.setTimes([[Settings.MainName, refrMain],
                           [Settings.CoverName, refrCover],
                           [Settings.SimulName, refrSimul]]);
    }
}
