TEMPLATE = lib
CONFIG += plugin
SOURCES = plugin.cpp
QT = core quick1
DESTDIR = ../imports/com/nokia/AutoTestQmlPluginType.2

include(../qmldir_copier.pri)

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
