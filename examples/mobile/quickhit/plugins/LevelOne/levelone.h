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

#ifndef LEVELONE_H
#define LEVELONE_H

#include <QObject>
#include <QDir>
#include <QImageReader>

#include "levelplugininterface.h"

class LevelOne : public LevelPluginInterface
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "Forum.Nokia.com.QuickHit.LevelPluginInterface/1.0" FILE "levelone.json")

    // This macro tells Qt which interfaces the class implements.
    // This is used when implementing plugins.
    Q_INTERFACES(LevelPluginInterface)

public:
    LevelOne();
    ~LevelOne();

    static QString pathPrefix();

public: // From LevelPluginInterface

    QStringList levelSounds();

    Q_INVOKABLE QVariant getData(QVariant key);

    Q_INVOKABLE QVariant graphSize(QVariant pathToGraph);

    Q_INVOKABLE QVariant enemyCount() { return QVariant(30); } // 6x5=30
    Q_INVOKABLE QVariant enemyRowCount() { return QVariant(6); } // 6 rows of enemies
    Q_INVOKABLE QVariant enemySpeed() { return QVariant(36000); }
    Q_INVOKABLE QVariant enemyFireSpeed() { return QVariant(200); }

    // Root paths for the QML, Pictures and Sounds
    Q_INVOKABLE QVariant qmlRootPath() { return QVariant(LevelOne::pathPrefix()+"quickhitdata/levelone/"); }
    Q_INVOKABLE QVariant pictureRootPath() { return QVariant(LevelOne::pathPrefix()+"quickhitdata/levelone/gfx/"); }

    // Full paths
    Q_INVOKABLE QVariant pathToTransparentEnemyPic() {return QVariant(LevelOne::pathPrefix()+"quickhitdata/levelone/gfx/transparent.png");}
    Q_INVOKABLE QVariant pathToMissilePic() {return QVariant(LevelOne::pathPrefix()+"quickhitdata/levelone/gfx/missile2.png");}
    Q_INVOKABLE QVariant pathToEnemyMissilePic() {return QVariant(LevelOne::pathPrefix()+"quickhitdata/levelone/gfx/enemy_missile2.png");}
    Q_INVOKABLE QVariant pathToMyShipPic() {return QVariant(LevelOne::pathPrefix()+"quickhitdata/levelone/gfx/ship.png");}

protected:
    QImageReader    m_imageReader;
};

#endif // LEVELONE_H
