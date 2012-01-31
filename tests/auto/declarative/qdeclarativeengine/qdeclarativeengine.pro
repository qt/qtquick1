CONFIG += testcase
TARGET = tst_qdeclarativeengine

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 network
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeengine.cpp 

!symbian: {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

