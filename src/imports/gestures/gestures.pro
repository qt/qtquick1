TARGET  = qmlgesturesplugin
TARGETPATH = QtQuick1/Qt/labs/gestures
include(../qimportbase.pri)

QT += quick1 quick1-private widgets widgets-private gui gui-private core-private script-private

SOURCES += qdeclarativegesturearea.cpp plugin.cpp
HEADERS += qdeclarativegesturearea_p.h

OTHER_FILES += gestures.json

DESTDIR = $$QT.quick1.imports/$$TARGETPATH
target.path = $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

qmldir.files += $$PWD/qmldir
qmldir.path +=  $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

symbian:{
    TARGET.UID3 = 0x2002131F
    
    isEmpty(DESTDIR):importFiles.files = qmlgesturesplugin$${QT_LIBINFIX}.dll qmldir
    else:importFiles.files = $$DESTDIR/qmlgesturesplugin$${QT_LIBINFIX}.dll qmldir
    importFiles.path = $$QT_IMPORTS_BASE_DIR/$$TARGETPATH

    DEPLOYMENT += importFiles
}

INSTALLS += target qmldir
