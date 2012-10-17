CONFIG += testcase
testcase.timeout = 400 # this test is slow
TARGET = tst_examples

!contains(QT_CONFIG, webkit): DEFINES += QT_NO_WEBKIT
!contains(QT_CONFIG, xmlpatterns): DEFINES += QT_NO_XMLPATTERNS

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative
macx:CONFIG -= app_bundle

SOURCES += tst_examples.cpp 

include(../../../../tools/qml/qml.pri)

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
