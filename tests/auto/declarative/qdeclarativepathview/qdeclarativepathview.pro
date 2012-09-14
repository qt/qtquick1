CONFIG += testcase
TARGET = tst_qdeclarativepathview

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui widgets core-private script-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativepathview.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
