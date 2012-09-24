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

#ifndef GUITARTUNERUI_H
#define GUITARTUNERUI_H

#include <QWidget>
#include <QDebug>

namespace Ui {
    class GuitarTunerUI;
}

const qreal FrequencyE = 82.407;
const qreal FrequencyA = 110.00;
const qreal FrequencyD = 146.83;
const qreal FrequencyG = 196.00;
const qreal FrequencyB = 246.94;
const qreal FrequencyE2 = 329.63;

class GuitarTunerUI : public QWidget
{
    Q_OBJECT

public:
    explicit GuitarTunerUI(QWidget *parent = 0);
    ~GuitarTunerUI();

    qreal getVolume() const;
    bool getMuteState() const;
    qreal getMicrophoneSensitivity() const;
    bool isInputModeActive() const;
    qreal getFrequency() const;
    int getScaleMaximumValue() const;
    void setMaximumVoiceDifference(int max);
    void setMaximumPrecisionPerNote(int max);

public slots:
    void toggleSound(bool off);
    void next();
    void prev();
    void changeVolume();
    void toggleInputOrOutput();

    void lowVoice();
    void voiceDifference(qreal difference);
    void correctFrequencyObtained();

signals:
    void modeChanged(bool isInput);
    void volumeChanged(qreal volume);
    void microphoneSensitivityChanged(qreal sensitivity);
    void muteChanged(bool isMuted);
    void targetFrequencyChanged(qreal targetFrequency);

protected:
    void changeEvent(QEvent *e);

private:
    Ui::GuitarTunerUI *ui;
    void changeTone(int newIndex);
    qreal getVolumeFromSoundSlider() const;
    int m_currentToneIndex;
    QString m_currentToneString;
    qreal m_currentToneFrequency;
    void updateFrequencyByToneIndex(int index);
    bool m_outputActive;
    bool m_muted;
    qreal m_outputVolumeLevel;
    qreal m_inputVolumeLevel;
    int m_maximumPrecision;
};

#endif // GUITARTUNERUI_H
