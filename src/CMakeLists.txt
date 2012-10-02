set(QTC_LIBS_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libs"
    CACHE INTERNAL "Library sources path"
)
set(QTC_PLUGINS_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/plugins"
    CACHE INTERNAL "Plugin sources path"
)
set(QTC_SHARED_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/shared"
    CACHE INTERNAL "Shared sources path"
)
set(QTC_3RDPARTY_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libs/3rdparty"
    CACHE INTERNAL "3rdparty sources path"
)

add_subdirectory(libs)
add_subdirectory(plugins)
add_subdirectory(app)
