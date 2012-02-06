CONFIG += testcase
TARGET = tst_qdeclarativeloader

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui network widgets
macx:CONFIG -= app_bundle

INCLUDEPATH += ../shared/
HEADERS += ../shared/testhttpserver.h
SOURCES += tst_qdeclarativeloader.cpp \
           ../shared/testhttpserver.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

