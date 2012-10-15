CONFIG += testcase
TARGET = tst_qdeclarativeflickable

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative declarative-private gui widgets script-private core-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeflickable.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
