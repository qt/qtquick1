CONFIG += testcase
TARGET = tst_qdeclarativerepeater

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativerepeater.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
