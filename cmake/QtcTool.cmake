set(QTC_TOOL_PATH bin)

macro(add_qtc_tool target)
    add_executable(${target} ${ARGN})
    set_target_properties(${target} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${QTC_TOOL_PATH}
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    )
    install(TARGETS ${target}
        RUNTIME DESTINATION ${QTC_TOOL_PATH}
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
    )
endmacro()
