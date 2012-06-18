QT += quick1

SOURCES += main.cpp \
           person.cpp \
           birthdayparty.cpp 
HEADERS += person.h \
           birthdayparty.h
RESOURCES += default.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/cppextensions/referenceexamples/default
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS default.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/cppextensions/referenceexamples/default
INSTALLS += target sources
