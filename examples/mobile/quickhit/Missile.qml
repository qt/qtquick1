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

import QtQuick 1.0

Item {
    id: missile
    objectName: "missile"
    opacity: 0 // transparent by default

    property int fromYpos
    property int toYpos
    property variant myMissileSize
    property bool enemyMissile: false
    property int defaultX: 0
    property int defaultY: 0

    function storeDefaultPos() {
        defaultX = missile.x
        defaultY = missile.y
    }

    function setToDefaultPos() {
        missile.x = defaultX
        missile.y = defaultY
        opacity = 0.5
    }

    function createGraphicsForLevel() {
        missile.myMissileSize = LevelPlugin.graphSize(LevelPlugin.pathToMissilePic())
        missile.height = myMissileSize.height;
        missile.width = myMissileSize.width;
        if (missile.enemyMissile) {
            missileImage.source = "file:/"+LevelPlugin.pathToEnemyMissilePic()
        } else {
            missileImage.source = "file:/"+LevelPlugin.pathToMissilePic()
        }
    }

    // Execute fire!
    function fire(aXpox, aFromYpos, aToYpos) {
        missile.x = aXpox - missile.width / 2
        missile.y = aFromYpos
        missile.fromYpos = aFromYpos
        missile.toYpos = aToYpos
        missile.opacity = 1
        GameEngine.playSound(2) // NOTE: 3 for your missile sound
        flying.restart()
    }

    // Enemy fires!
    function enemyFire(aXpox, aFromYpos, aToYpos) {
        missile.x = aXpox - missile.width / 2
        missile.y = aFromYpos
        missile.fromYpos = aFromYpos
        missile.toYpos = aToYpos
        missile.opacity = 1
        GameEngine.playSound(3) // NOTE: 3 for enemy missile sound
        flyingEnemy.restart()
    }

    // Stop missile
    function stop() {
        flying.stop()
    }

    // Pause missile
    function pause(doPause) {
        if (doPause) {
            flying.pause()
            flyingEnemy.pause()
        } else {
            flying.resume()
            flyingEnemy.resume()
        }
    }

    Component.onCompleted: {
        if (!enemyMissile) {
            storeDefaultPos()
            setToDefaultPos()
        }
    }

    // Animates missile flying to the target
    SequentialAnimation {
        id: flying
        PropertyAnimation {target: missile; properties: "y";
            from: fromYpos; to: toYpos; duration: 2000; easing.type: Easing.InCubic }
        //PropertyAction {target: missile; properties: "opacity"; value: 0}
        ScriptAction { script: setToDefaultPos() }
    }

    SequentialAnimation {
        id: flyingEnemy
        PropertyAnimation {target: missile; properties: "y";
            from: fromYpos; to: toYpos; duration: 2000; easing.type: Easing.InCubic }
        PropertyAction {target: missile; properties: "opacity"; value: 0}
    }

    Image {
        id: missileImage
        smooth: true
    }
}

