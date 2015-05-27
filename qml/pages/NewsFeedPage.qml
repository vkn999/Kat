/*
  Copyright (C) 2015 Petr Vytovtov
  Contact: Petr Vytovtov <osanwe@protonmail.ch>
  All rights reserved.

  This file is part of Kat.

  Kat is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Kat is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Kat.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

import "../views"
import "../js/api/news.js" as NewsAPI


Page {

    function doStartUpdate() {
        newsfeedList.model.clear()
        NewsAPI.api_getLastNews(null)
    }

    function appendPostToNewsFeed(postData) {
        newsfeedList.model.append({ message: postData[1],
                                    out: 0,
                                    readState: 1,
                                    datetime: postData[2],
                                    attachmentsData: postData.slice(3),
                                    avatarSource: "" })
    }

    SilicaListView {
        id: newsfeedList
        anchors.fill: parent

        PullDownMenu {

//            MenuItem {
//                text: "Опубликовать"
//                onClicked:
//            }

            MenuItem {
                text: "Обновить"
                onClicked: doStartUpdate()
            }
        }

        header: PageHeader { title: "Новости" }

        model: ListModel {}

//        delegate: BackgroundItem {
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.rightMargin: Theme.paddingLarge
//            anchors.leftMargin: Theme.paddingLarge
//            height: newsText.height + Theme.paddingMedium

//            Label {
//                id: newsText
//                width: parent.width
//                height: contentHeight
//                color: highlighted ? Theme.highlightColor : Theme.primaryColor
//                text: newsTextContent
//                wrapMode: Text.Wrap
//            }
//        }

        delegate: MessageItem {
            width: parent.width
        }

        VerticalScrollDecorator {}
    }

    onStatusChanged: if (status === PageStatus.Active) doStartUpdate()
}
