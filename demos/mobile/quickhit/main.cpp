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

#include <QtWidgets/QApplication>
#include <QDesktopWidget>
#include "mainwindow.h"

// Lock S60 orientation
#ifdef Q_OS_SYMBIAN
#include <eikenv.h>
#include <eikappui.h>
#include <aknenv.h>
#include <aknappui.h>
#endif

#ifndef QT_NO_OPENGL
    #include <QGLWidget>
#endif


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    // Lock S60 orientation
#ifdef Q_OS_SYMBIAN
    CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
    TRAPD(error,
    if (appUi) {
        appUi->SetOrientationL(CAknAppUi::EAppUiOrientationPortrait);
    }
    );
#endif

    MainWindow w;

#ifndef QT_NO_OPENGL
    // Use QGLWidget to get the opengl support if available
    QGLFormat format = QGLFormat::defaultFormat();
    format.setSampleBuffers(false);

    QGLWidget *glWidget = new QGLWidget(format);
    glWidget->setAutoFillBackground(false);
    w.setViewport(glWidget);     // ownership of glWidget is taken
#endif

    QObject *rootObject = dynamic_cast<QObject*>(w.rootObject());

    // For Qt.exit() from QML
    QObject::connect((QObject*)w.engine(), SIGNAL(quit()), &a, SLOT(quit()));
    // Level activation signal from QML
    QObject::connect(rootObject, SIGNAL(levelActivated(int)), &w, SLOT(levelActivated(int)));

#if defined (Q_OS_SYMBIAN) || defined (Q_WS_MAEMO_5)
    w.setGeometry(QApplication::desktop()->screenGeometry());
    w.showFullScreen();
#else
    w.setGeometry(100,100,360,640);
    w.setFixedSize(360,640);
    w.show();
#endif

    return a.exec();
}
