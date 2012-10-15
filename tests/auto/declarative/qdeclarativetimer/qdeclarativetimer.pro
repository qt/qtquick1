CONFIG += testcase
TARGET = tst_qdeclarativetimer

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative declarative-private gui
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativetimer.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
