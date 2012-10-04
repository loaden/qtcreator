include(QtcPlugin)

set(target CMakeProjectManager)

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ../../libs/3rdparty/cplusplus
    ../../libs/cplusplus
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

qtc_set_pch(${target} ../../shared/qtcreator_gui_pch.h)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
)

target_link_libraries(${target} LINK_PRIVATE ProjectExplorer TextEditor CppTools)
qt_use_modules(${target} LINK_PRIVATE Widgets Concurrent Network)
qtc_use_pch(${target} ${sources} ${qtsrcs})

foreach(wizard plaincapp-cmake plaincppapp-cmake)
    file(COPY ${CMAKE_SOURCE_DIR}/share/qtcreator/templates/wizards/${wizard}
        DESTINATION ${CMAKE_BINARY_DIR}/share/qtcreator/templates/wizards
    )
    install(DIRECTORY ${CMAKE_SOURCE_DIR}/share/qtcreator/templates/wizards/${wizard}
        DESTINATION share/qtcreator/templates/wizards
    )
endforeach()

#qt_detect_moc_files("" h cpp)
