TEMPLATE      = subdirs
SUBDIRS       = gestures/experimental-gestures/experimentalgestures.pro \
                mousearea/mousearea-example/mouseareaexample.pro \
                pincharea

# install
sources.files = touchinteraction.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/touchinteraction
INSTALLS += sources
