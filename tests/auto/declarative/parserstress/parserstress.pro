CONFIG += testcase
TARGET = tst_parserstress

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
macx:CONFIG -= app_bundle

SOURCES += tst_parserstress.cpp

symbian: {
    importFiles.files = ..\\..\\qscriptjstestsuite\\tests
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

