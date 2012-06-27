CONFIG += testcase
TARGET = tst_qdeclarativeqt

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script script-private core-private widgets
SOURCES += tst_qdeclarativeqt.cpp
macx:CONFIG -= app_bundle

include(../shared/qdeclarativedatatest.pri)

# QMAKE_CXXFLAGS = -fprofile-arcs -ftest-coverage
# LIBS += -lgcov

CONFIG += parallel_test
