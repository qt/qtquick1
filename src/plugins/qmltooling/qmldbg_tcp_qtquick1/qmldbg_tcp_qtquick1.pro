TARGET = qmldbg_tcp_qtquick1
QT       += quick1 quick1-private network

load(qt_plugin)

DESTDIR  = $$QT.quick1.plugins/qmltooling

SOURCES += \
    qtcpserverconnection.cpp

HEADERS += \
    qtcpserverconnection.h

OTHER_FILES += qtcpserverconnection.json

target.path += $$[QT_INSTALL_PLUGINS]/qmltooling
INSTALLS += target

symbian:TARGET.UID3=0x20031E90
