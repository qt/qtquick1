CONFIG += testcase
TARGET = tst_qmlvisual

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 gui widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qmlvisual.cpp

symbian: {
    importFiles.path = .
    importFiles.files = animation \
    fillmode \
    focusscope \
    ListView \
    qdeclarativeborderimage \
    qdeclarativeflickable \
    qdeclarativeflipable \
    qdeclarativegridview \
    qdeclarativemousearea \
    qdeclarativeparticles \
    qdeclarativepathview \
    qdeclarativepositioners \
    qdeclarativesmoothedanimation \
    qdeclarativespringanimation \
    qdeclarativetext \
    qdeclarativetextedit \
    qdeclarativetextinput \
    rect \
    repeater \
    selftest_noimages \
    webview
    DEPLOYMENT += importFiles
} else {
    DEFINES += QT_TEST_SOURCE_DIR=\"\\\"$$PWD\\\"\"
}

CONFIG += parallel_test

CONFIG+=insignificant_test # QTQAINFRA-428
