CONFIG += testcase
TARGET = tst_qdeclarativeproperty

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script-private core-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeproperty.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test

