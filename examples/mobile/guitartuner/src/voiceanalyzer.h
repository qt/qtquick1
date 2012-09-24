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

#ifndef VOICEANALYZER_H
#define VOICEANALYZER_H

#include <QObject>
#include <QAudioFormat>
#include <QDebug>
#include <QtCore/qmath.h>
#include <QtCore/qendian.h>
#include <QVariant>

#include "constants.h"
#include "fastfouriertransformer.h"
#include "math.h"

class VoiceAnalyzer : public QIODevice
{
    Q_OBJECT
public:
    VoiceAnalyzer(const QAudioFormat &format, QObject *parent = 0);
    qint64 readData(char *data, qint64 maxlen);
    qint64 writeData(const char *data, qint64 maxlen);
    void start(qreal frequency);
    void stop();
    qreal frequency();
    int getMaximumVoiceDifference();
    int getMaximumPrecisionPerNote();

public slots:
    void setCutOffPercentage(qreal cutoff);

private:
    const QAudioFormat m_format;
    QList<qint16> m_samples;
    int m_totalSampleCount;
    int m_maximumVoiceDifference;

    qint16 getValueInt16(const uchar *ptr);
    int m_stepSize;
    qreal m_frequency;
    qint64 m_position;
    FastFourierTransformer *m_fftHelper;
    void analyzeVoice();
signals:
    void voiceDifference(QVariant frequency);
    void correctFrequency();
    void lowVoice();

public slots:

};


#endif // VOICEANALYZER_H
