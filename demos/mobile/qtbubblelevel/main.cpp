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

#include <QtQuick1>
#include <QtGui>
#include <QAccelerometer>

#include "accelerometerfilter.h"
#include "settings.h"
#include "taskswitcher.h"

// Lock orientation in Symbian
#ifdef Q_OS_SYMBIAN
    #include <eikenv.h>
    #include <eikappui.h>
    #include <aknenv.h>
    #include <aknappui.h>
#endif

QTM_USE_NAMESPACE


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

#ifdef Q_OS_SYMBIAN
    // Lock orientation to landscape in Symbian
    CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
    TRAP_IGNORE(
        if (appUi)
            appUi->SetOrientationL(CAknAppUi::EAppUiOrientationLandscape);
    )
#endif

    //! [0]
    QDeclarativeView view;
    view.setSource(QUrl("qrc:/qml/BubbleLevel.qml"));
    view.setResizeMode(QDeclarativeView::SizeRootObjectToView);
    //! [0]

    // ![1]
    Settings settings;

    QAccelerometer sensor;
    AccelerometerFilter filter;
    sensor.addFilter(&filter);
    //! [1]

    //! [2]
    QObject *rootObject = dynamic_cast<QObject*>(view.rootObject());

    // Associate Qt / QML signals and slots
    QObject::connect(rootObject, SIGNAL(saveCorrectionAngle(const QVariant&)),
                     &settings, SLOT(saveCorrectionAngle(const QVariant&)));

    QObject::connect(&filter, SIGNAL(rotationChanged(const QVariant&)),
                     rootObject, SLOT(handleRotation(const QVariant&)));

    QObject::connect(&settings, SIGNAL(correctionAngle(const QVariant&)),
                     rootObject, SLOT(setCorrectionAngle(const QVariant&)));

    QObject::connect((QObject*)view.engine(), SIGNAL(quit()),
                     &app, SLOT(quit()));
    //! [2]

    //! [3]
#ifdef Q_WS_MAEMO_5
    TaskSwitcher taskSwitcher;

    QObject::connect(rootObject, SIGNAL(minimizeApplication()),
                     &taskSwitcher, SLOT(minimizeApplication()));

    // Show the task switcher button
    rootObject->setProperty("taskSwitcherVisible", true);
#endif
    //! [3]

    //! [4]
    // Read correction factor from permanent storage and emit it to QML side
    settings.loadAndEmitCorrectionAngle();

    // Begin measuring of the accelerometer sensor
    sensor.start();
    //! [4]

    //! [5]
#if defined(Q_WS_MAEMO_5) || defined(Q_OS_SYMBIAN) || defined(Q_WS_SIMULATOR)
    view.setGeometry(QApplication::desktop()->screenGeometry());
    view.showFullScreen();
#else
    view.setGeometry((QRect(100, 100, 800, 480)));
    view.show();
#endif
    //! [5]

    return app.exec();
}
