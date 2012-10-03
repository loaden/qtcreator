set(target ${PROJECT_NAME})

include_directories(
    ${CMAKE_BINARY_DIR}/src
    ../libs
    ../shared/qtlockedfile
    ../shared/qtsingleapplication
)

if(WINDOWS)
    set(sources
        ../shared/qtlockedfile/qtlockedfile_win.cpp
    )
    set(rcfiles
        qtcreator.rc
    )
else()
    set(sources
        ../shared/qtlockedfile/qtlockedfile_unix.cpp
    )
endif()

set(sources ${sources}
    ../shared/qtlockedfile/qtlockedfile.cpp
    ../shared/qtsingleapplication/qtlocalpeer.cpp
    ../shared/qtsingleapplication/qtsingleapplication.cpp
    main.cpp
)

set(mocheaders
    ../shared/qtsingleapplication/qtlocalpeer.h
    ../shared/qtsingleapplication/qtsingleapplication.h
)

qt_wrap_cpp(qtsrcs ${mocheaders})

qtc_set_pch(${target} ../shared/qtcreator_gui_pch.h)
add_executable(${target}
    ${sources}
    ${qtsrcs}
    ${rcfiles}
    ${pchSrcVar}
)

set_target_properties(${target} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

install(TARGETS ${target}
    RUNTIME DESTINATION bin
)

target_link_libraries(${target} ExtensionSystem)
qt_use_modules(${target} LINK_PRIVATE Core Widgets Network)
qtc_use_pch(${target} ${sources} ${qtsrcs})

if(UNIX)
    file(COPY ${CMAKE_SOURCE_DIR}/bin/qtcreator.sh
        DESTINATION ${CMAKE_BINARY_DIR}/bin
    )
    install(FILES ${CMAKE_SOURCE_DIR}/bin/qtcreator.sh
        DESTINATION bin
    )
endif()

include(QtcDefs)

#qt_detect_moc_files("../shared/qtsingleapplication;../shared/qtlockedfile" h cpp)
