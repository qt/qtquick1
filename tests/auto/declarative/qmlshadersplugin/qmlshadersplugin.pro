CONFIG += testcase
TARGET = tst_qmlshadersplugin

QT += testlib
QT += opengl quick1 gui widgets
SOURCES += tst_qmlshadersplugin.cpp

SOURCES += \
    ../../../../src/imports/shaders/shadereffectitem.cpp \
    ../../../../src/imports/shaders/shadereffectsource.cpp \
    ../../../../src/imports/shaders/shadereffect.cpp \
    ../../../../src/imports/shaders/shadereffectbuffer.cpp \
    ../../../../src/imports/shaders/scenegraph/qsggeometry.cpp

HEADERS += \
    ../../../../src/imports/shaders/shadereffectitem.h \
    ../../../../src/imports/shaders/shadereffectsource.h \
    ../../../../src/imports/shaders/shadereffect.h \
    ../../../../src/imports/shaders/shadereffectbuffer.h \
    ../../../../src/imports/shaders/scenegraph/qsggeometry.h
