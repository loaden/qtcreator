include(QtcLibrary)

qt_find_modules(Core)

set(target LanguageUtils)

set(sources
    fakemetaobject.cpp
    componentversion.cpp
)

add_definitions(-DLANGUAGEUTILS_BUILD_DIR)

qtc_set_pch(${target} CXX ../../shared/qtcreator_pch.h precompiled)
qtc_add_library(${target} SHARED
    ${sources}
    ${precompiled}
)

qt_use_modules(${target} Core)
qtc_use_pch(${target} ${sources})
