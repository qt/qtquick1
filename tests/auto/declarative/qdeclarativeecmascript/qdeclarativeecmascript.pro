CONFIG += testcase
TARGET = tst_qdeclarativeecmascript

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private script script-private network widgets core-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeecmascript.cpp \
           testtypes.cpp \
           ../shared/testhttpserver.cpp
HEADERS += testtypes.h \
           ../shared/testhttpserver.h
INCLUDEPATH += ../shared

# QMAKE_CXXFLAGS = -fprofile-arcs -ftest-coverage
# LIBS += -lgcov

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

