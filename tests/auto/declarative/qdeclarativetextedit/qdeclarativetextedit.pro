CONFIG += testcase
TARGET = tst_qdeclarativetextedit

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private gui gui-private widgets widgets-private network core-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativetextedit.cpp ../shared/testhttpserver.cpp
HEADERS += ../shared/testhttpserver.h

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
