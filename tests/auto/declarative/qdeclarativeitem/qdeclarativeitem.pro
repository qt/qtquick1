CONFIG += testcase
TARGET = tst_qdeclarativeitem

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui gui-private widgets-private core-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeitem.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG+=insignificant_test # QTQAINFRA-428
