TEMPLATE = app
CONFIG += uic declarative_debug declarative
DESTDIR = $$QT.declarative.bins

include(qml.pri)

SOURCES += main.cpp

DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

target.path = $$[QT_INSTALL_BINS]
INSTALLS += target

wince* {
    QT += xml

    contains(QT_CONFIG, scripttools) {
        QT += scripttools
    }
    contains(QT_CONFIG, phonon) {
        QT += phonon
    }
    contains(QT_CONFIG, xmlpatterns) {
        QT += xmlpatterns
    }
    contains(QT_CONFIG, webkitwidgets) {
        QT += webkitwidgets
    }
}

mac {
    QMAKE_INFO_PLIST=Info_mac.plist
    TARGET=QMLViewer
    ICON=qml.icns
} else {
    TARGET=qmlviewer
}
