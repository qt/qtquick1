load(qt_build_config)

TARGET     = QtQuick1
QT         = core-private gui-private widgets-private script-private

MODULE=quick1
MODULE_IMPORT_SUFFIX = /QtQuick1
load(qt_module_config)

# private dependencies
QT += xmlpatterns

DEFINES   += QT_NO_URL_CAST_FROM_STRING

win32-msvc*|win32-icc:QMAKE_LFLAGS += /BASE:0x66000000
solaris-cc*:QMAKE_CXXFLAGS_RELEASE -= -O2

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

