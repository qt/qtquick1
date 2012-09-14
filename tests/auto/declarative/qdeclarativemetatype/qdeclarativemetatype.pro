CONFIG += testcase
TARGET = tst_qdeclarativemetatype

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private widgets
SOURCES += tst_qdeclarativemetatype.cpp
macx:CONFIG -= app_bundle

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
