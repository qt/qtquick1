/****************************************************************************
**
** Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/
**
** This file is part of the demonstration applications of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtWidgets/QMainWindow>
#include <QDeclarativeView>

#include <QApplication>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QGraphicsObject>
#include <QMouseEvent>
#include <QPluginLoader>

#include "myeventfilter.h"

class GameEngine;
class LevelPluginInterface;

class MainWindow : public QDeclarativeView
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = 0);
    ~MainWindow();

public slots:
    void levelActivated(int);
    void activationChangeFiltered();

private:
    void printObjectTree(QObject* parent);
    void loadLevelPlugins();
    bool loadPlugins(QString drive, QString pluginDir);
    void createPlugin(int index = -1);

private:
    GameEngine*             m_gameEngine;
    LevelPluginInterface*   m_levelPlugin;
    QList<QPluginLoader*>   m_plugins;

    MyEventFilter*          m_eventFilter;
};

#endif // MAINWINDOW_H
