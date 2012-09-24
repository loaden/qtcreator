include(QtcLibrary)

qt_find_modules(Widgets)

set(target styleplugin)
set(QTC_STYLEPLUGIN_PATH lib/qtcreator/qtcomponents/plugin)

set(sources
    qdeclarativefolderlistmodel.cpp
    qrangemodel.cpp
    qstyleitem.cpp
    qstyleplugin.cpp
    qtmenu.cpp
    qtmenubar.cpp
    qtmenuitem.cpp
    qwheelarea.cpp
)

if(QTC_PCH_SUPPORT)
    set_precompiled_header(${target} CXX ../../../shared/qtcreator_gui_pch.h precompiled)
endif()

add_library(${target} SHARED
    ${sources}
    ${precompiled}
)

set_target_properties(${target} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${QTC_STYLEPLUGIN_PATH}
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${QTC_STYLEPLUGIN_PATH}
    ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
)

if (MINGW)
    set_target_properties(${target} PROPERTIES
        PREFIX ""
        IMPORT_SUFFIX ".a"
    )
endif()

install(TARGETS ${target}
    LIBRARY DESTINATION ${QTC_STYLEPLUGIN_PATH}
    RUNTIME DESTINATION ${QTC_STYLEPLUGIN_PATH}
    ARCHIVE DESTINATION lib
)

qt_use_modules(${target} Widgets Script Quick1)

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} "${sources}")
endif()
