CONFIG += testcase
TARGET = tst_qdeclarativexmllistmodel

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script gui network core-private script-private xmlpatterns
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativexmllistmodel.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test
