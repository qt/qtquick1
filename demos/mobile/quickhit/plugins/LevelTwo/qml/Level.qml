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

import QtQuick 1.0
import Qt.labs.particles 1.0
import "Level.js" as LevelScript

Item {
    id: enemies
    anchors.fill: parent

    property int enemiesCreated: 0
    property int enemiesEnabled: 0

    property int backOneTop
    property int backTwoTop

    // Long background 2
    Image {
        id: longBackground_2
        source: "file:/"+LevelPlugin.pictureRootPath()+"background_loop.png"
        fillMode: Image.Stretch
        smooth: false
        width: gameArea.width
        height: gameArea.height
    }

    // Long background 1
    Image {
        id: longBackground_1
        source: "file:/"+LevelPlugin.pictureRootPath()+"background_loop.png"
        fillMode: Image.Stretch
        smooth: false
        width: gameArea.width
        height: gameArea.height
    }

    // Long background Up to down animation
     ParallelAnimation {
        id: backgroundAnim;
        loops: Animation.Infinite
        PropertyAnimation { target:longBackground_1; property:"y";
        from:backOneTop; to:gameArea.height; easing.type:Easing.Linear; duration:10000 }
        PropertyAnimation { target:longBackground_2; property:"y";
        from:backTwoTop; to:backOneTop; easing.type:Easing.Linear; duration:10000 }
     }



    // ***************************************************
    // *** NOTE: This is mandatory for all level QML files
    function pause(doPause) {
        if (doPause) {
            enemyCreationTimer.stop()
            backgroundAnim.stop()
        } else {
            enemyCreationTimer.restart()
            backgroundAnim.restart()
        }
        for (var i=0;i<LevelScript.hiddenEnemies.length;i++) {
            var enemy = LevelScript.hiddenEnemies[i]
            enemy.pause(doPause)
        }
    }


    // ***************************************************
    // *** NOTE: This is mandatory for all level QML files
    objectName: "level"


    // Enemy creation timer
    Timer {
        id: enemyCreationTimer
        interval: 1000; running: false; repeat: true
        onTriggered: {
            enableEnemy()
        }
    }

    function enableEnemy() {
        if (enemiesEnabled < enemiesCreated) {
            var enemy = LevelScript.hiddenEnemies[enemiesEnabled]
            enemy.opacity = 1
            enemy.x = GameEngine.randInt(0,gameArea.width-enemy.width-50)
            enemy.startMovingAnim()
            enemyCreationTimer.stop()
            enemyCreationTimer.interval = GameEngine.randInt(500,2000)
            enemyCreationTimer.restart()
            enemiesEnabled = enemiesEnabled + 1
            GameEngine.playSound(4) // NOTE: Enable enemy sound
        } else {
            enemyCreationTimer.stop()
        }
    }

    // Hidden enemies group
    function createHiddenEnemiesGroup() {
        for (var i=0;i<LevelPlugin.enemyCount();i++) {
            var enemyComponent = Qt.createComponent("file:/"+LevelPlugin.qmlRootPath()+"Enemy.qml")
            var enemyObject = enemyComponent.createObject(enemies)
            LevelScript.hiddenEnemies.push(enemyObject)
            enemiesCreated = enemiesCreated + 1
        }
    }

    Component.onCompleted: {
        // Create hidden enemies
        createHiddenEnemiesGroup()
        // Flying moons animation
        starBurstTimer.restart()
        // Create enemies timer
        enemyCreationTimer.restart()

        // Start Long background loop animation
        backOneTop = 0
        longBackground_1.y = backOneTop;
        backTwoTop = gameArea.height * -1
        longBackground_2.y = backTwoTop;
        backgroundAnim.restart()

        GameEngine.playSounds(5,3)  //NOTE: Level starts sound, 3 times
    }

    Timer {
        id: starBurstTimer
        interval: starParticles.lifeSpan+GameEngine.randInt(100,2000); running: false; repeat: true
        onTriggered: {
        starParticles.burst(GameEngine.randInt(4,6))
        }
     }

    // ***************************************************
    // *** NOTE: This is mandatory for all level QML files
    // Execute explode particle effect
    function explode(x,y) {
        explodeParticles.x = x
        explodeParticles.y = y
        explodeParticles.burst(20)
        explodeParticles.opacity = 1
    }
    // ***************************************************
    // *** NOTE: This is mandatory for all level QML files
    // Explode particle effect
    Particles {
        id: explodeParticles
        opacity: 0
        width: 1
        height: 1
        emissionRate: 0
        source: "file:/"+LevelPlugin.pictureRootPath()+"blue_fire.png"
        lifeSpan: 500
        lifeSpanDeviation: 2000
        count: -1
        angle: 270
        angleDeviation: 65
        velocity: 100
        velocityDeviation: 100
        ParticleMotionGravity {
            yattractor: 1000
            xattractor: 300
            acceleration: 50
        }
    }

  Particles {
         id: starParticles
         y: -50
         x: 0
         width: parent.width
         height: 50
         emissionRate: 0
         source: "file:/"+LevelPlugin.pictureRootPath()+"star3.png"
         lifeSpan: 5000
         count: -1
         angle: 90
         velocity: 100
         opacity: 0.7
        ParticleMotionGravity {
            yattractor: 1000
            xattractor: 500
        }
     }


}





