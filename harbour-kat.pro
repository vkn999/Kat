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

greaterThan(QT_VERSION, 5.5) {
    CONFIG += C++11
} else {
    QMAKE_CXXFLAGS += -std=gnu++11
}

HEADERS += \
    src/audio/audio.h \
    src/audio/audioalbumsmodel.h \
    src/audio/audiomodel.h \
    src/cache/networkaccessmanagerfactory.h \
    src/chat/attachmentsmodel.h \
    src/chat/chat.h \
    src/chat/chatmodel.h \
    src/chat/chats.h \
    src/chat/chatshandler.h \
    src/chat/chatsortfilterproxymodel.h \
    src/chat/dialogshandler.h \
    src/chat/dialogsmodel.h \
    src/notification/macnotification.h \
    src/notification/notificator.h \
    src/roster/rosterhandler.h \
    src/roster/rostermodel.h \
    src/vk/attachmentitem.h \
    src/vk/attachmentlist.h \
    src/vk/attachmentsparser.h \
    src/vk/audioitem.h \
    src/vk/audiolist.h \
    src/vk/audiopacket.h \
    src/vk/audioparser.h \
    src/vk/client.h \
    src/vk/connection.h \
    src/vk/dialogitem.h \
    src/vk/dialoglist.h \
    src/vk/dialogparser.h \
    src/vk/dialogspacket.h \
    src/vk/docitem.h \
    src/vk/docparser.h \
    src/vk/emoticons.h \
    src/vk/engine.h \
    src/vk/errorresponse.h \
    src/vk/fwdmsgitem.h \
    src/vk/fwdmsgparser.h \
    src/vk/giftitem.h \
    src/vk/giftparser.h \
    src/vk/global.h \
    src/vk/groupchathandler.h \
    src/vk/historypacket.h \
    src/vk/linkitem.h \
    src/vk/linkparser.h \
    src/vk/longpoll.h \
    src/vk/mapitem.h \
    src/vk/mapparser.h \
    src/vk/messagebase.h \
    src/vk/messageitem.h \
    src/vk/messagelist.h \
    src/vk/messageparser.h \
    src/vk/notifypropertybase.h \
    src/vk/observablecollection.h \
    src/vk/packet.h \
    src/vk/photoitem.h \
    src/vk/photoparser.h \
    src/vk/photospacket.h \
    src/vk/profileitem.h \
    src/vk/profilelist.h \
    src/vk/profileparser.h \
    src/vk/pushsettings.h \
    src/vk/rosterpacket.h \
    src/vk/sendmessagehandler.h \
    src/vk/servicemsgitem.h \
    src/vk/signup.h \
    src/vk/stickeritem.h \
    src/vk/stickerparser.h \
    src/vk/typinghandler.h \
    src/vk/typingitem.h \
    src/vk/uploadattachments.h \
    src/vk/uploadaudioitem.h \
    src/vk/uploaddocitem.h \
    src/vk/uploadfile.h \
    src/vk/uploaditem.h \
    src/vk/uploadphotoitem.h \
    src/vk/uploadvideoitem.h \
    src/vk/utils.h \
    src/vk/videoitem.h \
    src/vk/videoparser.h \
    src/vk/wallitem.h \
    src/vk/wallparser.h \
    src/authorization.h \
    src/settings.h

SOURCES += \
    src/harbour-kat.cpp \
    src/audio/audio.cpp \
    src/audio/audioalbumsmodel.cpp \
    src/audio/audiomodel.cpp \
    src/cache/networkaccessmanagerfactory.cpp \
    src/chat/attachmentsmodel.cpp \
    src/chat/chat.cpp \
    src/chat/chatmodel.cpp \
    src/chat/chats.cpp \
    src/chat/chatshandler.cpp \
    src/chat/chatsortfilterproxymodel.cpp \
    src/chat/dialogshandler.cpp \
    src/chat/dialogsmodel.cpp \
    src/notification/notificator.cpp \
    src/roster/rosterhandler.cpp \
    src/roster/rostermodel.cpp \
    src/vk/attachmentitem.cpp \
    src/vk/attachmentlist.cpp \
    src/vk/attachmentsparser.cpp \
    src/vk/audioitem.cpp \
    src/vk/audiolist.cpp \
    src/vk/audiopacket.cpp \
    src/vk/audioparser.cpp \
    src/vk/client.cpp \
    src/vk/connection.cpp \
    src/vk/dialogitem.cpp \
    src/vk/dialoglist.cpp \
    src/vk/dialogparser.cpp \
    src/vk/dialogspacket.cpp \
    src/vk/docitem.cpp \
    src/vk/docparser.cpp \
    src/vk/emoticons.cpp \
    src/vk/engine.cpp \
    src/vk/errorresponse.cpp \
    src/vk/fwdmsgitem.cpp \
    src/vk/fwdmsgparser.cpp \
    src/vk/giftitem.cpp \
    src/vk/giftparser.cpp \
    src/vk/groupchathandler.cpp \
    src/vk/historypacket.cpp \
    src/vk/linkitem.cpp \
    src/vk/linkparser.cpp \
    src/vk/longpoll.cpp \
    src/vk/mapitem.cpp \
    src/vk/mapparser.cpp \
    src/vk/messagebase.cpp \
    src/vk/messageitem.cpp \
    src/vk/messagelist.cpp \
    src/vk/messageparser.cpp \
    src/vk/notifypropertybase.cpp \
    src/vk/observablecollection.cpp \
    src/vk/packet.cpp \
    src/vk/photoitem.cpp \
    src/vk/photoparser.cpp \
    src/vk/photospacket.cpp \
    src/vk/profileitem.cpp \
    src/vk/profilelist.cpp \
    src/vk/profileparser.cpp \
    src/vk/pushsettings.cpp \
    src/vk/rosterpacket.cpp \
    src/vk/sendmessagehandler.cpp \
    src/vk/servicemsgitem.cpp \
    src/vk/signup.cpp \
    src/vk/stickeritem.cpp \
    src/vk/stickerparser.cpp \
    src/vk/typinghandler.cpp \
    src/vk/typingitem.cpp \
    src/vk/uploadattachments.cpp \
    src/vk/uploadaudioitem.cpp \
    src/vk/uploaddocitem.cpp \
    src/vk/uploadfile.cpp \
    src/vk/uploaditem.cpp \
    src/vk/uploadphotoitem.cpp \
    src/vk/uploadvideoitem.cpp \
    src/vk/utils.cpp \
    src/vk/videoitem.cpp \
    src/vk/videoparser.cpp \
    src/vk/wallitem.cpp \
    src/vk/wallparser.cpp \
    src/authorization.cpp \
    src/settings.cpp

OTHER_FILES += \
    qml/harbour-kat.qml

CONFIG += sailfishapp_i18n
TRANSLATIONS += \
    translations/harbour-kat-en.ts

DISTFILES += \
    qml/cover/CoverPage.qml \
    rpm/harbour-kat.yaml \
    rpm/harbour-kat.changes.in \
    rpm/harbour-kat.spec \
    translations/harbour-kat.ts \
    harbour-kat.desktop \
    harbour-kat.png \
    LICENSE \
    README.md \
    qml/pages/MainMenuPage.qml

OBJECTIVE_SOURCES += \
    src/notification/macnotification.mm
