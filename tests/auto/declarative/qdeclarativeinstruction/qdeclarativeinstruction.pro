CONFIG += testcase
TARGET = tst_qdeclarativeinstruction

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script script-private core-private
SOURCES += tst_qdeclarativeinstruction.cpp
macx:CONFIG -= app_bundle

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
