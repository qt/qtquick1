HEADERS += $$PWD/qdeclarativedatatest.h
SOURCES += $$PWD/qdeclarativedatatest.cpp

INCLUDEPATH += $$PWD

DEFINES += QT_DECLARATIVETEST_DATADIR=\\\"$${_PRO_FILE_PWD_}/data\\\"
