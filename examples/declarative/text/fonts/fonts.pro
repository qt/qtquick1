TEMPLATE = subdirs

SUBDIRS += \
    availableFonts \
    banner \
    fonts \
    hello

# install
sources.files = fonts.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/text/fonts
INSTALLS += sources
