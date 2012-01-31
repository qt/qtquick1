TEMPLATE = subdirs
CONFIG += ordered

module_qtquick1_src.subdir = src
module_qtquick1_src.target = module-qtquick1-src

module_qtquick1_tools.subdir = tools
module_qtquick1_tools.target = module-qtquick1-tools
module_qtquick1_tools.depends = module_qtquick1_src

module_qtquick1_demos.subdir = demos
module_qtquick1_demos.target = module-qtquick1-demos
module_qtquick1_demos.depends = module_qtquick1_src

module_qtquick1_examples.subdir = examples
module_qtquick1_examples.target = module-qtquick1-examples
module_qtquick1_examples.depends = module_qtquick1_src
!contains(QT_BUILD_PARTS,examples) {
    module_qtquick1_examples.CONFIG = no_default_target no_default_install
}

SUBDIRS += module_qtquick1_src \
           module_qtquick1_tools \
           module_qtquick1_demos \
           module_qtquick1_examples \
