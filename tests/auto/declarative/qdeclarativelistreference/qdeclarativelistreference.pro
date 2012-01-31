CONFIG += testcase
TARGET = tst_qdeclarativelistreference

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativelistreference.cpp

CONFIG += parallel_test

