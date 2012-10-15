CONFIG += testcase
TARGET = tst_qdeclarativeapplication

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative gui-private widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeapplication.cpp
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
