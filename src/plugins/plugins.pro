TEMPLATE = subdirs
SUBDIRS += qmltooling
contains(QT_CONFIG, designer):SUBDIRS += qdeclarativeview
