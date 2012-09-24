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
import "adjustbars.js" as AdjustBars

/* A barchart-like adjuster component. */
Rectangle {
    id: adjuster

    property real max: 100
    property real value: 0
    property bool created: false

    signal valueChanged(real value)
    signal focusChangedByClick()
    signal arrowPressedWhenValueOverLimits()

    function setValue(pValue) {
        value = pValue;
        AdjustBars.fillBars(value/max*AdjustBars.maxBars);
        valueChanged(value);
    }

    height: 60; width: 300
    color: "transparent"
    Keys.onRightPressed: {
        var val = value+max/AdjustBars.maxBars;
        if (val <= max) {
            value = val;
            AdjustBars.fillBars(value/max*AdjustBars.maxBars);
            valueChanged(value);
        }
        else {
            arrowPressedWhenValueOverLimits()
        }
    }
    Keys.onLeftPressed: {
        var val = value-max/AdjustBars.maxBars;
        if (0 <= val) {
            value = val;
            AdjustBars.fillBars(value/max*AdjustBars.maxBars);
            valueChanged(value);
        }
        else {
            arrowPressedWhenValueOverLimits()
        }
    }
    Component.onCompleted: {
        AdjustBars.createBars();
        AdjustBars.fillBars(value/max*AdjustBars.maxBars);
        created = true;
    }
    Component.onDestruction: {
        AdjustBars.destroyBars;
    }
    //Dynamic objects have to be recreated when the window size changes.
    onWidthChanged: {
        if (created) {
            AdjustBars.destroyBars();
            AdjustBars.createBars();
            AdjustBars.fillBars(value/max*AdjustBars.maxBars);
        }
    }
    onHeightChanged: {
        if (created) {
            AdjustBars.destroyBars();
            AdjustBars.createBars();
            AdjustBars.fillBars(value/max*AdjustBars.maxBars);
        }
    }

    MouseArea {
        anchors.fill: parent
        onPositionChanged: {
            focusChangedByClick();
            var val = mouse.x/parent.width*parent.max;
            if (0 < val && val < max) {
                parent.value = val;
                AdjustBars.fillBars(parent.value/parent.max*AdjustBars.maxBars);
                valueChanged(parent.value);
            }
        }
        onClicked: {
            focusChangedByClick();
            var val = mouse.x/parent.width*parent.max;
            if (0 < val && val < max) {
                parent.value = val;
                AdjustBars.fillBars(parent.value/parent.max*AdjustBars.maxBars);
                valueChanged(parent.value);
            }
        }
    }
}
