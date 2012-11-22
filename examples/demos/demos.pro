TEMPLATE = subdirs

# These demos contain C++ and need to be compiled
SUBDIRS = \
   calculator \
   flickr \
   photoviewer \
   minehunt \
   samegame \
   snake \
   rssnews \
   twitter

# install
sources.files = demos.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/demos
INSTALLS += sources
