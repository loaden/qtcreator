include(QtcPlugin)

set(target CMakeProjectManager)

include_directories(
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus
    ${QTC_LIBS_SOURCE_DIR}
    ${QTC_LIBS_SOURCE_DIR}/cplusplus
    ${QTC_PLUGINS_SOURCE_DIR}
)

set(sources
    cmakebuildconfiguration.cpp
    cmakeeditor.cpp
    cmakeeditorfactory.cpp
    cmakehighlighter.cpp
    cmakelocatorfilter.cpp
    cmakeopenprojectwizard.cpp
    cmakeproject.cpp
    cmakeprojectmanager.cpp
    cmakeprojectnodes.cpp
    cmakeprojectplugin.cpp
    cmakerunconfiguration.cpp
    cmakeuicodemodelsupport.cpp
    makestep.cpp
)

set(mocheaders
    cmakebuildconfiguration.h
    cmakeeditor.h
    cmakeeditorfactory.h
    cmakehighlighter.h
    cmakelocatorfilter.h
    cmakeopenprojectwizard.h
    cmakeproject.h
    cmakeprojectmanager.h
    cmakeprojectnodes.h
    cmakeprojectplugin.h
    cmakerunconfiguration.h
    makestep.h
)

set(qrcfiles
    cmakeproject.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_DIR}/qtcreator_gui_pch.h)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
)

target_link_libraries(${target} LINK_PRIVATE ProjectExplorer QtSupport TextEditor CppTools)
qt_use_modules(${target} LINK_PRIVATE Widgets Concurrent Network)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_trace_moc_files(h cpp)
