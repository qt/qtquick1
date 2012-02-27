load(qt_module)

TARGET     = QtQuick1
QPRO_PWD   = $$PWD

QT         += core core-private gui gui-private widgets widgets-private script script-private network
contains(QT_CONFIG, svg): QT += svg

CONFIG += module
MODULE_PRI = ../../modules/qt_quick1.pri

MODULE=quick1
load(qt_module_config)

DEFINES   += QT_BUILD_QUICK1_LIB QT_NO_URL_CAST_FROM_STRING

win32-msvc*|win32-icc:QMAKE_LFLAGS += /BASE:0x66000000
solaris-cc*:QMAKE_CXXFLAGS_RELEASE -= -O2

unix|win32-g++*:QMAKE_PKGCONFIG_REQUIRES = QtCore QtGui

exists("qdeclarative_enable_gcov") {
    QMAKE_CXXFLAGS = -fprofile-arcs -ftest-coverage -fno-elide-constructors
    LIBS += -lgcov
}

#modules
include(qml/qml.pri)
include(util/util.pri)
include(graphicsitems/graphicsitems.pri)
include(debugger/debugger.pri)

HEADERS += \
    qtquick1global.h \
    qtquick1global_p.h

linux-g++-maemo:DEFINES += QDECLARATIVEVIEW_NOBACKGROUND

DEFINES += QT_NO_OPENTYPE
INCLUDEPATH += ../3rdparty/harfbuzz/src

