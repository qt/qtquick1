CONFIG += testcase
TARGET = tst_qdeclarativecontext

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
SOURCES += tst_qdeclarativecontext.cpp
macx:CONFIG -= app_bundle

!symbian: {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
