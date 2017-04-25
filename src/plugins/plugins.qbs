import qbs

Project {
    name: "Plugins"

    references: [
        "beautifier/beautifier.qbs",
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
        "git/git.qbs",
        "help/help.qbs",
        "macros/macros.qbs",
        "projectexplorer/projectexplorer.qbs",
        "qbsprojectmanager/qbsprojectmanager.qbs",
        "qmljseditor/qmljseditor.qbs",
        "qmljstools/qmljstools.qbs",
        "qtsupport/qtsupport.qbs",
        "resourceeditor/resourceeditor.qbs",
        "texteditor/texteditor.qbs",
        "vcsbase/vcsbase.qbs",
        "welcome/welcome.qbs",
    ].concat(project.additionalPlugins)
}
