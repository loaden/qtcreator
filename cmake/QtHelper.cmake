macro(qt_find_modules)
    foreach(module ${ARGN})
        find_package(Qt5${module})
    endforeach()
endmacro()

macro(qt_use_modules target)
    qt5_use_modules(${target} ${ARGN})
endmacro()

macro(qt_wrap_cpp outfiles)
    qt5_wrap_cpp(${outfiles} ${ARGN})
endmacro()

macro(qt_wrap_ui outfiles)
    qt5_wrap_ui(${outfiles} ${ARGN})
endmacro()

macro(qt_add_resources outfiles)
    qt5_add_resources(${outfiles} ${ARGN})
endmacro()
