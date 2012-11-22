QT += widgets declarative

HEADERS += piechart.h
SOURCES += piechart.cpp \
           main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/tutorials/extending/chapter2-methods
sources.files = $$SOURCES $$HEADERS app.qml chapter2-methods.pro
sources.path = $$[QT_INSTALL_EXAMPLES]//qtquick1/declarative/tutorials/extending/chapter2-methods
INSTALLS += target sources
