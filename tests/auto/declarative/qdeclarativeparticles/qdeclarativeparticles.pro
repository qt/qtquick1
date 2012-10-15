CONFIG += testcase
TARGET = tst_qdeclarativeparticles

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeparticles.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
