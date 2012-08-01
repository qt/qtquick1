TEMPLATE = lib
CONFIG += plugin
SOURCES = plugin.cpp
QT = core quick1
DESTDIR = ../imports/com/nokia/AutoTestQmlPluginType.2.1

include(../qmldir_copier.pri)

symbian: {
    TARGET.EPOCALLOWDLLDATA=1
}
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
