%modules = ( # path to module name map
    "QtQuick1" => "$basedir/src/declarative",
);
%classnames = (
    "qtquick1version.h" => "QtQuick1Version",
);
%mastercontent = (
    "gui" => "#include <QtGui/QtGui>\n",
    "widgets" => "#include <QtWidgets/QtWidgets>\n",
    "script" => "#include <QtScript/QtScript>\n",
    "network" => "#include <QtNetwork/QtNetwork>\n",
    "testlib" => "#include <QtTest/QtTest>\n",
);
%modulepris = (
    "QtQuick1" => "$basedir/modules/qt_quick1.pri",
);
# Module dependencies.
# Every module that is required to build this module should have one entry.
# Each of the module version specifiers can take one of the following values:
#   - A specific Git revision.
#   - any git symbolic ref resolvable from the module's repository (e.g. "refs/heads/master" to track master branch)
#
%dependencies = (
    "qtbase" => "refs/heads/master",
    "qtscript" => "refs/heads/master",
    "qtxmlpatterns" => "refs/heads/master",
);
