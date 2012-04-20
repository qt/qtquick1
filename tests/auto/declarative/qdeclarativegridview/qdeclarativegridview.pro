CONFIG += testcase
TARGET = tst_qdeclarativegridview

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private widgets widgets-private gui gui-private core-private script-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativegridview.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
