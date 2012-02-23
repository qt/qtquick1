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

#ifndef LEVELPLUGININTERFACE_H
#define LEVELPLUGININTERFACE_H

#include <QObject>
#include <QVariant>

class LevelPluginInterface : public QObject
{
public:
    // Full paths to level sounds
    virtual QStringList levelSounds() = 0;

    // Generic key/value data
    virtual QVariant getData(QVariant key) = 0;

    // Request picture size
    virtual QVariant graphSize(QVariant pathToGraph) = 0;

    // Enemy count in the level
    virtual QVariant enemyCount() = 0;
    // Enemy row count in the level
    virtual QVariant enemyRowCount() = 0;
    // Enemy speed
    virtual QVariant enemySpeed() = 0;
    // Enemy fire speed
    virtual QVariant enemyFireSpeed() = 0;

    // QML root path
    virtual QVariant qmlRootPath() = 0;
    // Picture root path
    virtual QVariant pictureRootPath() = 0;

    // Paths for GameEngine and QuickHit internal QML files
    virtual QVariant pathToTransparentEnemyPic() = 0;
    virtual QVariant pathToMissilePic() = 0;
    virtual QVariant pathToEnemyMissilePic() = 0;
    virtual QVariant pathToMyShipPic() = 0;
};

// This Qt macro associates the given Identifier "Forum.Nokia.com.QuickHit.LevelPluginInterface/1.0"
// to the interface class called LevelPluginInterface. The Identifier must be unique.

#define LevelPluginInterface_iid "Forum.Nokia.com.QuickHit.LevelPluginInterface/1.0"
Q_DECLARE_INTERFACE(LevelPluginInterface, LevelPluginInterface_iid)

#endif // LEVELPLUGININTERFACE_H
