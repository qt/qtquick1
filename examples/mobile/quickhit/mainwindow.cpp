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

#include "mainwindow.h"
#include "gameengine.h"
#include "plugins/levelplugininterface.h"

#include <QDebug>
#include <QDir>
#include <QMessageBox>
#include <QLibraryInfo>
#include <QDeclarativeEngine>
#include <QDesktopWidget>

MainWindow::MainWindow(QWidget *parent)
    : QDeclarativeView(parent)
{

#ifdef Q_WS_MAEMO_5
    window()->setAttribute(Qt::WA_Maemo5PortraitOrientation, true);
#endif

    // Game engine
    m_gameEngine = new GameEngine(this);

    // Load all levels plugins
    m_levelPlugin = 0;
    loadLevelPlugins();

    // QML main window
    engine()->addImportPath("./imports");
    setResizeMode(QDeclarativeView::SizeRootObjectToView);

    // Set game engine visible to QML
    rootContext()->setContextProperty("GameEngine", m_gameEngine);

    // Set QML source
    setSource(QUrl("qrc:/Game.qml"));
    //setSource(QUrl("../QuickHit/Game.qml"));

    // Store QML root object for game engine
    QObject *ro = static_cast<QObject*>(rootObject());
    m_gameEngine->setGameQml(ro);
    m_gameEngine->findQmlObjects();

    // Application foreground / background event filter for filterin incoming call (window)
    // when game will be paused
    m_eventFilter = new MyEventFilter(this);
    QObject::connect(m_eventFilter,SIGNAL(activationChangeFiltered()),this,SLOT(activationChangeFiltered()));
    qApp->installEventFilter(m_eventFilter);

    // Remove context menu from the all widgets
    QWidgetList widgets = QApplication::allWidgets();
    QWidget* w = 0;
    foreach (w,widgets){
        w->setContextMenuPolicy(Qt::NoContextMenu);
    }
}

MainWindow::~MainWindow()
{
    for (int i=0;i<m_plugins.count();i++) {
        m_plugins[i]->unload();
    }
    m_plugins.clear();

}

void MainWindow::activationChangeFiltered()
{
    m_gameEngine->pauseGame();
}

void MainWindow::levelActivated(int index)
{
    // Set level for the game engine
    createPlugin(index);
    rootContext()->setContextProperty("LevelPlugin", m_levelPlugin);
    m_gameEngine->setGameLevel(m_levelPlugin);
}

void MainWindow::loadLevelPlugins()
{
#if defined (Q_OS_SYMBIAN)
    bool exists_c = loadPlugins("c", "quickhitlevels");
    bool exists_e = loadPlugins("e", "quickhitlevels");
    bool exists_f = loadPlugins("f", "quickhitlevels");
    if (exists_c || exists_e || exists_f) {
        m_gameEngine->setPluginList(m_plugins);
        createPlugin();
    }
    else {
        //QMessageBox::information(this, "QuickHit", "Could not load any of the quickhitlevels");
    }
#else
    if (loadPlugins("c", "quickhitlevels")) {
        m_gameEngine->setPluginList(m_plugins);
        createPlugin();
    }
    else {
        //QMessageBox::information(this, "QuickHit", "Could not load any of the quickhitlevels");
    }


#endif
}

bool MainWindow::loadPlugins(QString drive, QString pluginDir)
{
#if defined (Q_OS_SYMBIAN)
    QDir pluginsDir(drive + ":" + QLibraryInfo::location(QLibraryInfo::PluginsPath));
#elif defined Q_OS_WIN32
    QDir pluginsDir = QDir::currentPath();
#else
    QDir pluginsDir(QLibraryInfo::location(QLibraryInfo::PluginsPath));
#endif
    pluginsDir.cd(pluginDir);

    qDebug() << "Loads plugins from : " << pluginsDir.path();

    bool newPluginsLoaded = false;

    foreach (QString fileName, pluginsDir.entryList(QDir::Files))
        {
            // Accept only plugin files
#if defined (Q_OS_SYMBIAN)
            if (fileName.contains(".qtplugin",Qt::CaseInsensitive)) {
#elif defined (Q_WS_MAEMO_5)
            if (fileName.contains(".so",Qt::CaseInsensitive)) {
#else
            if (fileName.contains(".dll",Qt::CaseInsensitive)) {
#endif

                // Create plugin loader
                QPluginLoader* pluginLoader = new QPluginLoader(pluginsDir.absoluteFilePath(fileName));
                // Load plugin
                bool ret = pluginLoader->load();
                if (!ret) {
                    // Loading failed
                    qDebug() << "Could not load plugin " << fileName;
                } else {
                    // Loading done
                    // Test creating plugin
                    QObject *plugin = 0;
                    LevelPluginInterface* pluginIF = 0;
                    plugin = pluginLoader->instance();
                    pluginIF = qobject_cast<LevelPluginInterface*> (plugin);
                    if (pluginIF) {
                        qDebug() << "Plugin can be created";
                        // Store loader to array
                        m_plugins.append(pluginLoader);
                        newPluginsLoaded = true;
                    } else {
                        pluginLoader->unload();
                        qDebug() << "Plugin can NOT be created!";
                    }
                }
            }
        }

    return newPluginsLoaded;
}


void MainWindow::createPlugin(int index)
{
    if (index == -1) {
        return;
    }

    m_levelPlugin = 0;

    // Try to create plugin instance
    QPluginLoader* pluginLoader = m_plugins[index];
    QObject *plugin = pluginLoader->instance();
    if (plugin) {
        // Plugin instance created
        // Cast plugin to LevelPluginInterface, that is common for all plugins
        LevelPluginInterface* pluginIF = qobject_cast<LevelPluginInterface*> (plugin);
        m_levelPlugin = pluginIF;
        qDebug() << "Plugin created: " << index;
    }
    else {
        qDebug() << "Creating plugin failed!";
        QMessageBox::information(this, "QuickHit", "Could not create quickhitlevels");
    }
}

void MainWindow::printObjectTree(QObject* parent)
{
   if (parent) {
        qDebug() << "className:" << parent->metaObject()->className();
        qDebug() << "objectName:" << parent->objectName();

        QObjectList list = parent->children();
        QObject* item;
        foreach (item,list) {
            if (item->children().count()>0) {
                qDebug() << "--Childrens found--";
                printObjectTree(item);
            } else {
                qDebug() << "className:" << item->metaObject()->className();
                qDebug() << "objectName:" << item->objectName();
            }
        }
    } else {
        qDebug() << "object NULL";
    }

}

