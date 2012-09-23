set(QTC_LIBS_SOURCE_PATH "${CMAKE_SOURCE_DIR}/src/libs"
    CACHE INTERNAL "Library sources path"
)
set(QTC_PLUGINS_SOURCE_PATH "${CMAKE_SOURCE_DIR}/src/plugins"
    CACHE INTERNAL "Plugin sources path"
)

add_subdirectory(libs)
add_subdirectory(plugins)
