QT += widgets declarative

HEADERS += piechart.h \
           pieslice.h 
SOURCES += piechart.cpp \
           pieslice.cpp \
           main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/tutorials/extending/chapter4-customPropertyTypes
sources.files = $$SOURCES $$HEADERS app.qml chapter4-customPropertyTypes.pro
sources.path = $$[QT_INSTALL_EXAMPLES]//qtquick1/declarative/tutorials/extending/chapter4-customPropertyTypes
INSTALLS += target sources
