CONFIG += testcase
TARGET = tst_qperformancetimer

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
SOURCES += tst_qperformancetimer.cpp
macx:CONFIG -= app_bundle

CONFIG += parallel_test

