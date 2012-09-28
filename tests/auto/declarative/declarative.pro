TEMPLATE = subdirs

SUBDIRS += \
           examples \
           parserstress \
           qdeclarativecomponent \
           qdeclarativecontext \
           qdeclarativeengine \
           qdeclarativeerror \
           qdeclarativefolderlistmodel \
           qdeclarativeinfo \
           qdeclarativelayoutitem \
           qdeclarativelistreference \
           qdeclarativemetatype \
           qdeclarativemoduleplugin \
           qdeclarativeparticles \
           qdeclarativepixmapcache \
           qdeclarativeqt \
           qdeclarativeview \
           qdeclarativeviewer \
           qdeclarativexmlhttprequest \
           qmlvisual \
           moduleqt47

contains(QT_CONFIG, private_tests) {
    SUBDIRS += \
           qdeclarativeanchors \
           qdeclarativeanimatedimage \
           qdeclarativeanimations \
           qdeclarativeapplication \
           qdeclarativebehaviors \
           qdeclarativebinding \
           qdeclarativeborderimage \
           qdeclarativeconnection \
           qdeclarativedebug \
           qdeclarativedebugclient \
           qdeclarativedebugservice \
           qdeclarativedebugjs \
           qdeclarativedom \
           qdeclarativeecmascript \
           qdeclarativeflickable \
           qdeclarativeflipable \
           qdeclarativefocusscope \
           qdeclarativefontloader \
           qdeclarativegridview \
           qdeclarativeimage \
           qdeclarativeimageprovider \
           qdeclarativeinstruction \
           qdeclarativeitem \
           qdeclarativelanguage \
           qdeclarativelistmodel \
           qdeclarativelistview \
           qdeclarativeloader \
           qdeclarativemousearea \
           qdeclarativepathview \
           qdeclarativepincharea \
           qdeclarativepositioners \
           qdeclarativeproperty \
           qdeclarativepropertymap \
           qdeclarativerepeater \
           qdeclarativesmoothedanimation \
           qdeclarativespringanimation \
           qdeclarativestyledtext \
           qdeclarativestates \
           qdeclarativesystempalette \
           qdeclarativetext \
           qdeclarativetextedit \
           qdeclarativetextinput \
           qdeclarativetimer \
           qdeclarativevaluetypes \
           qdeclarativevisualdatamodel \
           qdeclarativeworkerscript \
           qdeclarativexmllistmodel \
           qpacketprotocol \
           qperformancetimer

    # This test requires the xmlpatterns module
    !contains(QT_CONFIG,xmlpatterns): SUBDIRS -= qdeclarativexmllistmodel
}

contains(QT_CONFIG, opengl): SUBDIRS += qmlshadersplugin

!isEmpty(QT.webkit.name): SUBDIRS += qdeclarativewebview

# Tests which should run in Pulse
PULSE_TESTS = $$SUBDIRS
