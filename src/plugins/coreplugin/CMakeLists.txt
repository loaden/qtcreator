include(QtcPlugin)

set(target Core)

set(sources
    lib.cpp
)

qtc_add_plugin(${target}
    ${sources}
)

qt_find_modules(Core)
qt_use_modules(${target} Core)

if(QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${QTC_CORE_PCH_TARGET} "${sources}")
endif()
