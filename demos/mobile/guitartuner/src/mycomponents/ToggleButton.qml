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

/* A toggle button component. */
Rectangle {
    id: toggleButton

    property url offImageSource: ""
    property url onImageSource: ""
    property alias imageSource: buttonImage.source

    signal selected()
    signal pushed()

    color: "transparent"
    state: "unPressed"
    onStateChanged: {
        if (state == "pressed") {
            selected()
        }
    }

    Image {
        id: buttonImage

        smooth: true
        anchors.fill: parent
    }
    MouseArea {
        id: mouseArea

        anchors.fill: parent
        onPressed: {
            if (parent.state == "unPressed") {
                pushed()
            }
        }
    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: toggleButton
                scale: 0.95
                imageSource: onImageSource
            }
        },
        State {
            name: "unPressed"
            PropertyChanges {
                target: toggleButton
                scale: 1/0.95
                imageSource: offImageSource
            }
        }
    ]

    transitions: [
        Transition {
            from: "unPressed"
            to: "pressed"
            reversible: true
            PropertyAnimation {
                target: toggleButton
                properties: "scale"
                duration: 100
            }
        }
    ]
}
