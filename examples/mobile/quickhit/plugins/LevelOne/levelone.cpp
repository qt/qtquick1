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

#include "levelone.h"
#include <QtCore/qplugin.h>


LevelOne::LevelOne()
{
}

LevelOne::~LevelOne()
{
}

QString LevelOne::pathPrefix()
{
    /*
QDir::rootPath()
For Unix operating systems this returns "/".
For Windows file systems this normally returns "c:/".
On Symbian this typically returns "c:/data",
*/

#ifdef Q_WS_MAEMO_5
    return "/home/user/.";
#elif defined Q_OS_WIN32
    return QDir::rootPath();
#else
    //return QDir::rootPath()+"/";
    return "c:/System/";
#endif
}

QStringList LevelOne::levelSounds()
{
    QStringList list;

    // NOTE: Mandatory sounds/indexs for the all levels
    // 0 = Enemy explode
    list.append(LevelOne::pathPrefix()+"quickhitdata/levelone/sound/rocket_explosion.wav");
    // 1 = You explode
    list.append(LevelOne::pathPrefix()+"quickhitdata/levelone/sound/crash.wav");
    // 2 = Missile fires
    list.append(LevelOne::pathPrefix()+"quickhitdata/levelone/sound/rocket_explosion.wav");
    // 3 = Emeny Missile fires
    list.append(LevelOne::pathPrefix()+"quickhitdata/levelone/sound/rocket.wav");

    // Additional sounds
    // Level starts
    list.append(LevelOne::pathPrefix()+"quickhitdata/levelone/sound/levelonestart.wav");

    return list;
}

QVariant LevelOne::getData(QVariant key)
{
    QVariant ret;
    switch (key.toInt()) {
    case 1: {
            // Any data what you need for this key
            // Set your data into QVariant (ret)
            break;
        }
    default: {
            break;
        }
    }
    return ret;
}

QVariant LevelOne::graphSize(QVariant pathToGraph)
{
    QVariant ret;
    m_imageReader.setFileName(pathToGraph.toString());
    QSize imageSize = m_imageReader.size();
    ret.setValue(imageSize);
    return ret;
}
