include(QtcLibrary)

find_package(Qt5Core)

set(target LanguageUtils)

set(sources
    fakemetaobject.cpp
    componentversion.cpp
)

add_definitions(-DQT_CREATOR -DLANGUAGEUTILS_BUILD_DIR)

add_qtc_library(${target} SHARED
    ${sources}
)

qt5_use_modules(${target} Core)

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${QTC_CORE_PCH_TARGET} "${sources}")
endif()
