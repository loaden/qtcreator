include(QtcPlugin)

set(target Core)

set(sources
    lib.cpp
)

qtc_set_pch(${target} CXX ../../shared/qtcreator_pch.h precompiled)
qtc_add_plugin(${target}
    ${sources}
    ${precompiled}
)

qt_use_modules(${target} Core)
qtc_use_pch(${target} ${sources})
