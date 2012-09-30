include(QtcPlugin)

set(target Locator)

add_definitions(-DLOCATOR_LIBRARY)

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${QTC_LIBS_SOURCE_DIR}
    ${QTC_PLUGINS_SOURCE_DIR}
)

set(sources
    basefilefilter.cpp
    commandlocator.cpp
    directoryfilter.cpp
    executefilter.cpp
    filesystemfilter.cpp
    ilocatorfilter.cpp
    locatorfiltersfilter.cpp
    locatormanager.cpp
    locatorplugin.cpp
    locatorwidget.cpp
    opendocumentsfilter.cpp
    settingspage.cpp
)

set(mocheaders
    basefilefilter.h
    commandlocator.h
    directoryfilter.h
    executefilter.h
    filesystemfilter.h
    ilocatorfilter.h
    locatorfiltersfilter.h
    locatormanager.h
    locatorplugin.h
    locatorwidget.h
    opendocumentsfilter.h
    settingspage.h
)

set(uifiles
    directoryfilter.ui
    filesystemfilter.ui
    settingspage.ui
)

set(qrcfiles
    locator.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_wrap_ui(qtincs ${uifiles})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_DIR}/qtcreator_gui_pch.h)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

target_link_libraries(${target} Core)

qt_use_modules(${target} Widgets Concurrent)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_trace_moc_files(h cpp)
