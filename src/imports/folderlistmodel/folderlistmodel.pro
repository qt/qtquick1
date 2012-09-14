TARGET  = qmlfolderlistmodelplugin
TARGETPATH = QtQuick1/Qt/labs/folderlistmodel
include(../qimportbase.pri)

QT += widgets quick1 script

SOURCES += qdeclarativefolderlistmodel.cpp plugin.cpp
HEADERS += qdeclarativefolderlistmodel.h

OTHER_FILES += folderlistmodel.json

DESTDIR = $$QT.quick1.imports/$$TARGETPATH
target.path = $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

qmldir.files += $$PWD/qmldir
qmldir.path +=  $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

INSTALLS += target qmldir
