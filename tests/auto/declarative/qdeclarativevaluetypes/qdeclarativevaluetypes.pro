CONFIG += testcase
TARGET = tst_qdeclarativevaluetypes

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private core-private script-private
macx:CONFIG -= app_bundle

HEADERS += testtypes.h

SOURCES += tst_qdeclarativevaluetypes.cpp \
           testtypes.cpp

include(../shared/qdeclarativedatatest.pri)

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
