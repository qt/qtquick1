CONFIG += testcase
TARGET = tst_qdeclarativelayoutitem

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativelayoutitem.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
