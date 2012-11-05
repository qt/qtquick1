QT += declarative

SOURCES += main.cpp \
           person.cpp \
           birthdayparty.cpp 
HEADERS += person.h \
           birthdayparty.h
RESOURCES += methods.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/referenceexamples/methods
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS methods.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/cppextensions/referenceexamples/methods
INSTALLS += target sources
