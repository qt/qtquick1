CONFIG += testcase
testcase.timeout = 400 # this test is slow
TARGET = tst_examples

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1
macx:CONFIG -= app_bundle

SOURCES += tst_examples.cpp 

include(../../../../tools/qml/qml.pri)

include(../symbianlibs.pri)

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
