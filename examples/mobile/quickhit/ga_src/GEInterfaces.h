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

#ifndef __GE_IGA_INTERFACES__
#define __GE_IGA_INTERFACES__

#include <QMutex>

namespace GE {

#define AUDIO_FREQUENCY 22050
#define AUDIO_SAMPLE_TYPE short
#define AUDIO_SAMPLE_BITS 16

    class IAudioSource {
    public:
        IAudioSource();
        virtual ~IAudioSource();

        virtual int pullAudio( AUDIO_SAMPLE_TYPE *target, int bufferLength ) = 0;
        virtual bool canBeDestroyed() { return false; }

        IAudioSource *m_next;                // for listing, do not touch if you don't know what you are doing.
    };


    class CAudioMixer : public IAudioSource {
    public:
        CAudioMixer();
        virtual ~CAudioMixer();
        void destroyList();                        // destroy all the sources in the list


        IAudioSource* addAudioSource( IAudioSource *s );        // add new audio source to the list
        bool removeAudioSource( IAudioSource *s );                      // remove an audio source from the list
        int pullAudio( AUDIO_SAMPLE_TYPE *target, int bufferLength );
        void setGeneralVolume( float vol );


    protected:
        QMutex m_mutex;
        int m_fixedGeneralVolume;
        AUDIO_SAMPLE_TYPE *m_mixingBuffer;
        int m_mixingBufferLength;
        IAudioSource *m_sourceList;
    };

};


#endif
