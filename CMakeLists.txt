cmake_minimum_required(VERSION 2.8.9 FATAL_ERROR)

project(qtcreator)

set(QTCREATOR_VERSION 2.5.82)
string(SUBSTRING ${QTCREATOR_VERSION} 0 1 QTCREATOR_VERSION_MAJOR)
string(SUBSTRING ${QTCREATOR_VERSION} 2 1 QTCREATOR_VERSION_MINOR)
string(SUBSTRING ${QTCREATOR_VERSION} 4 2 QTCREATOR_VERSION_RELEASE)
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/src/app/app_version.h.cmakein
    ${CMAKE_CURRENT_BINARY_DIR}/app/app_version.h
)

# Add path for custom modules
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# Disable color output during build
set(CMAKE_COLOR_MAKEFILE OFF)

# Configuration
include(QtcConfig)

# Debug Helper
include(QtcDebug)

# PCH Support
include(QtcPCHHelper)

# Qt Helper
include(QtHelper)

if(WINDOWS)
    add_definitions(-DUNICODE)
    if(MSVC)
        # Don't warn about sprintf, fopen etc being 'unsafe'
        add_definitions(-D_CRT_SECURE_NO_WARNINGS)
    endif()
endif()

#add_definitions(-DQT_NO_CAST_FROM_ASCII)
add_definitions(-DQT_NO_CAST_TO_ASCII -DQT_DISABLE_DEPRECATED_BEFORE=0x040900)
if(NOT MACOSX)
    add_definitions(-DQT_USE_FAST_OPERATOR_PLUS -DQT_USE_FAST_CONCATENATION)
endif()

add_subdirectory(src)
