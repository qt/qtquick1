CONFIG += testcase
TARGET = tst_qdeclarativerepeater

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativerepeater.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test
