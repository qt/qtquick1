TARGET = qmldbg_tcp_qtdeclarative
QT       += declarative declarative-private network

PLUGIN_TYPE = qmltooling
PLUGIN_CLASS_NAME = QTcpServerConnection
load(qt_plugin)

SOURCES += \
    qtcpserverconnection.cpp

HEADERS += \
    qtcpserverconnection.h

OTHER_FILES += qtcpserverconnection.json
