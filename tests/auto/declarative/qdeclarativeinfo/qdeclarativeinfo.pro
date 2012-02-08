CONFIG += testcase
TARGET = tst_qdeclarativeinfo

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeinfo.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test

