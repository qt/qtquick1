TEMPLATE = subdirs

SUBDIRS += \
    clocks \
    corkboards \
    dynamicscene \
    tic-tac-toe/tictactoe.pro \
    tvtennis

# install
sources.files = toys.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtquick1/declarative/toys
INSTALLS += sources
