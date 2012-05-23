CONFIG += testcase
TARGET = tst_qdeclarativeimage

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui widgets network
macx:CONFIG -= app_bundle

HEADERS += ../shared/testhttpserver.h
SOURCES += tst_qdeclarativeimage.cpp ../shared/testhttpserver.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG+=insignificant_test # QTQAINFRA-428
