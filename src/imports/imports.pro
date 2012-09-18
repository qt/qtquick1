TEMPLATE = subdirs

SUBDIRS += folderlistmodel particles gestures builtins.pro
contains(QT_CONFIG, opengl):!contains(QT_CONFIG, opengles1): SUBDIRS += shaders

!isEmpty(QT.webkitwidgets.name): SUBDIRS += webview
