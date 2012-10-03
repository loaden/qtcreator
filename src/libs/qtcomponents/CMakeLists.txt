add_subdirectory(styleitem)

file(COPY ${CMAKE_SOURCE_DIR}/lib/qtcreator/qtcomponents
    DESTINATION ${CMAKE_BINARY_DIR}/lib/qtcreator
    PATTERN "*.qbs" EXCLUDE
    PATTERN "*.pro" EXCLUDE
)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/lib/qtcreator/qtcomponents
    DESTINATION lib/qtcreator
    PATTERN "*.qbs" EXCLUDE
    PATTERN "*.pro" EXCLUDE
)
