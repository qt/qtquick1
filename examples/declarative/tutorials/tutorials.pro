TEMPLATE = subdirs

SUBDIRS += \
    extending

# install
sources.files = tutorials.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/tutorials
INSTALLS += sources
