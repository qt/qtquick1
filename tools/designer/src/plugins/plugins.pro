TEMPLATE = subdirs
CONFIG += ordered

REQUIRES = !CONFIG(static,shared|static)
contains(QT_CONFIG, declarative): SUBDIRS += qdeclarativeview
