TEMPLATE = lib
CONFIG += plugin
SOURCES = plugin.cpp
QT = core quick1
DESTDIR = ../imports/com/nokia/AutoTestPluginWithQmlFile

symbian: {
    TARGET.EPOCALLOWDLLDATA=1
}
