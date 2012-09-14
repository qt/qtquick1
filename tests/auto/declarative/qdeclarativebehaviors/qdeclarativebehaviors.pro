CONFIG += testcase
TARGET = tst_qdeclarativebehaviors

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private core-private widgets-private gui-private
SOURCES += tst_qdeclarativebehaviors.cpp
macx:CONFIG -= app_bundle

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
