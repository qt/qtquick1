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

#include "fastfouriertransformer.h"
#include "math.h"

#define STIN  inline
#define __STATIC

#include "fftpack.c"

// called by __ogg_fdrffti
__STATIC void drfti1(int n, float *wa, int *ifac);
void __ogg_fdrffti(int n, float *wsave, int *ifac);
void __ogg_fdcosqi(int n, float *wsave, int *ifac);
// called by drftf1
STIN void dradf2(int ido,int l1,float *cc,float *ch,float *wa1);
// called by drftf1
STIN void dradf4(int ido,int l1,float *cc,float *ch,float *wa1,
        float *wa2,float *wa3);
// called by drftf1
STIN void dradfg(int ido,int ip,int l1,int idl1,float *cc,float *c1,
        float *c2,float *ch,float *ch2,float *wa);
// called by drftf1
STIN void drftf1(int n,float *c,float *ch,float *wa,int *ifac);
void __ogg_fdrfftf(int n,float *r,float *wsave,int *ifac);
STIN void dcsqf1(int n,float *x,float *w,float *xh,int *ifac);
void __ogg_fdcosqf(int n,float *x,float *wsave,int *ifac);
STIN void dradb2(int ido,int l1,float *cc,float *ch,float *wa1);
STIN void dradb3(int ido,int l1,float *cc,float *ch,float *wa1,
                          float *wa2);
STIN void dradb4(int ido,int l1,float *cc,float *ch,float *wa1,
        float *wa2,float *wa3);
STIN void dradbg(int ido,int ip,int l1,int idl1,float *cc,float *c1,
            float *c2,float *ch,float *ch2,float *wa);
STIN void drftb1(int n, float *c, float *ch, float *wa, int *ifac);
void __ogg_fdrfftb(int n, float *r, float *wsave, int *ifac);
STIN void dcsqb1(int n,float *x,float *w,float *xh,int *ifac);
void __ogg_fdcosqb(int n,float *x,float *wsave,int *ifac);

FastFourierTransformer::FastFourierTransformer(QObject *parent) :
        QObject(parent),
        m_waveFloat(0),
        m_workingArray(0),
        m_ifac(0),
        m_last_n(-1)
{
}

FastFourierTransformer::~FastFourierTransformer()
{
    if (m_waveFloat != 0) {
        delete [] m_waveFloat;
    }
    if (m_workingArray != 0) {
       delete [] m_workingArray;
    }
    if (m_ifac != 0) {
        delete [] m_ifac;
    }
}

/**
  * Prepares the arrays to be of length n.
  */
void FastFourierTransformer::reserve(int n)
{
    Q_ASSERT(n>0);
    if (m_waveFloat != 0) {
        delete [] m_waveFloat;
    }
    if (m_workingArray != 0) {
       delete [] m_workingArray;
    }
    if (m_ifac != 0) {
        delete [] m_ifac;
    }
    m_workingArray = new float[2*n+15];
    m_waveFloat = new float[n];
    m_ifac = new int[n];
    __ogg_fdrffti(n, m_workingArray, m_ifac);
    m_last_n = n;
}

/**
  * Calculates the Fast Fourier Transformation (FFT).
  */
void FastFourierTransformer::calculateFFT(QList<qint16> wave)
{
    const int n = wave.size();
    if (m_last_n != n) {
        reserve(n);
    }
    for (int i = 0; i < n; i++) {
        m_waveFloat[i] = (float) wave.at(i);
    }

    __ogg_fdrfftf(n, m_waveFloat, m_workingArray, m_ifac);

}

/**
  * Returns the index which corresponds to the maximum density
  * of the FFT.
  */
int FastFourierTransformer::getMaximumDensityIndex()
{
    const int halfN = m_last_n / 2;
    float maxDensity = 0;
    int maxDensityIndex = 0;
    float densitySquared = 0.f;
    for (int k = 1; k < halfN; k++) {
        // Here, we calculate the frequency k/N.
        // k=1, the wave oscillation time is N, and the frequency
        //      is 1/sample.
        // k=2, the wave oscillation time is N/2, and the frequency
        //      is 2/sample.
        // k=3, the wave oscillation time is N/3, and the frequency
        //      is 3/sample.
        // Note, that the documentation is for Fortran, so indexes in the
        // documentation does not match.
        // The sine and cosine coefficients are obtained thus as follows:
        const float cosCoefficient = qAbs(m_waveFloat[2*k-1]);
        const float sinCoefficient = qAbs(m_waveFloat[2*k]);

        densitySquared = sinCoefficient*sinCoefficient + cosCoefficient*cosCoefficient;
        if (densitySquared > maxDensity) {
            maxDensity = densitySquared;
            maxDensityIndex = k;
        }
    }

    if (m_cutOffForDensitySquared < maxDensity) {
        return maxDensityIndex;
    }
    else {
        return -1;
    }
}

/**
  * Sets the cutoff density.
  */
void FastFourierTransformer::setCutOffForDensity(float cutoff)
{
    m_cutOffForDensitySquared = cutoff*cutoff;
}
