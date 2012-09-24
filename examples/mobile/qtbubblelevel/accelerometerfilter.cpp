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

#include <math.h>
#include "accelerometerfilter.h"

#define RADIANS_TO_DEGREES 57.2957795

AccelerometerFilter::AccelerometerFilter()
    : x(0), y(0), z(0)
{
}

//! [0]
bool AccelerometerFilter::filter(QAccelerometerReading *reading)
{
    qreal rx = reading->x();
    qreal ry = reading->y();
    qreal rz = reading->z();

    qreal divider = sqrt(rx * rx + ry * ry + rz * rz);

    // Lowpass factor
#ifdef Q_OS_SYMBIAN
    float lowPassFactor = 0.10;
#else
    float lowPassFactor = 0.05;
#endif

    // Calculate the axis angles in degrees and reduce the noise in sensor
    // readings.
    x += (acos(rx / divider) * RADIANS_TO_DEGREES - 90 - x) * lowPassFactor;
    y += (acos(ry / divider) * RADIANS_TO_DEGREES - 90 - y) * lowPassFactor;
    z += (acos(rz / divider) * RADIANS_TO_DEGREES - 90 - z) * lowPassFactor;

    // The orientations of the accelerometers are different between
    // Symbian and Maemo devices so we use the different axes
    // depending on the platform.
#if defined(Q_OS_SYMBIAN)
    emit rotationChanged(-y);
#else
    emit rotationChanged(x);
#endif

    // Don't store the reading in the sensor.
    return false;
}
//! [0]
