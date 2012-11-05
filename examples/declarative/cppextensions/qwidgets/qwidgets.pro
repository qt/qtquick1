TEMPLATE = lib
CONFIG += qt plugin
QT += widgets declarative

DESTDIR = QWidgets
TARGET = qmlqwidgetsplugin

SOURCES += qwidgets.cpp

OTHER_FILES += qwidgets.json

sources.files += qwidgets.pro qwidgets.cpp qwidgets.qml
sources.path += $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/plugins
target.path += $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/plugins

INSTALLS += sources target

