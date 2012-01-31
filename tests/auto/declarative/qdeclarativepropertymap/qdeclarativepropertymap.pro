CONFIG += testcase
TARGET = tst_qdeclarativepropertymap

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativepropertymap.cpp

CONFIG += parallel_test

