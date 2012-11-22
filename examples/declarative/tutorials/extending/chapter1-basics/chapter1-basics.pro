QT += widgets declarative

HEADERS += piechart.h
SOURCES += piechart.cpp \
           main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/tutorials/extending/chapter1-basics
sources.files = $$SOURCES $$HEADERS app.qml chapter1-basics.pro
sources.path = $$[QT_INSTALL_EXAMPLES]//qtquick1/declarative/tutorials/extending/chapter1-basics
INSTALLS += target sources
