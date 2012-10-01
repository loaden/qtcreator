include(QtcPlugin)

set(target Welcome)

add_definitions(-DWELCOME_LIBRARY)

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${QTC_LIBS_SOURCE_DIR}
    ${QTC_PLUGINS_SOURCE_DIR}
)

set(sources
    welcomeplugin.cpp
)

set(mocsources
    welcomeplugin.cpp
)

set(mocheaders
    welcomeplugin.h
)

qt_wrap_cpp(qtsrcs ${mocheaders})
qt_generate_moc(qtincs ${mocsources})

qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

target_link_libraries(${target} LINK_PRIVATE Core ProjectExplorer)
qt_use_modules(${target} LINK_PRIVATE Widgets Network Quick1)

include(QtcDefs)

#qt_trace_moc_files(h cpp)
