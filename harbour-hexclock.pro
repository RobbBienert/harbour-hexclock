# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-hexclock

CONFIG += sailfishapp

SOURCES += src/harbour-hexclock.cpp

OTHER_FILES += qml/harbour-hexclock.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-hexclock.spec \
    rpm/harbour-hexclock.yaml \
    translations/*.ts \
    harbour-hexclock.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-hexclock-de.ts

DISTFILES += \
    qml/pages/MainPage.qml \
    qml/pages/TestPage.qml \
    qml/datetimecolour.js \
    qml/types/ColourBox.qml \
    qml/pages/AboutPage.qml \
    qml/DateTimeModel.js \
    qml/LoopModel.js \
    qml/types/CenteredLabel.qml \
    qml/types/ToggleButton.qml \
    qml/types/StartStopButton.qml \
    qml/types/PauseButton.qml \
    qml/types/SailText.qml \
    rpm/harbour-hexclock.changes

