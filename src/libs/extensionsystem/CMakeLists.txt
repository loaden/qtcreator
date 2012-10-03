include(QtcLibrary)

set(target ExtensionSystem)

add_definitions(-DEXTENSIONSYSTEM_LIBRARY)
include_directories(.. ${CMAKE_CURRENT_BINARY_DIR})

set(sources
    pluginerrorview.cpp
    plugindetailsview.cpp
    invoker.cpp
    iplugin.cpp
    pluginmanager.cpp
    pluginspec.cpp
    pluginview.cpp
    optionsparser.cpp
    plugincollection.cpp
    pluginerroroverview.cpp
)

set(uifiles
    pluginview.ui
    pluginerrorview.ui
    plugindetailsview.ui
    pluginerroroverview.ui
)

set(qrcfiles
    pluginview.qrc
)

set(mocheaders
    iplugin.h
    plugindetailsview.h
    pluginerroroverview.h
    pluginerrorview.h
    pluginmanager.h
    pluginmanager_p.h
    pluginspec_p.h
    pluginview.h
)

set(mocsources
    pluginerroroverview.cpp
)

qt_generate_moc(qthdrs ${mocsources})
qt_wrap_ui(qthdrs ${uifiles})
qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})

qtc_set_pch(${target} ../../shared/qtcreator_gui_pch.h)
qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
    ${qthdrs}
)

target_link_libraries(${target} LINK_PUBLIC Aggregation)
qt_use_modules(${target} LINK_PRIVATE Widgets)
qtc_use_pch(${target} ${sources} ${qtsrcs})

# Should add this in the end to avoiding PCH generate bug
add_definitions(-DIDE_TEST_DIR="${CMAKE_SOURCE_DIR}")

#qt_detect_moc_files("" h cpp)
