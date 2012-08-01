CONFIG += testcase
TARGET = tst_qdeclarativedom

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativedom.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
