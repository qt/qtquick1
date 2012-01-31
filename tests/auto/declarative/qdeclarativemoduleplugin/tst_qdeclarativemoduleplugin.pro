CONFIG += testcase
TARGET = tst_qdeclarativemoduleplugin

QT += quick1 network testlib
CONFIG -= app_bundle

HEADERS = ../shared/testhttpserver.h
SOURCES = tst_qdeclarativemoduleplugin.cpp \
          ../shared/testhttpserver.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}
