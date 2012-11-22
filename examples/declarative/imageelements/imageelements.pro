TEMPLATE = subdirs

SUBDIRS += \
    borderimage \
    image \
    shadows

# install
sources.files = imageelements.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/imageelements
INSTALLS += sources
