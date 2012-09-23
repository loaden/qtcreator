include(QtcPlugin)

qt_find_modules(Core)

set(target Core)

set(sources
    lib.cpp
)

if(QTC_PCH_SUPPORT)
    set_precompiled_header(${target} CXX ../../shared/qtcreator_pch.h precompiled)
endif()

qtc_add_plugin(${target}
    ${sources}
    ${precompiled}
)

qt_use_modules(${target} Core)

if(QTC_PCH_SUPPORT)
    use_precompiled_header(${target} "${sources}")
endif()

