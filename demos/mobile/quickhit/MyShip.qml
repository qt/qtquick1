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
import "Game.js" as GameScript

Item {
    id: myShip
    objectName: "myShip"

    property variant myShipSize
    property int originalY

    // Fires missile if exists
    function fire() {
        if (myShip.opacity==1) {
            GameScript.fireMissile(myShip.x+myShip.width/2,myShip.y,myShip.height*-1)
            if (myShip.y+myShip.height < gameArea.height+5) {
                goDownAnim.restart()
            }
        }
    }

    function createGraphicsForLevel() {
        myShip.myShipSize = LevelPlugin.graphSize(LevelPlugin.pathToMyShipPic())
        myShip.height = myShipSize.height
        myShip.width = myShipSize.width
        image.source = "file:/"+LevelPlugin.pathToMyShipPic()
        myShip.y = gameArea.height - myShip.height - 10
        originalY = myShip.y
        myShip.x = (gameArea.width - myShip.width)/ 2
    }

    Image {
        id: image
        smooth: true
    }

    Keys.onSpacePressed: { fire() }
    Keys.onSelectPressed: { fire() }
    Keys.onRightPressed: {
        if (myShip.x < (gameArea.width - myShip.width - 20)) {
            toRightAnim.restart()
        }
    }
    Keys.onLeftPressed: {
        if (myShip.x > 20) {
            toLeftAnim.restart()
        }
    }

    // To right animation
    PropertyAnimation { id: toRightAnim; target: myShip; easing.type: Easing.OutQuint;
        properties: "x"; from: myShip.x; to: myShip.x + 20; duration: 500 }

    // To left animation
    PropertyAnimation { id: toLeftAnim; target: myShip; easing.type: Easing.OutQuint;
        properties: "x"; from: myShip.x; to: myShip.x - 20; duration: 500 }

    // Go down on fire animation
    SequentialAnimation {
        id: goDownAnim
        NumberAnimation { target: myShip; property:"y"; from: myShip.y; to: myShip.y+5;
            easing.type: Easing.Linear; duration: 200 }
        NumberAnimation { target: myShip; property:"y"; from: myShip.y; to: originalY;
            easing.type: Easing.Linear; duration: 200 }
    }


    /*
    MouseArea {
        anchors.fill: parent
        drag.target: myShip
        drag.axis: Drag.XAxis
        drag.minimumX: 0
        drag.maximumX: gameArea.width - myShip.width
        onReleased: {
            fire()
        }
    }
    */


    /*
    property bool isAutoRepeat: false
    Keys.onPressed: {
             if (event.key == Qt.Key_Right) {
                 if (event.isAutoRepeat) {
                     isAutoRepeat = true
                     toRightAnim.restart()
                 } else {
                     isAutoRepeat = false
                     toRotateRightAndCenterAnim.restart()
                 }
                 event.accepted = true
             }
             else if (event.key == Qt.Key_Left) {
                 if (event.isAutoRepeat) {
                     isAutoRepeat = true
                     toLeftAnim.restart()
                 } else {
                     isAutoRepeat = false
                     toRotateLeftAndCenterAnim.restart()
                 }
                 event.accepted = true
             }
         }

    Keys.onReleased: {
        if (isAutoRepeat) {
            toRotateRightAndCenterAnim.stop()
            toRotateLeftAndCenterAnim.stop()
        } else {
            toRotateCenter.restart()
        }
        event.accepted = true
    }

    // Rotation on movement animation
    transform: Rotation { id:rotationId; origin.x: width/2; origin.y: height/2; axis { x: 0; y: 1; z: 0 } angle: 0 }
    SequentialAnimation {
        id: toRotateRightAndCenterAnim
        PropertyAnimation { target: rotationId; easing.type: Easing.Linear;
            properties: "angle"; from: 0; to: 30; duration: 100 }
        PropertyAnimation { target: myShip; easing.type: Easing.OutQuint;
            properties: "x"; from: myShip.x; to: myShip.x + 20; duration: 500 }
        PropertyAnimation { target: rotationId; easing.type: Easing.Linear;
            properties: "angle"; to: 0; duration: 100 }
    }
    SequentialAnimation {
        id: toRotateLeftAndCenterAnim
        PropertyAnimation { target: rotationId; easing.type: Easing.Linear;
            properties: "angle"; from: 0; to: -30; duration: 100 }
        PropertyAnimation { target: myShip; easing.type: Easing.OutQuint;
            properties: "x"; from: myShip.x; to: myShip.x - 20; duration: 500 }
        PropertyAnimation { target: rotationId; easing.type: Easing.Linear;
            properties: "angle"; to: 0; duration: 100 }
    }
    PropertyAnimation { id: toRotateRight; target: rotationId; easing.type: Easing.Linear;
        properties: "angle"; from: 0; to: 30; duration: 100 }
    PropertyAnimation { id: toRotateCenter; target: rotationId; easing.type: Easing.Linear;
        properties: "angle"; to: 0; duration: 100 }
    PropertyAnimation { id: toRotateLeft; target: rotationId; easing.type: Easing.Linear;
        properties: "angle"; from: 0; to: -30; duration: 100 }
*/

}
