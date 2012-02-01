CONFIG += testcase
TARGET = tst_qdeclarativesystempalette

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativesystempalette.cpp

!symbian: {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

