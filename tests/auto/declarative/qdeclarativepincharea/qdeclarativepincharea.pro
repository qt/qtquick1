CONFIG += testcase
TARGET = tst_qdeclarativepincharea

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui-private widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativepincharea.cpp

symbian: {
    importFiles.sources = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
