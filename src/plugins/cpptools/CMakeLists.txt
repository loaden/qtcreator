include(QtcPlugin)

set(target CppTools)

add_definitions(-DCPPTOOLS_LIBRARY)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(
    ../../libs/3rdparty
    ../../libs/3rdparty/cplusplus
    ../../libs/cplusplus
)

set(sources
    abstracteditorsupport.cpp
    commentssettings.cpp
    completionsettingspage.cpp
    cppchecksymbols.cpp
    cppclassesfilter.cpp
    cppcodeformatter.cpp
    cppcodestylepreferences.cpp
    cppcodestylepreferencesfactory.cpp
    cppcodestylesettings.cpp
    cppcodestylesettingspage.cpp
    cppcompletionassist.cpp
    cppcompletionassistprovider.cpp
    cppcompletionsupport.cpp
    cppcurrentdocumentfilter.cpp
    cppdoxygen.cpp
    cppfilesettingspage.cpp
    cppfindreferences.cpp
    cppfunctionsfilter.cpp
    cpphighlightingsupport.cpp
    cpphighlightingsupportinternal.cpp
    cpplocalsymbols.cpp
    cpplocatorfilter.cpp
    cppmodelmanager.cpp
    cppqtstyleindenter.cpp
    cpprefactoringchanges.cpp
    cppsemanticinfo.cpp
    cpptoolseditorsupport.cpp
    cpptoolsplugin.cpp
    cpptoolsreuse.cpp
    cpptoolssettings.cpp
    doxygengenerator.cpp
    insertionpointlocator.cpp
    ModelManagerInterface.cpp
    searchsymbols.cpp
    symbolfinder.cpp
    symbolsfindfilter.cpp
    TypeHierarchyBuilder.cpp
    uicodecompletionsupport.cpp
)

set(mocspecial
    cppcodeformatter.h
)

set(mocheaders
    ModelManagerInterface.h
    completionsettingspage.h
    cppclassesfilter.h
    cppcodestylepreferences.h
    cppcodestylesettingspage.h
    cppcompletionassist.h
    cppcompletionassistprovider.h
    cppcurrentdocumentfilter.h
    cppfilesettingspage.h
    cppfindreferences.h
    cppfunctionsfilter.h
    cpplocatorfilter.h
    cppmodelmanager.h
    cpptoolseditorsupport.h
    cpptoolsplugin.h
    cpptoolssettings.h
    symbolsfindfilter.h
)

set(uifiles
    completionsettingspage.ui
    cppcodestylesettingspage.ui
    cppfilesettingspage.ui
)

qt_wrap_cpp(qtsrcs ${mocspecial})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_wrap_ui(qtincs ${uifiles})

qtc_set_pch(${target} ../../shared/qtcreator_gui_pch.h)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

target_link_libraries(${target} LINK_PUBLIC CPlusPlus LINK_PRIVATE TextEditor ProjectExplorer)
qt_use_modules(${target} LINK_PRIVATE Widgets Concurrent)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_detect_moc_files("" h cpp)
