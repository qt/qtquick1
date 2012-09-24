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

#include <memory.h>
#include "GEInterfaces.h"


using namespace GE;

/**
 * CAudioSource
 * common functionality
 *
 */
IAudioSource::IAudioSource() {
    m_next = 0;
};

IAudioSource::~IAudioSource() {


};

/**
 * CAudioMixer
 *
 */
CAudioMixer::CAudioMixer() {
    m_sourceList = 0;
    m_mixingBuffer = 0;
    m_mixingBufferLength = 0;
    m_fixedGeneralVolume = 4096;
};


CAudioMixer::~CAudioMixer() {
    destroyList();
    if (m_mixingBuffer) {
        delete [] m_mixingBuffer;
        m_mixingBuffer = 0;
    };
};

void CAudioMixer::destroyList() {
    m_mutex.lock();
    IAudioSource *l = m_sourceList;
    while (l) {
        IAudioSource *n = l->m_next;
        delete l;
        l = n;
    };
    m_sourceList = 0;
    m_mutex.unlock();
};


IAudioSource* CAudioMixer::addAudioSource( IAudioSource *source ) {
    m_mutex.lock();
    source->m_next = 0;
    if (m_sourceList) {
        IAudioSource *l = m_sourceList;
        while (l->m_next) l = l->m_next;
        l->m_next = source;
    } else m_sourceList = source;
    m_mutex.unlock();
    return source;

};


bool CAudioMixer::removeAudioSource( IAudioSource *source ) {
    return true;
};

void CAudioMixer::setGeneralVolume( float vol ) {
    m_fixedGeneralVolume = (4096.0f*vol);
};

int CAudioMixer::pullAudio( AUDIO_SAMPLE_TYPE *target, int bufferLength ) {

    if (!m_sourceList) return 0;

    m_mutex.lock();


    if (m_mixingBufferLength<bufferLength) {
        if (m_mixingBuffer) delete [] m_mixingBuffer;
        m_mixingBufferLength = bufferLength;
        m_mixingBuffer = new AUDIO_SAMPLE_TYPE[ m_mixingBufferLength ];
    };

    memset( target, 0, sizeof( AUDIO_SAMPLE_TYPE ) * bufferLength );

    AUDIO_SAMPLE_TYPE *t;
    AUDIO_SAMPLE_TYPE *t_target;
    AUDIO_SAMPLE_TYPE *s;

    IAudioSource *prev = 0;
    IAudioSource *l = m_sourceList;
    while (l) {
        IAudioSource *next = l->m_next;

            // process l
        int mixed = l->pullAudio( m_mixingBuffer, bufferLength );
        if (mixed>0) {
            // mix to main..
            t = target;
            t_target = t+mixed;
            s = m_mixingBuffer;
            while (t!=t_target) {
                *t +=(((*s)*m_fixedGeneralVolume)>>12);
                t++;
                s++;
            };
        };



        // autodestroy
        if (l->canBeDestroyed() == true) {          // NOTE, IS UNDER TESTING,... MIGHT CAUSE UNPREDICTABLE CRASHING WITH SOME USE CASES!!!
            if (!prev)
                m_sourceList = next;
            else prev->m_next = next;
            delete l;
            l = 0;
        };




        prev = l;
        l = next;
    };
    m_mutex.unlock();
    return bufferLength;
};




