%modules = ( # path to module name map
    "QtDeclarative" => "$basedir/src/declarative",
);
# Module dependencies.
# Every module that is required to build this module should have one entry.
# Each of the module version specifiers can take one of the following values:
#   - A specific Git revision.
#   - any git symbolic ref resolvable from the module's repository (e.g. "refs/heads/master" to track master branch)
#
%dependencies = (
    "qtbase" => "refs/heads/stable",
    "qtscript" => "refs/heads/stable",
    "qtxmlpatterns" => "refs/heads/stable",
    "qtdeclarative" => "refs/heads/stable",
    "qtjsbackend" => "refs/heads/stable",
    "qtactiveqt" => "refs/heads/stable",
    "qttools" => "refs/heads/stable",
    "qtwebkit" => "refs/heads/stable",
);
