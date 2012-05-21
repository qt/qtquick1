CONFIG += testcase
TARGET = tst_qdeclarativeviewer

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 gui
macx:CONFIG -= app_bundle

include(../../../../tools/qml/qml.pri)

SOURCES += tst_qdeclarativeviewer.cpp

include(../symbianlibs.pri)

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG+=insignificant_test # QTQAINFRA-428
