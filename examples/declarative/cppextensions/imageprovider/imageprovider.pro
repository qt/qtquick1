TEMPLATE = lib
CONFIG += qt plugin
QT += declarative

DESTDIR = ImageProviderCore
TARGET  = qmlimageproviderplugin

SOURCES += imageprovider.cpp

OTHER_FILES += imageprovider.json

sources.files = $$SOURCES imageprovider.qml imageprovider.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/imageprovider

target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/imageprovider/ImageProviderCore

ImageProviderCore_sources.files = \
    ImageProviderCore/qmldir 
ImageProviderCore_sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/imageprovider/ImageProviderCore

INSTALLS = sources ImageProviderCore_sources target

