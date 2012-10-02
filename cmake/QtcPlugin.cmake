set(QTC_PLUGIN_PATH lib/qtcreator/plugins/Nokia)

macro(qtc_add_plugin target)
    add_library(${target} SHARED ${ARGN} ${pchSrcVar})
    qtc_generate_pluginspec(${target})
    qtc_generate_json(${target})
    set_target_properties(${target} PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${QTC_PLUGIN_PATH}
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${QTC_PLUGIN_PATH}
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    )
    if(MINGW)
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

function(qtc_generate_pluginspec target)
    set(specInFile ${CMAKE_CURRENT_SOURCE_DIR}/${target}.pluginspec.in)
    set(specFile ${CMAKE_BINARY_DIR}/${QTC_PLUGIN_PATH}/${target}.pluginspec)
    if(${specInFile} IS_NEWER_THAN ${specFile})
        file(READ ${specInFile} specInContent)
        string(REPLACE $$QTCREATOR_VERSION ${QTCREATOR_VERSION} specInContent "${specInContent}")
        string(REPLACE "\\\"" "\"" specInContent "${specInContent}")
        file(WRITE ${specFile} "${specInContent}")
    endif()
    install(FILES ${specFile}
        DESTINATION ${QTC_PLUGIN_PATH}
    )
endfunction()

function(qtc_generate_json target)
    if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${target}.json)
       return()
    endif()
    set(specFile ${CMAKE_BINARY_DIR}/${QTC_PLUGIN_PATH}/${target}.pluginspec)
    set(jsonFile ${CMAKE_CURRENT_BINARY_DIR}/${target}.json)
    if(${specFile} IS_NEWER_THAN ${jsonFile})
        # FIXME: Read data from pluginspec file
        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/${target}.json "{}")
    endif()
endfunction()
