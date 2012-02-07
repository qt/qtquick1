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

#include "qmlapplicationviewer.h"

#include <QtCore/QDir>
#include <QtCore/QFileInfo>
#include <QtQuick1/QDeclarativeComponent>
#include <QtQuick1/QDeclarativeEngine>
#include <QtQuick1/QDeclarativeContext>
#include <QtWidgets/QApplication>

#include <qplatformdefs.h> // MEEGO_EDITION_HARMATTAN

#ifdef HARMATTAN_BOOSTER
#include <MDeclarativeCache>
#endif

#if defined(QMLJSDEBUGGER) && QT_VERSION < 0x040800

#include <qt_private/qdeclarativedebughelper_p.h>

#if !defined(NO_JSDEBUGGER)
#include <jsdebuggeragent.h>
#endif
#if !defined(NO_QMLOBSERVER)
#include <qdeclarativeviewobserver.h>
#endif

// Enable debugging before any QDeclarativeEngine is created
struct QmlJsDebuggingEnabler
{
    QmlJsDebuggingEnabler()
    {
        QDeclarativeDebugHelper::enableDebugging();
    }
};

// Execute code in constructor before first QDeclarativeEngine is instantiated
static QmlJsDebuggingEnabler enableDebuggingHelper;

#endif // QMLJSDEBUGGER

class QmlApplicationViewerPrivate
{
    QmlApplicationViewerPrivate(QDeclarativeView *view_) : view(view_) {}

    QString mainQmlFile;
    QDeclarativeView *view;
    friend class QmlApplicationViewer;
    QString adjustPath(const QString &path);
};

QString QmlApplicationViewerPrivate::adjustPath(const QString &path)
{
#ifdef Q_OS_MAC
    if (!QDir::isAbsolutePath(path))
        return QString::fromLatin1("%1/../Resources/%2")
                .arg(QCoreApplication::applicationDirPath(), path);
#else
    const QString pathInInstallDir =
            QString::fromLatin1("%1/../%2").arg(QCoreApplication::applicationDirPath(), path);
    if (QFileInfo(pathInInstallDir).exists())
        return pathInInstallDir;
#endif
    return path;
}

QmlApplicationViewer::QmlApplicationViewer(QWidget *parent)
    : QDeclarativeView(parent)
    , d(new QmlApplicationViewerPrivate(this))
{
    connect(engine(), SIGNAL(quit()), SLOT(close()));
    setResizeMode(QDeclarativeView::SizeRootObjectToView);
    // Qt versions prior to 4.8.0 don't have QML/JS debugging services built in
#if defined(QMLJSDEBUGGER) && QT_VERSION < 0x040800
#if !defined(NO_JSDEBUGGER)
    new QmlJSDebugger::JSDebuggerAgent(d->view->engine());
#endif
#if !defined(NO_QMLOBSERVER)
    new QmlJSDebugger::QDeclarativeViewObserver(d->view, d->view);
#endif
#endif
}

QmlApplicationViewer::QmlApplicationViewer(QDeclarativeView *view, QWidget *parent)
    : QDeclarativeView(parent)
    , d(new QmlApplicationViewerPrivate(view))
{
    connect(view->engine(), SIGNAL(quit()), view, SLOT(close()));
    view->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    // Qt versions prior to 4.8.0 don't have QML/JS debugging services built in
#if defined(QMLJSDEBUGGER) && QT_VERSION < 0x040800
#if !defined(NO_JSDEBUGGER)
    new QmlJSDebugger::JSDebuggerAgent(d->view->engine());
#endif
#if !defined(NO_QMLOBSERVER)
    new QmlJSDebugger::QDeclarativeViewObserver(d->view, d->view);
#endif
#endif
}

QmlApplicationViewer::~QmlApplicationViewer()
{
    delete d;
}

QmlApplicationViewer *QmlApplicationViewer::create()
{
#ifdef HARMATTAN_BOOSTER
    return new QmlApplicationViewer(MDeclarativeCache::qDeclarativeView(), 0);
#else
    return new QmlApplicationViewer();
#endif
}

void QmlApplicationViewer::setMainQmlFile(const QString &file)
{
    d->mainQmlFile = d->adjustPath(file);
    d->view->setSource(QUrl::fromLocalFile(d->mainQmlFile));
}

void QmlApplicationViewer::addImportPath(const QString &path)
{
    d->view->engine()->addImportPath(d->adjustPath(path));
}

void QmlApplicationViewer::setOrientation(ScreenOrientation orientation)
{
    // TODO: Needs a Qt5 implmentation
    Q_UNUSED(orientation)
}

void QmlApplicationViewer::showExpanded()
{
#if defined(Q_OS_SYMBIAN) || defined(MEEGO_EDITION_HARMATTAN) || defined(Q_WS_SIMULATOR)
    d->view->showFullScreen();
#elif defined(Q_WS_MAEMO_5)
    d->view->showMaximized();
#else
    d->view->show();
#endif
}

QApplication *createApplication(int &argc, char **argv)
{
#ifdef HARMATTAN_BOOSTER
    return MDeclarativeCache::qApplication(argc, argv);
#else
    return new QApplication(argc, argv);
#endif
}
