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

Rectangle {
    id: enemies
    anchors.fill: parent
    color: "black"


    // Background image for the level
    Image {
        id: background1
        source: "file:/"+LevelPlugin.pictureRootPath()+"background3.png"
        fillMode: Image.PreserveAspectCrop
        smooth: true
        //anchors.fill: parent
        width: parent.width
        height: parent.height
    }


    // ***************************************************
    // *** NOTE: This is mandatory for all level QML files
    function pause(doPause) {
        if (doPause) {
        rightLeftAnim.pause()
        upToDownAnim.pause()
        } else {
        rightLeftAnim.resume()
        upToDownAnim.resume()
        }
    }


    // ***************************************************
    // *** NOTE: This is mandatory for all level QML files
    objectName: "level"

    property int enemySpeed: LevelPlugin.enemySpeed()
    property int enemyMaxWidth

    // Create enemies dynamically
    function createEnemies(amount) {
        var b = false;
        for (var i=0;i<amount;i++) {
            if (b){
                Qt.createQmlObject('import QtQuick 1.0; Image { property bool hit:false; width:50; objectName:"enemy"; smooth:true; fillMode:Image.PreserveAspectFit; source:"file:/"+LevelPlugin.pictureRootPath()+"enemy1.png";}',enemiesGrid);
            } else {
                Qt.createQmlObject('import QtQuick 1.0; Image { property bool hit:false; width:50; objectName:"enemy"; smooth:true; fillMode:Image.PreserveAspectFit; source:"file:/"+LevelPlugin.pictureRootPath()+"enemy2.png";}',enemiesGrid);
            }
            b = !b;
        }
    }

    // Calculate enemy max width
    function calEnemyMaxWidth() {
        var enemyCountInCol = LevelPlugin.enemyCount() / LevelPlugin.enemyRowCount();
        enemyCountInCol++; // add some extra space needs for width
        if (enemyCountInCol*LevelPlugin.graphSize(LevelPlugin.pictureRootPath()+"enemy1.png").width > gameArea.width) {
            enemyMaxWidth = gameArea.width / (enemyCountInCol + 1);
        }
        else {
            enemyMaxWidth = LevelPlugin.graphSize(LevelPlugin.pictureRootPath()+"enemy1.png").width;
        }
    }


    Component.onCompleted: {
        // Calculate enemy max width
        calEnemyMaxWidth()

        // Create enemies dynamically after component created
        createEnemies(LevelPlugin.enemyCount())

        // Start animations
        enemiesGrid.y = enemiesGrid.height * -1
        rightLeftAnim.restart()
        upToDownAnim.restart()

        // Flying stars animation, not in Maemo
        if (!GameEngine.isMaemo()) {
            starBurstTimer.restart()
        }

        GameEngine.playSound(4) // NOTE: Level start sound
    }


    Timer {
        id: starBurstTimer
        interval: starParticles.lifeSpan+GameEngine.randInt(100,2000); running: false; repeat: true
        onTriggered: {
        starParticles.burst(GameEngine.randInt(4,10))
        }
     }


    // Right-left animation
    SequentialAnimation {
        id: rightLeftAnim
        loops: Animation.Infinite
        NumberAnimation { target:enemiesGrid; property:"x"; from: 0; to:gameArea.width - enemiesGrid.width; easing.type: Easing.OutQuad; duration: 3000 }
        NumberAnimation { target:enemiesGrid; property:"x"; to: 0; easing.type: Easing.OutQuad; duration: 3000 }
    }

    // Up to down animation
    PropertyAnimation { id: upToDownAnim; target:enemiesGrid; property:"y"; to: gameArea.height;
        easing.type: Easing.Linear; duration: enemies.enemySpeed }

    Grid {
        id: enemiesGrid
        objectName: "enemiesGrid"
        columns: LevelPlugin.enemyCount() / LevelPlugin.enemyRowCount()
        spacing: 8
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
        source: "file:/"+LevelPlugin.pictureRootPath()+"red_fire.png"
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
         lifeSpan: 3000
         count: -1
         angle: 90
         velocity: 100
        ParticleMotionGravity {
            yattractor: 1000
            xattractor: 500
        }
     }


}





