CONFIG += testcase
TARGET = tst_qdeclarativebinding

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativebinding.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

