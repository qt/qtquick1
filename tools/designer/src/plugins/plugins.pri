CONFIG += designer
win32|mac: CONFIG+= debug_and_release
DESTDIR = $$QT.designer.plugins
contains(TEMPLATE, ".*lib"):TARGET = $$qtLibraryTarget($$TARGET)

# install
target.path = $$[QT_INSTALL_PLUGINS]/designer
INSTALLS += target
