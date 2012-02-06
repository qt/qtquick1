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

// Level own JavaScript file
import "Level.js" as LevelScript

Rectangle {
    id: enemies
    anchors.fill: parent
    property int enemiesCreated: 0
    property int enemiesEnabled: 0
    color: "black"

    // ***************************************************
    // *** NOTE: This "pause(bool)" function is mandatory for all level QML files
    function pause(doPause) {
    }

    // ***************************************************
    // *** NOTE: Level object name "level" is mandatory for all level QML files
    objectName: "level"

    // Enemy placeholder. Have to exist at least one enemy for prevent to level be stopped
    Enemy {
        x: parent.width / 2
        y: parent.height / 2
        opacity: 1
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
}
