CONFIG += testcase
TARGET = tst_qdeclarativelanguage

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script-private core-private
QT += script network
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativelanguage.cpp \
           testtypes.cpp
HEADERS += testtypes.h

INCLUDEPATH += ../shared/
HEADERS += ../shared/testhttpserver.h
SOURCES += ../shared/testhttpserver.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test
