TEMPLATE = lib
CONFIG += plugin
SOURCES = plugin.cpp
QT = core quick1
DESTDIR = ../imports/com/nokia/AutoTestQmlPluginType.2

symbian: {
    TARGET.EPOCALLOWDLLDATA=1
}
