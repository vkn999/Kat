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


#include "news.h"

#include <QDebug>

News::News(QObject *parent) : QObject(parent) {
}

/**
 * The method calls standard request for checking newsfeed.
 */
void News::checkNews() {
    QHash<QString, QString> params = buildBasicParams();
    checkNews(params);
}

/**
 * The method calls request for checking newsfeed with passed offset.
 * @param startFrom - string literal from previous json
 */
void News::checkNews(int startFrom) {
    QHash<QString, QString> params = buildBasicParams();
    params["start_from"] = QString::number(startFrom);
    checkNews(params);
}

/**
 * @brief The method call request for checking newsfeed with passed params.
 * @param params - params for request
 */
void News::checkNews(QHash<QString, QString> params) {
    ApiRequest *request = new ApiRequest(this);
    connect(request, SIGNAL(finished(QString)), this, SLOT(gotNews(QString)));
    request->startRequest("newsfeed.get", params);
}

/**
 * @brief The method build standard parameters for checking newsfeed.
 * @return Standard params { "filters": "post", "return_banned": "0", "fields": "photo_100" }
 */
QHash<QString, QString> News::buildBasicParams() {
    QHash<QString, QString> params;
    params["filters"] = "post";
    params["return_banned"] = "0";
    params["fields"] = "photo_100";
    return params;
}

/**
 * @brief The callback after checking newsfeed
 * @param jsonData - data received from server
 */
void News::gotNews(QString jsonData) {
    QJsonDocument jsonDocument = QJsonDocument::fromJson(jsonData.toUtf8());
    QJsonObject jsonObject = jsonDocument.object().value("response").toObject();
    newsItems = jsonObject.value("items").toArray();
    newsProfiles = jsonObject.value("profiles").toArray();
    newsGroups = jsonObject.value("groups").toArray();
    nextFrom = jsonObject.value("next_from").toString();
}

