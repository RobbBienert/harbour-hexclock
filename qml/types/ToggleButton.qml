/* a button that can be toggled between two states
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 *
 * Usage:
 * ToggleButton {
 *  id: theId
 *  onClicked: {
 *      // toggled is already set
 *      if (toggled) {
 *          // …
 *      }
 *      else {
 *          // …
 *      }
 *  }
 * }
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

Button {
    property bool toggled: false
    property string textToggled: "active"
    property string textUnToggled: "inactive"

    text: toggled ? textUnToggled : textToggled

    onClicked: {
        if (toggled) {
            toggled = false
            text    = textToggled
        }
        else {
            toggled = true
            text    = textUnToggled
        }
    }
}
