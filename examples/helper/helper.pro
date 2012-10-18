TEMPLATE = subdirs

# the helpers simply need a make install target, but require no compilation 
sources.files = \
    qmlapplicationviewer \
    deployment.pri
sources.path = $$[QT_INSTALL_EXAMPLES]/qtdeclarative/helper
INSTALLS += sources
