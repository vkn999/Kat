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

.import "request.js" as RequestAPI


// -------------- API functions --------------

function api_getLastNews(startFrom) {
    var data = {
        filters: "post",
        return_banned:0,
        fields: "photo_100"
    }
    if (startFrom.length > 0) data.start_from = startFrom
    RequestAPI.sendRequest("newsfeed.get",
                           data,
                           callback_getLastNews)
}


// -------------- Callbacks --------------

function callback_getLastNews(jsonObject) {
    var jsonElement
    var jsonProfiles = jsonObject.response.profiles
    var jsonGroups = jsonObject.response.groups
    for (var index in jsonObject.response.items) {
        jsonElement = jsonObject.response.items[index]
        if (jsonElement.type === "post")
            appendPostToNewsFeed(parsePost(jsonElement, jsonProfiles, jsonGroups))
    }
    stopLoadingNewsIndicator(jsonObject.response.next_from)
}


// -------------- Other functions --------------

function parsePost(jsonObject, jsonProfiles, jsonGroups) {
    var postData = []

    var date = new Date()
    date.setTime(parseInt(jsonObject.date) * 1000)

    if (jsonObject.post_id) postData[0] = jsonObject.post_id
    else if (jsonObject.id) postData[0] = jsonObject.id
    else postData[0] = -1

    postData[1] = jsonObject.text.replace(/&/g, '&amp;')
                                 .replace(/&amp;quot;/g, '"')
                                 .replace(/</g, '&lt;')
                                 .replace(/>/g, '&gt;')
                                 .replace(/\n/g, "<br>")
                                 .replace(/(https?:\/\/[^\s<]+)/g, "<a href=\"$1\">$1</a>")
    postData[2] = ("0" + date.getHours()).slice(-2) + ":" +
                  ("0" + date.getMinutes()).slice(-2) + ", " +
                  ("0" + date.getDate()).slice(-2) + "." +
                  ("0" + (date.getMonth() + 1)).slice(-2) + "." +
                  ("0" + date.getFullYear()).slice(-2)

    var owner = jsonObject.source_id
    if (!jsonObject.source_id) owner = jsonObject.from_id
    if (owner > 0) {
        for (var index1 in jsonProfiles) {
            if (jsonProfiles[index1].id === owner) {
                console.log(jsonProfiles[index1].photo_100)
                postData[3] = jsonProfiles[index1].photo_100
                postData[4] = jsonProfiles[index1].first_name + " " + jsonProfiles[index1].last_name
            }
        }
    } else {
        var sourceId = Math.abs(owner)
        for (var index2 in jsonGroups) {
            if (jsonGroups[index2].id === sourceId) {
                console.log(jsonGroups[index2].photo_100)
                postData[3] = jsonGroups[index2].photo_100
                postData[4] = jsonGroups[index2].name
            }
        }
    }
    postData[5] = owner

    if (jsonObject.comments) postData[6] = jsonObject.comments.count
    else postData[6] = 0

    if (jsonObject.likes) {
        postData[7] = jsonObject.likes.count
        postData[8] = jsonObject.likes.user_likes
    } else {
        postData[7] = 0
        postData[8] = 0
    }

    if (jsonObject.reposts) {
        postData[9] = jsonObject.reposts.count
        postData[10] = jsonObject.reposts.user_reposted
    } else {
        postData[9] = 0
        postData[10] = 0
    }

    if (jsonObject.attachments) {
        for (var index in jsonObject.attachments) {
            postData[postData.length] = jsonObject.attachments[index]
        }
    }

    if (jsonObject.copy_history) {
        for (var index in jsonObject.copy_history) {
            console.log(JSON.stringify(jsonObject.copy_history[index]))
            postData[postData.length] = parsePost(jsonObject.copy_history[index], jsonProfiles, jsonGroups)
        }
    }

    return postData
}
