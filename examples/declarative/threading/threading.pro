TEMPLATE = subdirs

SUBDIRS = \
    threadedlistmodel \
    workerscript

# install
sources.files = threading.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/threading
INSTALLS += sources
