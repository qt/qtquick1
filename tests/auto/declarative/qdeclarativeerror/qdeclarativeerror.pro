CONFIG += testcase
TARGET = tst_qdeclarativeerror

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
SOURCES += tst_qdeclarativeerror.cpp
macx:CONFIG -= app_bundle

!symbian: {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test
