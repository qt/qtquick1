CONFIG += testcase
TARGET = tst_qdeclarativevisualdatamodel

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative declarative-private gui widgets core-private script-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativevisualdatamodel.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
