CONFIG += testcase
TARGET = tst_qdeclarativeview

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative gui widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeview.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
