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


#ifndef NEWS_H
#define NEWS_H

#include <QHash>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>
#include <QString>

#include "apirequest.h"

class News : public QObject
{
    Q_OBJECT
public:
    explicit News(QObject *parent = 0);

signals:

public slots:
    void checkNews();
    void checkNews(int startFrom);

private slots:
    void gotNews(QString jsonData);

private:
    QHash<QString, QString> buildBasicParams();
    void checkNews(QHash<QString, QString> params);

    int nextFrom;
    QJsonArray newsItems;
    QJsonArray newsProfiles;
    QJsonArray newsGroups;
};

#endif // NEWS_H
