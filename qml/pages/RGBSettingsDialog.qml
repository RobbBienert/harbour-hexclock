import QtQuick 2.0
import Sailfish.Silica 1.0
import "../types"

ColourDialogBase {
    id: prefPage
    modelID: 0

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + 2*column.spacing

        Column {
            id: column
            spacing: Theme.paddingMedium
            width: parent.width
            //height: header.height + secTimeColour.height + gridTimeColour.height + 6*spacing

            PageHeader {
                id: header
                title: qsTr('Colour Settings')
            }

            SectionHeader {
                id: secTimeColour
                text: qsTr('Time ↔ Colours')
            }
            Grid {
                id: gridTimeColour
                width: parent.width
                columns: 3
                spacing: parent.spacing
                x: spacing

                PartialLabel {
                    text: qsTr('Hour')
                }
                PartialLabel {
                    text: qsTr('Minute')
                }
                PartialLabel {
                    text: qsTr('Second')
                }

                ColourList {
                    color: 'red'
                    divisor: 3
                }
                ColourList {
                    color: 'green'
                    divisor: 3
                }
                ColourList {
                    color: 'blue'
                    divisor: 3
                }
            }

            SectionHeader {
                id: secColourRanges
                text: qsTr('Colour Ranges')
            }

            Row {
                id: rowRanges
                width: parent.width

                TextSwitch {
                    id: checkPlainRange
                    width: parent.width / 2
                    text: qsTr('0–59')

                    onCheckedChanged: {
                        slidePlainRange.enabled = checked
                        checkFullRange.checked = false
                    }
                }
                TextSwitch {
                    id: checkFullRange
                    width: parent.width / 2
                    text: qsTr('Full [0–255]')

                    onCheckedChanged: {
                        checkPlainRange.checked = false
                    }
                }
            }
            Slider {
                id: slidePlainRange
                width: parent.width
                minimumValue: 0
                maximumValue: 196
                value: 0
                stepSize: 1.
                enabled: false
                label: qsTr('Shift Colours')
                valueText: '' + value + '–' + (59+value)
            }

            TextSwitch {
                id: checkColourInvert
                text: qsTr('Invert Colour Table')
            }
        }
        ScrollDecorator {}
    }

    onAccepted: {
        console.log('saving new colour settings!')
    }

    Component.onCompleted: {
        console.log('loading colour …')
    }
}
