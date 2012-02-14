TEMPLATE = lib
CONFIG += plugin
SOURCES = plugin.cpp
QT = core quick1
DESTDIR = ../imports/com/nokia/AutoTestQmlPluginType

include(../qmldir_copier.pri)

symbian: {
    TARGET.EPOCALLOWDLLDATA=1
}
