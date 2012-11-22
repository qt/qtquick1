TEMPLATE = subdirs

SUBDIRS += \
    fonts \
    textselection

# install
sources.files = text.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/text
INSTALLS += sources
