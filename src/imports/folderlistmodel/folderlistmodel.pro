TARGET  = qmlfolderlistmodelplugin
TARGETPATH = QtDeclarative/Qt/labs/folderlistmodel
include(../qimportbase.pri)

QT += widgets declarative script

SOURCES += qdeclarativefolderlistmodel.cpp plugin.cpp
HEADERS += qdeclarativefolderlistmodel.h

OTHER_FILES += folderlistmodel.json

DESTDIR = $$QT.declarative.imports/$$TARGETPATH
target.path = $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

qmldir.files += $$PWD/qmldir
qmldir.path +=  $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

INSTALLS += target qmldir
