TEMPLATE = lib
CONFIG += qt plugin
QT += widgets declarative

DESTDIR = com/nokia/TimeExample
TARGET  = qmlqtimeexampleplugin

SOURCES += plugin.cpp

target.path += $$[QT_INSTALL_EXAMPLES]/declarative/cppextensions/plugins/com/nokia/TimeExample

qdeclarativesources.files += \
    com/nokia/TimeExample/qmldir \
    com/nokia/TimeExample/center.png \
    com/nokia/TimeExample/clock.png \
    com/nokia/TimeExample/Clock.qml \
    com/nokia/TimeExample/hour.png \
    com/nokia/TimeExample/minute.png
qdeclarativesources.path += $$[QT_INSTALL_EXAMPLES]/declarative/cppextensions/plugins/com/nokia/TimeExample

qml.files += plugins.qml
qml.path += $$[QT_INSTALL_EXAMPLES]/declarative/cppextensions/plugins

INSTALLS += target qdeclarativesources qml

