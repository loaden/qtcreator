set(QTC_LIBS_SOURCE_PATH "${CMAKE_SOURCE_DIR}/src/libs"
    CACHE INTERNAL "Library sources path"
)
set(QTC_PLUGINS_SOURCE_PATH "${CMAKE_SOURCE_DIR}/src/plugins"
    CACHE INTERNAL "Plugin sources path"
)

if (QTC_PCH_SUPPORT)
    set(QTC_CORE_PCH_TARGET ${CMAKE_PROJECT_NAME}_pch_helper
        CACHE INTERNAL "QtCore PCH Target for library"
    )
    set(coreTarget ${QTC_CORE_PCH_TARGET})
    set_precompiled_header(${coreTarget} CXX shared/qtcreator_pch.h precompiled)
    add_pch_library(${coreTarget} SHARED ${precompiled})
    find_package(Qt5Core)
    qt5_use_modules(${coreTarget} Core)
    add_precompiled_header(${coreTarget})
    set(QTC_GUI_PCH_TARGET ${CMAKE_PROJECT_NAME}_gui_pch_helper
        CACHE INTERNAL "QtWidgets PCH Target for library"
    )
    set(guiTarget ${QTC_GUI_PCH_TARGET})
    set_precompiled_header(${guiTarget} CXX shared/qtcreator_gui_pch.h precompiled)
    add_pch_library(${guiTarget} SHARED ${precompiled})
    find_package(Qt5Widgets)
    qt5_use_modules(${guiTarget} Widgets)
    add_precompiled_header(${guiTarget})
endif()

add_subdirectory(libs)
add_subdirectory(plugins)
