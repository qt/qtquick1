QT += widgets declarative

HEADERS += piechart.h \
           pieslice.h 
SOURCES += piechart.cpp \
           pieslice.cpp \
           main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/tutorials/extending/chapter5-listproperties
sources.files = $$SOURCES $$HEADERS app.qml chapter5-listproperties.pro
sources.path = $$[QT_INSTALL_EXAMPLES]//qtquick1/declarative/tutorials/extending/chapter5-listproperties
INSTALLS += target sources
