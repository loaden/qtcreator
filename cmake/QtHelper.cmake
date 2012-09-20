macro(qt_find_modules)
    foreach(module ${ARGN})
        find_package(Qt5${module})
    endforeach()
endmacro()

macro(qt_use_modules target)
    qt5_use_modules(${target} ${ARGN})
endmacro()

macro(qt_wrap_ui target)
    qt5_wrap_ui(${target} ${ARGN})
endmacro()

macro(qt_add_resources target)
    qt5_add_resources(${target} ${ARGN})
endmacro()
