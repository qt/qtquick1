CONFIG += testcase
TARGET = tst_qdeclarativetext

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui gui-private widgets widgets-private core-private script-private
QT += network
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativetext.cpp

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
