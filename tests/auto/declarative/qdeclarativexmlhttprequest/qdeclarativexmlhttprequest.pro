CONFIG += testcase
TARGET = tst_qdeclarativexmlhttprequest

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 network
macx:CONFIG -= app_bundle

HEADERS += ../shared/testhttpserver.h

SOURCES += tst_qdeclarativexmlhttprequest.cpp \
           ../shared/testhttpserver.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG+=insignificant_test # QTQAINFRA-428
