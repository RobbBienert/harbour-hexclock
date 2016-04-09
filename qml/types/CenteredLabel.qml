/* a centered Label
 *
 * Copyright © 2016 Robert Bienert <robertbienert@gmx.net>
 *
 * project harbour-hexclock
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

Label {
    y: Theme.paddingLarge
    width: parent.width - 2 * Theme.paddingLarge
    horizontalAlignment: Text.AlignHCenter
    color: Theme.secondaryHighlightColor
    font.pixelSize: Theme.fontSizeExtraLarge
}
