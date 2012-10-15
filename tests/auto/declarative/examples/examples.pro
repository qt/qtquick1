CONFIG += testcase
testcase.timeout = 400 # this test is slow
TARGET = tst_examples

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative
macx:CONFIG -= app_bundle

SOURCES += tst_examples.cpp 

include(../../../../tools/qml/qml.pri)

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
