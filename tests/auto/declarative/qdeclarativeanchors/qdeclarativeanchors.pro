CONFIG += testcase
TARGET = tst_qdeclarativeanchors

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private widgets widgets-private gui gui-private core-private
SOURCES += tst_qdeclarativeanchors.cpp
macx:CONFIG -= app_bundle

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

