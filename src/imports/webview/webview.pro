TARGET  = qmlwebkitplugin
TARGETPATH = QtQuick1/QtWebKit
include(../qimportbase.pri)

QT += quick1 quick1-private widgets widgets-private gui gui-private core-private script-private webkit

SOURCES += qdeclarativewebview.cpp plugin.cpp
HEADERS += qdeclarativewebview_p.h

OTHER_FILES += plugin.json

DESTDIR = $$QT.quick1.imports/$$TARGETPATH
target.path = $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

qmldir.files += $$PWD/qmldir
qmldir.path +=  $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

INSTALLS += target qmldir
