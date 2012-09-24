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

//! [0]
Item {
    id: tube

    property real deg

    Image {
        id: bubble

        property real center: tube.width / 2
        property real bubbleCenter: bubble.width / 2

        function calX() {
            var newX = center + tube.deg / -20 * center

            if((newX - bubbleCenter) < 0) {
                return 0
            }
            else if((newX + bubbleCenter) > tube.width) {
                return tube.width - 2 * bubbleCenter
            }

            return newX - bubbleCenter;
        }

        x: calX()
        width: 0.16129032 * parent.width; height: 0.66666667 * parent.height
        source: "images/bubble.png"
        smooth: true
    }

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        width: 0.36451613 * parent.width; height: 0.66666667 * parent.height
        source: "images/scale.png"
    }

    Image {
        width: parent.width; height:  0.32 * parent.height
        opacity: 0.8
        source: "images/reflection.png"
    }
}
//! [0]
