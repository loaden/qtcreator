import qbs

Project {
    name: "QML designer projects"
    condition: project.fullBuilds
    references: [
        "qmldesignerplugin.qbs",
        "qtquickplugin/qtquickplugin.qbs",
        "componentsplugin/componentsplugin.qbs",
    ]
}
