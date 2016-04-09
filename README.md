# harbour-hexclock
SailfishOS app showing the time as colour:
The Hexclock displays the current time hh:mm:ss as colour #hhmmss.

## About
This is the public repository of **harbour-hexclock**, a "different type of clock" for *SailfishOS* (that is the operating system running on Jolla phones). The **Hexclock** app submitted to the *SailfisOS Harbour* recently is build using this sources.

Feel free to consult the source code for learning more about writing QML apps using JavaScript – not only restricted to SailfishOS apps.

## Description
The time is typically given as hh:mm:ss. Colours in RGB are given as #rrggbb. So in both cases we have a triplet of two digits. Let us combine these into colours specified by the time: #rrggbb = #hhmmss. That is what Hexclock does: It takes the current time and takes red for the hours, green for the minutes and blue for the seconds. So we have a "coloured representation" of the current time. That's it!

## Bugs, Ideas, …
If there is anything that could be improved, do not hesitate contacting me or forking this repository. Have fun!
