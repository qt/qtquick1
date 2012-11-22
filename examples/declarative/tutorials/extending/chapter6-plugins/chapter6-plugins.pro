TEMPLATE = lib
CONFIG += qt plugin
QT += declarative widgets

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

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/tutorials/extending/chapter6-plugins
sources.files = $$SOURCES $$HEADERS $$OTHER_FILES app.qml chapter6-plugins.pro
sources.path = $$[QT_INSTALL_EXAMPLES]//qtquick1/declarative/tutorials/extending/chapter6-plugins
INSTALLS += target sources
