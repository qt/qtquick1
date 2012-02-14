TEMPLATE = lib
CONFIG += plugin
SOURCES = plugin.cpp
QT = core quick1
TARGET = Plugin
DESTDIR = ../imports/com/nokia/WrongCase

include(../qmldir_copier.pri)

symbian: {
    TARGET.EPOCALLOWDLLDATA=1
}
