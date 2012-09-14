CONFIG += testcase
TARGET = tst_qdeclarativeerror

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
SOURCES += tst_qdeclarativeerror.cpp
macx:CONFIG -= app_bundle

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
