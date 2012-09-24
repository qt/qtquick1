/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the demonstration applications of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0

/* A meter component. */
Rectangle {
    id: meter

    property real value: 0
    property real minValue: -1
    property real maxValue: 1
    property alias imageSize: meterImage.sourceSize

    function valueChanged(pValue) {
        value = pValue;
        scaleValueToAngle();
    }
    function scaleValueToAngle() {
        pointer.angle = (((value-minValue)/(maxValue-minValue))*
                          (pointer.angleMax-pointer.angleMin))+
                           pointer.angleMin;
    }

    color: "transparent"

    Image {
        id: meterImage

        smooth: true
        source: "./images/meterBG.png"
        anchors.fill: parent
    }

    Image {
        id:pointerShadow

        x: pointer.x - 2
        y: pointer.y - 2
        height: pointer.height
        smooth: true
        source: "./images/pointerShadow.png"
        transform: Rotation {
            origin.x: 2
            origin.y: height
            angle: -pointer.angle
        }
    }

    Image {
        id: pointer

        property real angle: 0
        property real angleMax: -45
        property real angleMin: 45

        height: parent.height*0.92
        transformOrigin: "Bottom"
        rotation: -angle
        smooth: true
        source: "./images/pointer.png"
        anchors {
            bottomMargin: 2
            bottom: parent.bottom;
            horizontalCenter: parent.horizontalCenter
        }

        Behavior on angle {
            SpringAnimation {
                spring: 1.4
                damping: 0.15
            }
        }
    }
}
