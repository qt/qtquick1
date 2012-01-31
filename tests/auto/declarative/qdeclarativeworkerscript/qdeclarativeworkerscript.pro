CONFIG += testcase
TARGET = tst_qdeclarativeworkerscript

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script core-private script-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeworkerscript.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

