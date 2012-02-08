CONFIG += testcase
TARGET = tst_qdeclarativeloader

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui network widgets
macx:CONFIG -= app_bundle

HEADERS += ../shared/testhttpserver.h
SOURCES += tst_qdeclarativeloader.cpp \
           ../shared/testhttpserver.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test

