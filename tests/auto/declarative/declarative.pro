TEMPLATE = subdirs
!symbian: {
SUBDIRS += \
           qdeclarativemetatype
}

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
           qpacketprotocol

    # This test requires the xmlpatterns module
    !contains(QT_CONFIG,xmlpatterns): SUBDIRS -= qdeclarativexmllistmodel
}

contains(QT_CONFIG, opengl): SUBDIRS += qmlshadersplugin

# Tests which should run in Pulse
PULSE_TESTS = $$SUBDIRS

# XXX: These tests are failing on some platform(s) - they need to be fixed after
# the module is added to Qt
examples.CONFIG += no_check_target
qmlshadersplugin.CONFIG += no_check_target
qdeclarativeanimatedimage.CONFIG += no_check_target
qdeclarativeapplication.CONFIG += no_check_target
qdeclarativeconnection.CONFIG += no_check_target
qdeclarativedebug.CONFIG += no_check_target
qdeclarativedebugclient.CONFIG += no_check_target
qdeclarativedebugservice.CONFIG += no_check_target
qdeclarativedebugjs.CONFIG += no_check_target
qdeclarativeecmascript.CONFIG += no_check_target
qdeclarativeflickable.CONFIG += no_check_target
qdeclarativefolderlistmodel.CONFIG += no_check_target
qdeclarativegridview.CONFIG += no_check_target
qdeclarativeimage.CONFIG += no_check_target
qdeclarativeitem.CONFIG += no_check_target
qdeclarativelanguage.CONFIG += no_check_target
qdeclarativelistmodel.CONFIG += no_check_target
qdeclarativelistview.CONFIG += no_check_target
qdeclarativeloader.CONFIG += no_check_target
qdeclarativeparticles.CONFIG += no_check_target
qdeclarativepathview.CONFIG += no_check_target
qdeclarativeqt.CONFIG += no_check_target
qdeclarativerepeater.CONFIG += no_check_target
qdeclarativevaluetypes.CONFIG += no_check_target
qdeclarativeviewer.CONFIG += no_check_target
qdeclarativeworkerscript.CONFIG += no_check_target
qdeclarativexmlhttprequest.CONFIG += no_check_target
qdeclarativexmllistmodel.CONFIG += no_check_target
qmlvisual.CONFIG += no_check_target
