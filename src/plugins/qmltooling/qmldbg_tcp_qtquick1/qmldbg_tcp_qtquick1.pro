TARGET = qmldbg_tcp_qtdeclarative
QT       += declarative declarative-private network

load(qt_plugin)

DESTDIR  = $$QT.declarative.plugins/qmltooling

SOURCES += \
    qtcpserverconnection.cpp

HEADERS += \
    qtcpserverconnection.h

OTHER_FILES += qtcpserverconnection.json

target.path += $$[QT_INSTALL_PLUGINS]/qmltooling
INSTALLS += target
