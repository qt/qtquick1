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

/* The model component for the NoteButtonView. */
ListModel {
    ListElement {
        note: "E"
        offSource: "./images/tuner_e.png"
        onSource: "./images/tuner_e_on.png"
        bigSource: "./mycomponents/images/big_e.png"
        glowSource: "./mycomponents/images/glowing_e.png"
        frequency: "82.407"
        interval: "5"
    }
    ListElement {
        note: "A"
        offSource: "./images/tuner_a.png"
        onSource: "./images/tuner_a_on.png"
        bigSource: "./mycomponents/images/big_a.png"
        glowSource: "./mycomponents/images/glowing_a.png"
        frequency: "110.00"
        interval: "5"
    }
    ListElement {
        note: "D"
        offSource: "./images/tuner_d.png"
        onSource: "./images/tuner_d_on.png"
        bigSource: "./mycomponents/images/big_d.png"
        glowSource: "./mycomponents/images/glowing_d.png"
        frequency: "146.83"
        interval: "5"
    }
    ListElement {
        note: "G"
        offSource: "./images/tuner_g.png"
        onSource: "./images/tuner_g_on.png"
        bigSource: "./mycomponents/images/big_g.png"
        glowSource: "./mycomponents/images/glowing_g.png"
        frequency: "196.00"
        interval: "4"
    }
    ListElement {
        note: "B"
        offSource: "./images/tuner_b.png"
        onSource: "./images/tuner_b_on.png"
        bigSource: "./mycomponents/images/big_b.png"
        glowSource: "./mycomponents/images/glowing_b.png"
        frequency: "246.94"
        interval: "5"
    }
    ListElement {
        note: "e"
        offSource: "./images/tuner_e.png"
        onSource: "./images/tuner_e_on.png"
        bigSource: "./mycomponents/images/big_e.png"
        glowSource: "./mycomponents/images/glowing_e.png"
        frequency: "329.63"
        interval: "9999" //Big enough that we can't move over this note
    }
    ListElement {
        note: "Auto"
        offSource: "./images/tuner_auto.png"
        onSource: "./images/tuner_auto_on.png"
        frequency: "82.407"
    }
}
