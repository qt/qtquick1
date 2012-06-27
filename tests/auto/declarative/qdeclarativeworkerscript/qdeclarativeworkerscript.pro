CONFIG += testcase
TARGET = tst_qdeclarativeworkerscript

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script core-private script-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeworkerscript.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test
