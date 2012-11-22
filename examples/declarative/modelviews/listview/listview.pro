TEMPLATE = subdirs

SUBDIRS += \
    dynamiclist \
    expandingdelegates \
    highlight \
    highlightranges \
    sections

# install
sources.files = listview.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/modelviews/listview
INSTALLS += sources
