TEMPLATE = subdirs

SUBDIRS += \
    chapter1-basics \
    chapter2-methods \
    chapter3-bindings \
    chapter4-customPropertyTypes \
    chapter5-listproperties \
    chapter6-plugins 

# install
sources.files = extending.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/tutorials/extending
INSTALLS += sources

