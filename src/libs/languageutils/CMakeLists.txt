include(QtcLibrary)

set(target LanguageUtils)

add_definitions(-DLANGUAGEUTILS_BUILD_DIR)

set(sources
    fakemetaobject.cpp
    componentversion.cpp
)

qtc_set_pch(${target} ../../shared/qtcreator_pch.h)
qtc_add_library(${target} SHARED
    ${sources}
)

qt_use_modules(${target} LINK_PRIVATE Core)
qtc_use_pch(${target} ${sources})
