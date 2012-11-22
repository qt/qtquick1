TEMPLATE = subdirs

SUBDIRS += \
    imageprovider \
    plugins \
    networkaccessmanagerfactory \
    qwidgets \
    qgraphicslayouts \
    referenceexamples

# install
sources.files = cppextensions.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions
INSTALLS += sources
