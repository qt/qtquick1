CONFIG += testcase
TARGET = tst_qdeclarativeconnection

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui core-private script-private gui-private widgets-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeconnection.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

