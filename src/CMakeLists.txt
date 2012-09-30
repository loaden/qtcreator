set(QTC_LIBS_SOURCE_DIR "${CMAKE_SOURCE_DIR}/src/libs"
    CACHE INTERNAL "Library sources path"
)
set(QTC_PLUGINS_SOURCE_DIR "${CMAKE_SOURCE_DIR}/src/plugins"
    CACHE INTERNAL "Plugin sources path"
)
set(QTC_SHARED_SOURCE_DIR "${CMAKE_SOURCE_DIR}/src/shared"
    CACHE INTERNAL "Shared sources path"
)
set(QTC_3RDPARTY_SOURCE_DIR "${CMAKE_SOURCE_DIR}/src/libs/3rdparty"
    CACHE INTERNAL "3rdparty sources path"
)

add_subdirectory(libs)
add_subdirectory(plugins)
