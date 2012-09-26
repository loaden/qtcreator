include(QtcLibrary)

qt_find_modules(Core)

set(target LanguageUtils)

set(sources
    fakemetaobject.cpp
    componentversion.cpp
)

add_definitions(-DLANGUAGEUTILS_BUILD_DIR)

if(QTC_PCH_SUPPORT)
    set_precompiled_header(${target} CXX ../../shared/qtcreator_pch.h precompiled)
endif()

qtc_add_library(${target} SHARED
    ${sources}
    ${precompiled}
)

qt_use_modules(${target} Core)

if(QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${sources})
endif()

