CONFIG += testcase
TARGET = tst_qdeclarativelanguage

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script-private core-private
QT += script network
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativelanguage.cpp \
           testtypes.cpp
HEADERS += testtypes.h

HEADERS += ../shared/testhttpserver.h
SOURCES += ../shared/testhttpserver.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
