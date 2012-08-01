CONFIG += testcase
TARGET = tst_qdeclarativepositioners

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private core-private gui-private widgets-private
SOURCES += tst_qdeclarativepositioners.cpp
macx:CONFIG -= app_bundle

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
