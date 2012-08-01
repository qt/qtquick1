TEMPLATE = lib
CONFIG += plugin
SOURCES = plugin.cpp
QT = core quick1
DESTDIR = ../imports/com/nokia/AutoTestQmlVersionPluginType

include(../qmldir_copier.pri)

symbian: {
    TARGET.EPOCALLOWDLLDATA=1
}
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
