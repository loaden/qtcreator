include(QtcLibrary)

set(target LanguageUtils)

set(sources
    fakemetaobject.cpp
    componentversion.cpp
)

add_definitions(-DLANGUAGEUTILS_BUILD_DIR)

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_PATH}/qtcreator_pch.h)
qtc_add_library(${target} SHARED
    ${sources}
)

qt_use_modules(${target} Core)
qtc_use_pch(${target} ${sources})
