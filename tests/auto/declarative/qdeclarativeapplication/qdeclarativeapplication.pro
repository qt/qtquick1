CONFIG += testcase
TARGET = tst_qdeclarativeapplication

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 gui-private widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeapplication.cpp
