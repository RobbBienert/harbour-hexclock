import QtQuick 2.0
import Sailfish.Silica 1.0
import "../types"

Dialog {
    id: prefPage

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + 2*column.spacing

        Column {
            id: column
            spacing: Theme.paddingMedium
            width: parent.width
            height: header.height + rowColours.height + secRefresh.height + rowRefresh.height + 6*spacing

            PageHeader {
                id: header
                title: qsTr('Preferences')
            }

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

            SectionHeader {
                id: secRefresh
                text: qsTr('Refresh Intervals [s]')
            }
            Row {
                id: rowRefresh
                width: parent.width

                TextField {
                    id: inRefreshMain
                    width: parent.width/2
                    placeholderText: '1.00'
                    inputMethodHints: Qt.ImhDigitsOnly
                    label: qsTr('Main Page')
                }
                TextField {
                    id: inRefreshCover
                    width: parent.width/2
                    placeholderText: '1.00'
                    inputMethodHints: Qt.ImhDigitsOnly
                    label: qsTr('App Cover')
                }
            }
        }
        ScrollDecorator {}
    }

    onAccepted: {
        console.log('saving new settings!')
    }

    Component.onCompleted: {
        console.log('loading …')
    }

    /*
    Component.onDestruction: {
        console.log('saving settings …')
    }

    onRejected: {
        console.log('Leider geil')
    }
    */
}
