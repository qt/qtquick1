CONFIG += testcase
TARGET = tst_qdeclarativeborderimage

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative declarative-private widgets network
macx:CONFIG -= app_bundle

HEADERS += ../shared/testhttpserver.h
SOURCES += tst_qdeclarativeborderimage.cpp ../shared/testhttpserver.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
