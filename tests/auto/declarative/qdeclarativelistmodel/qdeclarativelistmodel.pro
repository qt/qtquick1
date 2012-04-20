CONFIG += testcase
TARGET = tst_qdeclarativelistmodel

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script-private core-private gui-private widgets-private
QT += script
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativelistmodel.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
