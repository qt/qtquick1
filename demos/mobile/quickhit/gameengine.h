/****************************************************************************
**
** Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
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

#ifndef GAMEENGINE_H
#define GAMEENGINE_H

#include <QObject>
#include <QDeclarativeItem>
#include <QMutex>
#include <QPluginLoader>
#include <QList>

#ifdef Q_OS_SYMBIAN
#include <hwrmvibra.h>
#endif

// QtMobility
#if defined Q_OS_SYMBIAN || defined Q_WS_MAEMO_5
#include <QSystemDeviceInfo>
QTM_USE_NAMESPACE
#endif

class CInvSounds;
class LevelPluginInterface;
class GameEngine : public QObject
{
    Q_OBJECT

public:
    GameEngine(QObject* parent);
    ~GameEngine();
    void timerEvent(QTimerEvent *);
    void setGameLevel(LevelPluginInterface* level);
    void setPluginList(QList<QPluginLoader*> plugins);
    void pauseGame();

public:
    Q_INVOKABLE void enableEngineTimer(QVariant enable);
    Q_INVOKABLE QVariant randInt(QVariant low, QVariant high);
    Q_INVOKABLE void enableSounds(QVariant enable);
    Q_INVOKABLE void playSound(QVariant index);
    Q_INVOKABLE void playSounds(QVariant index, QVariant count);
    Q_INVOKABLE void playInternalSound(QVariant index);
    Q_INVOKABLE void playInternalSounds(QVariant index, QVariant count);
    Q_INVOKABLE QVariant pluginList();
    Q_INVOKABLE void findQmlObjects();
    Q_INVOKABLE void clearQmlObjects();
    Q_INVOKABLE void pauseLevel(QVariant doPause);
    Q_INVOKABLE void gameStartSound();

    Q_INVOKABLE QVariant isSymbian();
    Q_INVOKABLE QVariant isMaemo();
    Q_INVOKABLE QVariant isWindows();

    Q_INVOKABLE void vibra();
    Q_INVOKABLE void fastVibra();

    Q_INVOKABLE void openLink(QVariant link);


private slots:
#if defined Q_OS_SYMBIAN || defined Q_WS_MAEMO_5
    void currentProfileChanged (QSystemDeviceInfo::Profile);
#endif

public:
    void setGameQml(QObject* o);

private:
    void findMissiles(QObject* rootObject);
    void findEnemies(QObject* rootObject);
    void setLevelQml(QObject* o) {m_levelQml = o;}
    void setEnemiesGridQml(QObject* o);
    void setMyShipQml(QObject* o);
    void gameOver(bool youWin);
    void selectVisibleEnemy(int& start, int& end);

private:
    void doHitTest();
    void doEnemyMissile();

private:
    bool                        m_enableEnemyMissiles;
    QMutex                      m_enemyListMutex;
    QList<QDeclarativeItem*>    m_enemyList;
    QList<QDeclarativeItem*>    m_missileList;
    QList<QDeclarativeItem*>    m_enemyMissileList;
    QObject*                    m_levelQml;
    QDeclarativeItem*           m_enemiesGridGml;
    QDeclarativeItem*           m_myShipGml;
    QDeclarativeItem*           m_GameGml;

    LevelPluginInterface*       m_gameLevel;
    CInvSounds*                 m_soundEngine;
    QList<QPluginLoader*>       m_pluginList;

    int                         m_timerId;
    int                         m_doEnemyMissile;

#if defined Q_OS_SYMBIAN || defined Q_WS_MAEMO_5
    QSystemDeviceInfo*          m_systemDeviceInfo;
#endif
    bool                        m_silent;

#ifdef Q_OS_SYMBIAN
    CHWRMVibra* iVibrate;
#endif

};

#endif // GAMEENGINE_H
