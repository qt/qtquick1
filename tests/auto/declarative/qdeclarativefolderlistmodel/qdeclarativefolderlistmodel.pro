CONFIG += testcase
TARGET = tst_qdeclarativefolderlistmodel

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativefolderlistmodel.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
