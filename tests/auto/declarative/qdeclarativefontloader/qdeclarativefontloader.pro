CONFIG += testcase
TARGET = tst_qdeclarativefontloader

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui network
macx:CONFIG -= app_bundle

HEADERS += ../shared/testhttpserver.h
SOURCES += tst_qdeclarativefontloader.cpp ../shared/testhttpserver.cpp
include(../shared/qdeclarativedatatest.pri)
CONFIG += parallel_test
