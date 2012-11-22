TEMPLATE = subdirs

SUBDIRS += \
    objectlistmodel \
    abstractitemmodel \
    gridview \
    listview \
    package \
    parallax \
    pathview \
    stringlistmodel \
    visualitemmodel

# install
sources.files = modelviews.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/modelviews
INSTALLS += sources
