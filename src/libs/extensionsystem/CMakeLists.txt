include(QtcLibrary)

qt_find_modules(Widgets)

set(target ExtensionSystem)

#add_definitions(-DEXTENSIONSYSTEM_LIBRARY -DIDE_TEST_DIR=\".\")
add_definitions(-DEXTENSIONSYSTEM_LIBRARY)
#include_directories(.. ../../shared)
include_directories(..)

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

qt_wrap_ui(qthdrs ${uifiles})
qt_add_resources(qtsrcs ${qrcfiles})

if(QTC_PCH_SUPPORT)
    set_precompiled_header(${target} CXX ../../shared/qtcreator_gui_pch.h precompiled)
endif()

qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
    ${qthdrs}
    ${precompiled}
)

qt_use_modules(${target} Widgets)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set_target_properties(${target} PROPERTIES
    AUTOMOC ON
)

target_link_libraries(${target} Aggregation)

if(QTC_PCH_SUPPORT)
    use_precompiled_header(${target} "${sources}")
endif()

