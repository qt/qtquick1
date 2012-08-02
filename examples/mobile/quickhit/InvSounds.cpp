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

#include "InvSounds.h"
#include <QDir>
#include <QDebug>

using namespace GE;

CInvSounds::CInvSounds(QObject *parent) : QObject( parent )
{
    m_musicInstance = 0;
    m_sounds = 0;
    m_internalSounds = 0;
    m_soundCount = 0;
    m_internalSoundCount = 0;

    enableSounds(true);

    m_audioOut = new AudioOut( this, &m_mixer );

    enableInternalSounds();
}

void CInvSounds::enableSounds(bool enable)
{
    if (enable)
        m_mixer.setGeneralVolume(0.2f);
    else
        m_mixer.setGeneralVolume(0);
}

void CInvSounds::enableInternalSounds()
{
    disableInternalSounds();

    // Application internal sounda
    m_internalSoundPaths.append(":/sound/menu1.wav");
    m_internalSoundPaths.append(":/sound/menu2.wav");
    m_internalSoundPaths.append(":/sound/gamestart.wav");
    m_internalSoundPaths.append(":/sound/gameover.wav");
    m_internalSoundPaths.append(":/sound/youwin.wav");

    m_internalSoundCount = m_internalSoundPaths.count();
    m_internalSounds = new CAudioBuffer*[m_internalSoundCount];

    // Load general application sounds
    for (int ff=0; ff<m_internalSoundPaths.count(); ff++) {
        m_internalSounds[ff] =  CAudioBuffer::loadWav(m_internalSoundPaths[ff]);
    }
}

void CInvSounds::enableSounds(QStringList sounds)
{
    disableSounds();

    // Sounds from the level
    m_soundPaths = sounds;
    m_soundCount = sounds.count();
    m_sounds = new CAudioBuffer*[m_soundCount];
    // Load level sounds
    for (int f=0; f<m_soundPaths.count(); f++) {
        m_sounds[f] =  CAudioBuffer::loadWav(m_soundPaths[f]);
    }

}

void CInvSounds::disableInternalSounds()
{
    for (int f=0; f<m_internalSoundCount; f++) {
        if (m_internalSounds[f]) {
            delete m_internalSounds[f];
        }
    }
    delete [] m_internalSounds;
    m_internalSoundCount = 0;
    m_internalSoundPaths.clear();

    m_musicInstance = 0;
}

void CInvSounds::disableSounds()
{
    for (int f=0; f<m_soundCount; f++) {
        if (m_sounds[f]) {
            delete m_sounds[f];
        }
    }
    delete [] m_sounds;
    m_sounds = 0;
    m_soundCount = 0;
    m_soundPaths.clear();

    m_musicInstance = 0;
}

CInvSounds::~CInvSounds() {
    if (m_audioOut) {
        delete m_audioOut;
        m_audioOut = 0;
    }

    disableSounds();
    disableInternalSounds();
}


void CInvSounds::beginMusicOn() {
    m_musicInstance = (GE::CAudioBufferPlayInstance*)m_mixer.addAudioSource( new GE::CAudioBufferPlayInstance( m_sounds[0] ) );
    m_musicInstance->setLoopTimes(-1);
}


void CInvSounds::beginMusicOff() {
    if (!m_musicInstance) return;
    m_musicInstance->setLoopTimes(0);       // stop when finished
    m_musicInstance = 0;
};


void CInvSounds::playSound(int index) {
    if (index < m_soundCount && index > -1) {
        m_sounds[index]->playWithMixer( m_mixer );
    }
}

void CInvSounds::playSounds(int index, int count)
{
    if (index < m_soundCount && index > -1) {
        CAudioBufferPlayInstance* i = m_sounds[index]->playWithMixer( m_mixer );
        i->setLoopTimes(count);
    }
}

void CInvSounds::playInternalSound(int index) {
    if (index < m_internalSoundCount && index > -1) {
        m_internalSounds[index]->playWithMixer( m_mixer );
    }
}

void CInvSounds::playInternalSounds(int index, int count)
{
    if (index < m_internalSoundCount && index > -1) {
        CAudioBufferPlayInstance* i = m_internalSounds[index]->playWithMixer( m_mixer );
        i->setLoopTimes(count);
    }
}

void CInvSounds::gameStartSound() {
    CAudioBufferPlayInstance* i = m_internalSounds[2]->playWithMixer( m_mixer );
    i->setLoopTimes(2);
};
