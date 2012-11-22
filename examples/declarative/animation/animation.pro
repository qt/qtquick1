TEMPLATE = subdirs

SUBDIRS += \
    basics/property-animation \
    basics/color-animation \
    easing \
    behaviors/behavior-example \
    states

# install
sources.files = animation.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/animation
INSTALLS += sources
