TEMPLATE = subdirs

SUBDIRS = qmldbg_inspector

!contains(QT_CONFIG, declarative): SUBDIRS +=  qmldbg_tcp
