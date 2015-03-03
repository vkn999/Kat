import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    width: parent.width
    height: Theme.itemSizeMedium

    property string avatarSource: "image://theme/icon-cover-pause"

    Image {
        id: avatar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 5
        height: parent.height - 10
        width: height
        source: avatarSource
    }

    Label {
        id: name
        anchors.top: avatar.top
        anchors.left: avatar.right
        anchors.topMargin: 5
        anchors.leftMargin: 5
        color: Theme.primaryColor
        text: nameOrTitle
        truncationMode: TruncationMode.Fade
    }

    Label {
        id: messagePreview
        anchors.bottom: avatar.bottom
        anchors.left: avatar.right
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: Theme.secondaryColor
        text: lastMessage
        truncationMode: TruncationMode.Fade
    }
}
