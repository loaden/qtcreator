set(target styleplugin)
set(QTC_STYLEPLUGIN_PATH lib/qtcreator/qtcomponents/plugin)

set(sources
    qdeclarativefolderlistmodel.cpp
    qrangemodel.cpp
    qstyleitem.cpp
    qstyleplugin.cpp
    qtmenu.cpp
    qtmenubar.cpp
    qtmenuitem.cpp
    qwheelarea.cpp
)

set(mocheaders
    qdeclarativefolderlistmodel.h
    qrangemodel.h
    qstyleitem.h
    qstyleplugin.h
    qtmenu.h
    qtmenubar.h
    qtmenuitem.h
    qwheelarea.h
)

qt_include_modules(Quick1)
qt_wrap_cpp(qtsrcs ${mocheaders})

qtc_set_pch(${target} ../../../shared/qtcreator_gui_pch.h)
add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
    ${pchSrcVar}
)

set_target_properties(${target} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${QTC_STYLEPLUGIN_PATH}
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${QTC_STYLEPLUGIN_PATH}
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
)

if (MINGW)
    set_target_properties(${target} PROPERTIES
        PREFIX ""
        IMPORT_SUFFIX ".a"
    )
endif()

install(TARGETS ${target}
    LIBRARY DESTINATION ${QTC_STYLEPLUGIN_PATH}
    RUNTIME DESTINATION ${QTC_STYLEPLUGIN_PATH}
    ARCHIVE DESTINATION lib
)

qt_use_modules(${target} LINK_PRIVATE Widgets Script Quick1)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_detect_moc_files("" h cpp)
