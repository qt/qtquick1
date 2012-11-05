TEMPLATE = subdirs

# the helpers simply need a make install target, but require no compilation 
sources.files = \
    qmlapplicationviewer \
    deployment.pri
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/helper
INSTALLS += sources
