set(QTC_PLUGIN_PATH lib/qtcreator/plugins/Nokia)

macro(qtc_add_plugin target)
    add_library(${target} SHARED ${ARGN})
    set_target_properties(${target} PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${QTC_PLUGIN_PATH}
        RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${QTC_PLUGIN_PATH}
        ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
    )
    if (MINGW)
        set_target_properties(${target} PROPERTIES
            PREFIX ""
            IMPORT_SUFFIX ".a"
        )
    endif()
    install(TARGETS ${target}
        LIBRARY DESTINATION ${QTC_PLUGIN_PATH}
        RUNTIME DESTINATION ${QTC_PLUGIN_PATH}
        ARCHIVE DESTINATION lib
    )
endmacro()
