CONFIG += testcase
TARGET = tst_qdeclarativebehaviors

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private core-private widgets-private gui-private
SOURCES += tst_qdeclarativebehaviors.cpp
macx:CONFIG -= app_bundle

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

