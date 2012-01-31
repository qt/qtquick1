CONFIG += testcase
TARGET = tst_qdeclarativecomponent

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
QT += script network
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativecomponent.cpp 

!symbian: {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

