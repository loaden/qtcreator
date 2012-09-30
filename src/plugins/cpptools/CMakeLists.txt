include(QtcPlugin)

set(target CppTools)

add_definitions(-DCPPTOOLS_LIBRARY)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(
    ${QTC_LIBS_SOURCE_PATH}
    ${QTC_LIBS_SOURCE_PATH}/3rdparty
    ${QTC_LIBS_SOURCE_PATH}/3rdparty/cplusplus
    ${QTC_LIBS_SOURCE_PATH}/cplusplus
    ${QTC_PLUGINS_SOURCE_PATH}
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

qtc_set_pch(${target} CXX ../../shared/qtcreator_gui_pch.h precompiled)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
    ${precompiled}
)

target_link_libraries(${target} LanguageUtils CPlusPlus Core Find Locator TextEditor ProjectExplorer)

qt_use_modules(${target} Widgets Concurrent)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_trace_moc_files(h cpp)
