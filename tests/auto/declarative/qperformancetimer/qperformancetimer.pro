CONFIG += testcase
TARGET = tst_qperformancetimer

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative declarative-private
SOURCES += tst_qperformancetimer.cpp
macx:CONFIG -= app_bundle

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
