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
TARGET = harbour-kat

QT += dbus sql

CONFIG += link_pkgconfig sailfishapp
PKGCONFIG += mlite5

HEADERS +=

SOURCES += \
    src/harbour-kat.cpp

OTHER_FILES += \
    qml/harbour-kat.qml

CONFIG += sailfishapp_i18n
TRANSLATIONS += \
    translations/harbour-kat-en.ts
