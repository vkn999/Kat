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

Page {
    id: mainMenuPage

    property string userFullName: "Имя Фамилия"
    property var model: [
        { name: "Новости", counter: "" },
        { name: "Ответы", counter: "" },
        { name: "Сообщения", counter: "1" },
        { name: "Друзья", counter: "" },
        { name: "Группы", counter: "" },
        { name: "Фотографии", counter: "" },
        { name: "Видеозаписи", counter: "" },
        { name: "Аудиозаписи", counter: "" },
        { name: "Закладки", counter: "" },
        { name: "Документы", counter: "" },
        { name: "Поиск", counter: "" },
        { name: "Настройки", counter: "" },
        { name: "О программе", counter: "" }
    ]

    function generateModelFromArray() {
        for (var index in mainMenuPage.model) {
            mainMenu.model.append(mainMenuPage.model[index])
        }
    }

    SilicaListView {
        id: mainMenu
        anchors.fill: parent
        anchors.bottomMargin: Theme.paddingMedium

        model: ListModel {}

        header: PageHeader {
            title: userFullName
        }

        delegate: BackgroundItem {
            id: menuItem
            height: Theme.itemSizeSmall

            property var item: model.modelData ? model.modelData : model

            Item {
                anchors.fill: parent
                anchors.leftMargin: Theme.paddingLarge
                anchors.rightMargin: Theme.paddingLarge

                Label {
                    id: menuItemText
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    color: menuItem.highlighted ? Theme.highlightColor : Theme.primaryColor
                    maximumLineCount: 1
                    truncationMode: TruncationMode.Fade
                    text: item.name
                }

                Rectangle {
                    anchors.left: menuItemText.right
                    anchors.leftMargin: Theme.paddingMedium
                    anchors.verticalCenter: parent.verticalCenter
                    width: menuItemCounter.width < menuItemCounter.height ?
                               menuItemCounter.height :
                               menuItemCounter.width + 2 * Theme.paddingSmall
                    height: menuItemCounter.height
                    radius: 10
                    color: menuItem.highlighted ? Theme.primaryColor : Theme.highlightColor
                    visible: item.counter !== ""

                    Label {
                        id: menuItemCounter
                        anchors.centerIn: parent
                        font.bold: true
                        color: menuItem.highlighted ? Theme.highlightColor : Theme.primaryColor
                        text: item.counter
                    }
                }
            }
        }

        VerticalScrollDecorator {}
    }

    Component.onCompleted: generateModelFromArray()
}

