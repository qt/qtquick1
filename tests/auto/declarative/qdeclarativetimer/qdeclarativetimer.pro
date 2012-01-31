CONFIG += testcase
TARGET = tst_qdeclarativetimer

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativetimer.cpp

!symbian: {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
