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

HEADERS += \
    src/filedownloader.h \
    src/notificationhelper.h \
    src/api/apirequest.h \
    src/storage.h \
    src/api/photos.h \
    src/api/news.h \
    src/api/helpers/newsitem.h

SOURCES += \
    src/harbour-kat.cpp \
    src/filedownloader.cpp \
    src/notificationhelper.cpp \
    src/api/apirequest.cpp \
    src/storage.cpp \
    src/api/photos.cpp \
    src/api/news.cpp \
    src/api/helpers/newsitem.cpp

OTHER_FILES += \
    qml/harbour-kat.qml \
    qml/cover/*.qml \
    qml/pages/*.qml \
    qml/views/*.qml \
    qml/js/*.js \
    qml/js/api/*.js \
    qml/emojione/*.js \
    qml/emojione/png/*.png \
    qml/fonts/OpenSansEmoji.ttf \
    translations/*.ts \
    rpm/harbour-kat.yaml \
    rpm/harbour-kat.spec \
    rpm/harbour-kat.changes.in \
    LICENSE \
    README.md \
    .gitignore \
    qml/pages/NewWallPostPage.qml \
    qml/js/api/groups.js \
    qml/js/types.js \
    qml/js/api/account.js \
    qml/js/signals.js

CONFIG += sailfishapp_i18n
TRANSLATIONS += \
    translations/harbour-kat-en.ts
