CONFIG += testcase
TARGET = tst_qdeclarativetextinput

QT += testlib
contains(QT_CONFIG,declarative): QT += declarative declarative-private gui gui-private widgets widgets-private core-private
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativetextinput.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0

CONFIG += insignificant_test # QTBUG-27364
