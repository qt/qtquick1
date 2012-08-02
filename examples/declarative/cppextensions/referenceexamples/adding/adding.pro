QT += quick1

SOURCES += main.cpp \
           person.cpp 
HEADERS += person.h
RESOURCES += adding.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/referenceexamples/adding
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS adding.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/referenceexamples/adding
INSTALLS += target sources
