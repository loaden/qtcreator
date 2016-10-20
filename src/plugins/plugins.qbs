import qbs

Project {
    name: "Plugins"

    references: [
        "autotest/autotest.qbs",
        "bineditor/bineditor.qbs",
        "bookmarks/bookmarks.qbs",
        "clangcodemodel/clangcodemodel.qbs",
        "classview/classview.qbs",
        "cmakeprojectmanager/cmakeprojectmanager.qbs",
        "coreplugin/coreplugin.qbs",
        "coreplugin/images/logo/logo.qbs",
        "cppeditor/cppeditor.qbs",
        "cpptools/cpptools.qbs",
        "debugger/debugger.qbs",
        "debugger/ptracepreload.qbs",
        "diffeditor/diffeditor.qbs",
        "genericprojectmanager/genericprojectmanager.qbs",
        "git/git.qbs",
        "help/help.qbs",
        "imageviewer/imageviewer.qbs",
        "macros/macros.qbs",
        "projectexplorer/projectexplorer.qbs",
        "qbsprojectmanager/qbsprojectmanager.qbs",
        "qmldesigner/qmldesigner.qbs",
        "qmljseditor/qmljseditor.qbs",
        "qmljstools/qmljstools.qbs",
        "qmlprofiler/qmlprofiler.qbs",
        "qmlprojectmanager/qmlprojectmanager.qbs",
        "qmakeprojectmanager/qmakeprojectmanager.qbs",
        "qtsupport/qtsupport.qbs",
        "resourceeditor/resourceeditor.qbs",
        "tasklist/tasklist.qbs",
        "texteditor/texteditor.qbs",
        "todo/todo.qbs",
        "vcsbase/vcsbase.qbs",
        "welcome/welcome.qbs",
    ].concat(project.additionalPlugins)
}
