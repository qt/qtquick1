TEMPLATE    = lib
TARGET      = qdeclarativeview
CONFIG     += qt warn_on plugin designer
QT         += declarative widgets designer

DESTDIR = $$QT.designer.plugins/designer
contains(TEMPLATE, ".*lib"):TARGET = $$qtLibraryTarget($$TARGET)
target.path = $$[QT_INSTALL_PLUGINS]/designer
INSTALLS += target

build_all:!build_pass {
    CONFIG -= build_all
    CONFIG += release
}

SOURCES += qdeclarativeview_plugin.cpp
HEADERS += qdeclarativeview_plugin.h
OTHER_FILES += qdeclarativeview.json
