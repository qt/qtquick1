TEMPLATE = app

QT += quick1 quick1-private gui widgets
CONFIG += quick1_debug

CONFIG += console
CONFIG -= app_bundle

DESTDIR = ./

INSTALLS =

SOURCES += main.cpp
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
