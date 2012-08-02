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

Rectangle {
    id: message
    border.color: "black"
    border.width: 1
    radius: 8
    smooth: true
    opacity: 0 // transparent = 0 by default
    color: "black"

    property string txt
    property int animSpeed

    function showMessage(text,speed) {
        message.border.color = "black"
        message.y = 50
        message.width = gameArea.width / 5 * 4
        message.height = gameArea.height / 8 * 1
        txt = text
        animSpeed = speed
        message.opacity = 1
        messageText.font.pixelSize = parent.width / 14
        messageAnim.restart()
    }

    function showErrorMessage(text,speed) {
        message.border.color = "red"
        message.y = 50
        message.width = gameArea.width / 5 * 4
        message.height = gameArea.height / 8 * 1
        txt = text
        animSpeed = speed
        message.opacity = 1
        messageText.font.pixelSize = parent.width / 14
        messageAnim.restart()
    }

    function showInfoMessage() {
        message.border.color = "white"
        txt = "<a href=\"https://projects.forum.nokia.com/quickhit\">QuickHit</a>" +
              "<p>" +
              "Forum Nokia <br>" +
              "Qt Quick Game Example <br>" +
              "</p>" +
              "<p>" +
              "Sounds were loaded from freesound.org under Creative Commons Sampling Plus 1.0 license.<br>" +
              "</p>" +
              "<p>" +
              "Sounds were created by these nicknames:<br>" +
              "HardPCM<br>" +
              "Matt_G<br>" +
              "klankbeeld<br>" +
              "steveygos93<br>" +
              "joe93barlow<br>" +
              "ljudman<br>" +
              "Jovica<br>" +
              "patchen<br>" +
              "nthompson<br>" +
              "</p>"

        animSpeed = 9000
        message.opacity = 1
        message.y = 10
        message.height = gameArea.height - message.y - 10
        message.width = gameArea.width - 20

        messageText.font.pixelSize = parent.width / 16
        messageAnim.restart()
    }

    //gradient: Gradient {
    //    GradientStop { position: 0.0; color: "white" }
    //    GradientStop { position: 1.0; color: "black" }
    //}

    SequentialAnimation {
        id: messageAnim
        PropertyAnimation {
            target: message; properties: "x";
            from: message.width*-1; to: gameArea.width; duration: animSpeed; easing.type: Easing.OutInExpo}
        PropertyAction { target: message; properties: "opacity"; value: 0 }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            messageAnim.stop()
            message.opacity = 0
        }
    }

    Text {
        id: messageText
        anchors.fill: parent
        anchors.margins: 10
        text: txt
        wrapMode: Text.WordWrap
        color: "white"
        font.family: "Calibri"
        font.pixelSize:  parent.width / 14
        font.bold: true
        onLinkActivated: {
            GameEngine.openLink(link)
        }
    }
}
