include(QtcLibrary)

find_package(Qt5Widgets)

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

add_library(${target} SHARED
    ${sources}
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

qt5_use_modules(${target} Widgets)

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${QTC_GUI_PCH_TARGET} "${sources}")
endif()
