include(QtcPlugin)

set(target Welcome)

add_definitions(-DWELCOME_LIBRARY -DIDE_LIBRARY_BASENAME="lib")

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

target_link_libraries(${target} LanguageUtils Utils Core ProjectExplorer)

qt_use_modules(${target} Widgets Network Quick1)

#qt_trace_moc_files(h cpp)
