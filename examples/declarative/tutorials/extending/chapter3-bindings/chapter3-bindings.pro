QT += widgets declarative

HEADERS += piechart.h
SOURCES += piechart.cpp \
           main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/tutorials/extending/chapter3-bindings
sources.files = $$SOURCES $$HEADERS app.qml chapter3-bindings.pro
sources.path = $$[QT_INSTALL_EXAMPLES]//qtquick1/declarative/tutorials/extending/chapter3-bindings
INSTALLS += target sources
