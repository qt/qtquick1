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
    "qtbase" => "refs/heads/master",
    "qtscript" => "refs/heads/master",
    "qtxmlpatterns" => "refs/heads/master",
    "qtdeclarative" => "refs/heads/master",
    "qtjsbackend" => "refs/heads/master",
    "qtactiveqt" => "refs/heads/master",
    "qttools" => "refs/heads/master",
# Temporarily disabled    "qtwebkit" => "refs/heads/master",
);
