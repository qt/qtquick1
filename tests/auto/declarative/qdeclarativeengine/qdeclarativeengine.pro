CONFIG += testcase
TARGET = tst_qdeclarativeengine

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative network
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeengine.cpp 

DEFINES += SRCDIR=\\\"$$PWD\\\"

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
