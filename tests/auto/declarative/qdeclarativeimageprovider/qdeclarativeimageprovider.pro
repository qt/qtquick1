CONFIG += testcase
TARGET = tst_qdeclarativeimageprovider

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private
QT += network
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeimageprovider.cpp

# QMAKE_CXXFLAGS = -fprofile-arcs -ftest-coverage
# LIBS += -lgcov

!symbian: {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}
