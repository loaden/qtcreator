set(target ${PROJECT_NAME})

include_directories(
    ${CMAKE_BINARY_DIR}/src
    ${QTC_LIBS_SOURCE_DIR}
    ${QTC_SHARED_SOURCE_DIR}/qtlockedfile
    ${QTC_SHARED_SOURCE_DIR}/qtsingleapplication
)

if(WINDOWS)
    set(sources
        ${QTC_SHARED_SOURCE_DIR}/qtlockedfile/qtlockedfile_win.cpp
    )
    set(rcfiles
        qtcreator.rc
    )
else()
    set(sources
        ${QTC_SHARED_SOURCE_DIR}/qtlockedfile/qtlockedfile_unix.cpp
    )
endif()

set(sources ${sources}
    ${QTC_SHARED_SOURCE_DIR}/qtlockedfile/qtlockedfile.cpp
    ${QTC_SHARED_SOURCE_DIR}/qtsingleapplication/qtlocalpeer.cpp
    ${QTC_SHARED_SOURCE_DIR}/qtsingleapplication/qtsingleapplication.cpp
    main.cpp
)

set(mocheaders
    ${QTC_SHARED_SOURCE_DIR}/qtsingleapplication/qtlocalpeer.h
    ${QTC_SHARED_SOURCE_DIR}/qtsingleapplication/qtsingleapplication.h
)

qt_wrap_cpp(qtsrcs ${mocheaders})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_DIR}/qtcreator_gui_pch.h)
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
