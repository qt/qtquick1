QT.quick1.VERSION = 5.0.0
QT.quick1.MAJOR_VERSION = 5
QT.quick1.MINOR_VERSION = 0
QT.quick1.PATCH_VERSION = 0

QT.quick1.name = QtQuick1
QT.quick1.bins = $$QT_MODULE_BIN_BASE
QT.quick1.includes = $$QT_MODULE_INCLUDE_BASE $$QT_MODULE_INCLUDE_BASE/QtQuick1
QT.quick1.private_includes = $$QT_MODULE_INCLUDE_BASE/QtQuick1/$$QT.quick1.VERSION
QT.quick1.sources = $$QT_MODULE_BASE/src/declarative
QT.quick1.libs = $$QT_MODULE_LIB_BASE
QT.quick1.plugins = $$QT_MODULE_PLUGIN_BASE
QT.quick1.imports = $$QT_MODULE_IMPORT_BASE/QtQuick1
QT.quick1.depends = gui network script xmlpatterns
QT.quick1.DEFINES = QT_QTQUICK1_LIB

QT_CONFIG += quick1
