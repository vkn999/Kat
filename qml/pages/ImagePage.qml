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
    id: imagePage

    property alias imagesModel: imagesList.model
    property alias current: imagesList.currentIndex

    SilicaListView {
        id: imagesList
        anchors.fill: parent
        clip: true
        snapMode: ListView.SnapOneItem
        orientation: ListView.HorizontalFlick
        highlightRangeMode: ListView.StrictlyEnforceRange
        cacheBuffer: width

        delegate: Item {
            width: imagesList.width
            height: imagesList.height
            clip: true

            Image {
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                sourceSize.height: window.height * 2
                asynchronous: true
                source: {
                    if (typeof photo_2560 !== 'undefined') return photo_2560;
                    else if (typeof photo_1280 !== 'undefined') return photo_1280;
                    else if (typeof photo_807 !== 'undefined') return photo_807;
                    else if (typeof photo_604 !== 'undefined') return photo_604;
                    else if (typeof photo_130 !== 'undefined') return photo_130;
                    else return photo_75;
                }

                PinchArea {
                    anchors.fill: parent
                    pinch.target: parent
                    pinch.minimumScale: 1
                    pinch.maximumScale: 4
                }
            }
        }
    }
}

