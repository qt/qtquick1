CONFIG += testcase
TARGET = tst_qdeclarativemoduleplugin

QT += quick1 network testlib
CONFIG -= app_bundle

HEADERS = ../shared/testhttpserver.h
SOURCES = tst_qdeclarativemoduleplugin.cpp \
          ../shared/testhttpserver.cpp

include(../shared/qdeclarativedatatest.pri)
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
