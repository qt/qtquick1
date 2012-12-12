TARGET = qml1plugindump

QT += core-private declarative-private widgets

CONFIG += qpa_minimal_plugin

SOURCES += \
    main.cpp \
    qmlstreamwriter.cpp

HEADERS += \
    qmlstreamwriter.h

OTHER_FILES += Info.plist
macx: QMAKE_INFO_PLIST = Info.plist

load(qt_tool)
