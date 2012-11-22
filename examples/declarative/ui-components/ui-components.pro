TEMPLATE = subdirs

SUBDIRS += dialcontrol \
           flipable \
           main \
           progressbar \
           scrollbar \
           searchbox \
           slideswitch \
           spinner \
           tabwidget

# install
sources.files = ui-components.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/ui-components
INSTALLS += sources
