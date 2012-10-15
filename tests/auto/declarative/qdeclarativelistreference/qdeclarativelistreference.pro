CONFIG += testcase
TARGET = tst_qdeclarativelistreference

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativelistreference.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
