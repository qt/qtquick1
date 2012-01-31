CONFIG += testcase
TARGET = tst_qmetaobjectbuilder

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private
macx:CONFIG -= app_bundle

SOURCES += \
    tst_qmetaobjectbuilder.cpp

CONFIG += parallel_test
