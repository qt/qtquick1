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

Text {
    id: menuItem
    text: name
    color: "white"
    opacity: 1
    font.family: "Calibri"
    font.pixelSize:  menu.width / 8
    x: (parent.width - width )/ 2

    property bool selectedItem: false
    property int type

    signal itemSelected()

    transform: Rotation { id:rotationId; origin.x:width/2; origin.y:height/2; axis { x: 1; y: 0; z: 0 } angle: 0 }
    SequentialAnimation {
        id: toRotateRightAndCenterAnim
        PropertyAnimation { target: rotationId; easing.type: Easing.Linear;
            properties: "angle"; from: 0; to: 180; duration: 300 }
        PropertyAction  { target: menuItem; property: "color"; value:"red"}
        PropertyAnimation { target: rotationId; easing.type: Easing.Linear;
            properties: "angle"; from: 180; to: 360; duration: 300 }
        PropertyAction  { target: menuItem; property: "color"; value:"white"}
    }

    function selectItem(doSelect) {
        if (!toRotateRightAndCenterAnim.running) {
            GameEngine.playInternalSound(0)
            toRotateRightAndCenterAnim.restart()
            if (doSelect) {
                GameEngine.playInternalSound(1)
                selectionTimer.restart()
            }
        }
    }

    Timer {
        id: selectionTimer
        interval: 1000; running: false; repeat: false
        onTriggered: menuItem.itemSelected()
    }

    MouseArea {
        id: mouseArea;
        anchors.fill: parent
        onClicked: {
            selectItem(true)
        }
    }

    Keys.onSpacePressed: { selectItem(true) }
    Keys.onSelectPressed: { selectItem(true) }
    Keys.onEnterPressed: { selectItem(true) }
    Keys.onReleased: {
        if (event.key == Qt.Key_Down || event.key == Qt.Key_Up) {
            selectItem(false)
        }
        event.accepted = false
    }
}

