import QtQuick 2.0
import Sailfish.Silica 1.0

/*
ColorPicker {
    property int divisor: 1
    property int padding: Theme.paddingMedium

    width: parent.width/divisor - (divisor-1) *padding
    height: width

    colors: ['red', 'green', 'blue']

    onColorChanged: {
        console.log(color)
    }
}
*/

Rectangle {
    property int divisor: 1
    property int padding: Theme.paddingMedium

    width: parent.width/divisor - (divisor-1) * padding
    height: width
    radius: padding

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(parent.color)
            if (Qt.colorEqual(parent.color, 'green'))
                console.log('grün')
        }
    }
}

/*
ListView {
    property int divisor: 1
    property int padding: Theme.paddingMedium

    width: parent.width/divisor - (divisor+1) * padding

    model: ColourModel {}
    delegate: Text {
        text: label
    }
}
*/
