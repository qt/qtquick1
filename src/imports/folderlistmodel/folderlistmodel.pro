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

symbian:{
    TARGET.UID3 = 0x20021320

    isEmpty(DESTDIR):importFiles.files = qmlfolderlistmodelplugin$${QT_LIBINFIX}.dll qmldir
    else:importFiles.files = $$DESTDIR/qmlfolderlistmodelplugin$${QT_LIBINFIX}.dll qmldir
    importFiles.path = $$QT_IMPORTS_BASE_DIR/$$TARGETPATH

    DEPLOYMENT += importFiles
}

INSTALLS += target qmldir
