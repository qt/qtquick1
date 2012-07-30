CONFIG += testcase
TARGET = tst_qdeclarativeparticles

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeparticles.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

CONFIG+=insignificant_test # QTBUG-26707
