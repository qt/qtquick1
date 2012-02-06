TARGET = qmldbg_inspector
QT       += quick1 quick1-private gui widgets core-private

load(qt_plugin)

DESTDIR  = $$QT.quick1.plugins/qmltooling

INCLUDEPATH *= $$PWD

SOURCES += \
    qtquick1plugin.cpp \
    abstractviewinspector.cpp \
    qdeclarativeviewinspector.cpp \
    editor/abstractliveedittool.cpp \
    editor/liveselectiontool.cpp \
    editor/livelayeritem.cpp \
    editor/livesingleselectionmanipulator.cpp \
    editor/liverubberbandselectionmanipulator.cpp \
    editor/liveselectionrectangle.cpp \
    editor/liveselectionindicator.cpp \
    editor/boundingrecthighlighter.cpp \
    editor/subcomponentmasklayeritem.cpp \
    editor/zoomtool.cpp \
    editor/colorpickertool.cpp \
    abstracttool.cpp

HEADERS += \
    qtquick1plugin.h \
    abstractviewinspector.h \
    qdeclarativeinspectorprotocol.h \
    qdeclarativeviewinspector.h \
    qdeclarativeviewinspector_p.h \
    qmlinspectorconstants.h \
    editor/abstractliveedittool.h \
    editor/liveselectiontool.h \
    editor/livelayeritem.h \
    editor/livesingleselectionmanipulator.h \
    editor/liverubberbandselectionmanipulator.h \
    editor/liveselectionrectangle.h \
    editor/liveselectionindicator.h \
    editor/boundingrecthighlighter.h \
    editor/subcomponentmasklayeritem.h \
    editor/zoomtool.h \
    editor/colorpickertool.h \
    abstracttool.h

target.path += $$[QT_INSTALL_PLUGINS]/qmltooling
INSTALLS += target

symbian:TARGET.UID3=0x20031E90
