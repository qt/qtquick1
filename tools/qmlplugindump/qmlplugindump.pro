DESTDIR = $$QT.quick1.bins
TARGET = qml1plugindump

QT += core-private quick1-private

SOURCES += \
    main.cpp \
    qmlstreamwriter.cpp

HEADERS += \
    qmlstreamwriter.h

OTHER_FILES += Info.plist
macx: QMAKE_INFO_PLIST = Info.plist

load(qt_tool)
