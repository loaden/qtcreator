include(QtcLibrary)

qt_find_modules(Core)

set(target Botan)

set(sources
    botan.cpp
)

if(QTC_PCH_SUPPORT)
    set_precompiled_header(${target} CXX ../precompiled_headers/botan_pch.h precompiled)
endif()

qtc_add_library(${target} SHARED
    ${sources}
    ${precompiled}
)

set(defines -DBOTAN_DLL=Q_DECL_EXPORT)

if(UNIX)
    set(defines ${defines}
        -DBOTAN_TARGET_OS_HAS_GETTIMEOFDAY
        -DBOTAN_HAS_ALLOC_MMAP
        -DBOTAN_HAS_ENTROPY_SRC_DEV_RANDOM
        -DBOTAN_HAS_ENTROPY_SRC_EGD
        -DBOTAN_HAS_ENTROPY_SRC_FTW
        -DBOTAN_HAS_ENTROPY_SRC_UNIX
        -DBOTAN_HAS_MUTEX_PTHREAD
        -DBOTAN_HAS_PIPE_UNIXFD_IO
    )
endif()

if(LINUX)
    set(defines ${defines}
        -DBOTAN_TARGET_OS_IS_LINUX
        -DBOTAN_TARGET_OS_HAS_CLOCK_GETTIME
        -DBOTAN_TARGET_OS_HAS_DLOPEN
        -DBOTAN_TARGET_OS_HAS_GMTIME_R
        -DBOTAN_TARGET_OS_HAS_POSIX_MLOCK
        -DBOTAN_HAS_DYNAMICALLY_LOADED_ENGINE
        -DBOTAN_HAS_DYNAMIC_LOADER
    )
elseif(MACOSX)
    set(defines ${defines} -DBOTAN_TARGET_OS_IS_DARWIN)
elseif(WINDOWS)
    set(defines ${defines}
        -DBOTAN_TARGET_OS_IS_WINDOWS
        -DBOTAN_TARGET_OS_HAS_LOADLIBRARY
        -DBOTAN_TARGET_OS_HAS_WIN32_GET_SYSTEMTIME
        -DBOTAN_TARGET_OS_HAS_WIN32_VIRTUAL_LOCK
        -DBOTAN_HAS_DYNAMICALLY_LOADED_ENGINE
        -DBOTAN_HAS_DYNAMIC_LOADER
        -DBOTAN_HAS_ENTROPY_SRC_CAPI
        -DBOTAN_HAS_ENTROPY_SRC_WIN32
        -DBOTAN_HAS_MUTEX_WIN32
    )
endif()

if(MSVC)
    set(defines ${defines}
        -DBOTAN_BUILD_COMPILER_IS_MSVC
        -DBOTAN_TARGET_OS_HAS_GMTIME_S
    )
elseif(CMAKE_COMPILER_IS_GNUCXX OR MINGW)
    set(defines ${defines} -DBOTAN_BUILD_COMPILER_IS_GCC)
endif()

add_definitions(${defines})

if(CMAKE_COMPILER_IS_GNUCXX OR MINGW)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive -finline-functions -Wno-long-long")
endif()

if(WINDOWS)
    target_link_libraries(${target} advapi32 user32)
    if(MSVC)
        string(REGEX REPLACE " /EHsc" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4267 /wd4996 /wd4530")
    elseif(MINGW)
        set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--enable-auto-import")
    endif()
else()
    target_link_libraries(${target} rt dl)
endif()

qt_use_modules(${target} Core)

if(QTC_PCH_SUPPORT)
    use_precompiled_header(${target} "${sources}")
endif()

