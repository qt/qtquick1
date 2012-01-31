CONFIG += testcase
TARGET = tst_qdeclarativeanimatedimage

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private network
HEADERS += ../shared/testhttpserver.h
SOURCES += tst_qdeclarativeanimatedimage.cpp ../shared/testhttpserver.cpp
macx:CONFIG -= app_bundle

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

