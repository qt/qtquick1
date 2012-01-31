TEMPLATE = lib
CONFIG += plugin
SOURCES = plugin.cpp
QT = core quick1
TARGET = Plugin
DESTDIR = ../imports/com/nokia/WrongCase

symbian: {
    TARGET.EPOCALLOWDLLDATA=1
}
