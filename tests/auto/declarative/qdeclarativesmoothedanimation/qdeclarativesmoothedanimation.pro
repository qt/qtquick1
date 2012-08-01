CONFIG += testcase
TARGET = tst_qdeclarativesmoothedanimation

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui core-private script-private widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativesmoothedanimation.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
