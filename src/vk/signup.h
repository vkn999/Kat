/*
    Copyright (c) 2013 by Ruslan Nazarov <818151@gmail.com>

 ***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************
*/

#ifndef SIGNUP_H
#define SIGNUP_H

#include <QObject>

class Signup : public QObject
{
    Q_OBJECT
public:
    explicit Signup(QString client_id, QString client_secret, QObject *parent = 0);

signals:

public slots:

};

#endif // SIGNUP_H
