CONFIG += testcase
TARGET = tst_qdeclarativeworkerscript

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative declarative-private script core-private script-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeworkerscript.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
