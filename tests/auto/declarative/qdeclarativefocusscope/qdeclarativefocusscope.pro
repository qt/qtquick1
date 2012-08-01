CONFIG += testcase
TARGET = tst_qdeclarativefocusscope

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private widgets
SOURCES += tst_qdeclarativefocusscope.cpp
macx:CONFIG -= app_bundle

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
