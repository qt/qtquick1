CONFIG += testcase
TARGET = tst_qdeclarativeanimations

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative declarative-private core-private gui-private widgets-private
SOURCES += tst_qdeclarativeanimations.cpp
macx:CONFIG -= app_bundle

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
