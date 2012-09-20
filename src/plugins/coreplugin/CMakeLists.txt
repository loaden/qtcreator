include(QtcPlugin)

set(target Core)

set(sources
    lib.cpp
)

add_qtc_plugin(${target}
    ${sources}
)

find_package(Qt5Core)
qt5_use_modules(${target} Core)

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${QTC_CORE_PCH_TARGET} "${sources}")
endif()
