TEMPLATE = subdirs

SUBDIRS = qmldbg_inspector

!contains(QT_CONFIG, qml): SUBDIRS +=  qmldbg_tcp
