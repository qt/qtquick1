TARGET  = qmlparticlesplugin
TARGETPATH = Qt/labs/particles
include(../qimportbase.pri)

QT += declarative declarative-private core-private gui-private widgets-private

SOURCES += \
    qdeclarativeparticles.cpp \
    particles.cpp

HEADERS += \
    qdeclarativeparticles_p.h

OTHER_FILES += particles.json

DESTDIR = $$QT.declarative.imports/$$TARGETPATH
target.path = $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

qmldir.files += $$PWD/qmldir
qmldir.path +=  $$[QT_INSTALL_IMPORTS]/$$TARGETPATH

INSTALLS += target qmldir
