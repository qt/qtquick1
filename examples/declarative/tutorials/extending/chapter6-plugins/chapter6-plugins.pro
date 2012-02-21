TEMPLATE = lib
CONFIG += qt plugin
QT += quick1 widgets

DESTDIR = lib
OBJECTS_DIR = tmp
MOC_DIR = tmp

HEADERS += piechart.h \
           pieslice.h \
           chartsplugin.h

SOURCES += piechart.cpp \
           pieslice.cpp \
           chartsplugin.cpp

OTHER_FILES += chartsplugin.json

maemo5: include($$QT_SOURCE_TREE/examples/maemo5pkgrules.pri)
