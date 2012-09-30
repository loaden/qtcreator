include(QtcPlugin)

set(target CppEditor)

add_definitions(-DCPPEDITOR_LIBRARY)

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${QTC_LIBS_SOURCE_PATH}
    ${QTC_LIBS_SOURCE_PATH}/3rdparty
    ${QTC_LIBS_SOURCE_PATH}/3rdparty/cplusplus
    ${QTC_LIBS_SOURCE_PATH}/cplusplus
    ${QTC_PLUGINS_SOURCE_PATH}
)

set(sources
    cppplugin.cpp
    cppeditor.cpp
    cpphighlighter.cpp
    cpphoverhandler.cpp
    cppfilewizard.cpp
    cppclasswizard.cpp
    cppquickfixes.cpp
    cppoutline.cpp
    cppinsertdecldef.cpp
    cpptypehierarchy.cpp
    cppelementevaluator.cpp
    cppautocompleter.cpp
    cppcompleteswitch.cpp
    cppsnippetprovider.cpp
    cppinsertqtpropertymembers.cpp
    cppquickfixassistant.cpp
    cppquickfix.cpp
    cppfunctiondecldeflink.cpp
)

set(mocsources
    cppeditor.cpp
)

set(mocheaders
    cppclasswizard.h
    cppeditor.h
    cppfilewizard.h
    cppfunctiondecldeflink.h
    cpphighlighter.h
    cpphoverhandler.h
    cppinsertqtpropertymembers.h
    cppoutline.h
    cppplugin.h
    cppquickfix.h
    cpptypehierarchy.h
)

set(qrcfiles
    cppeditor.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_generate_moc(qtincs ${mocsources})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_PATH}/qtcreator_gui_pch.h precompiled)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
    ${precompiled}
)

target_link_libraries(${target} Utils CPlusPlus Core TextEditor CppTools ProjectExplorer)

qt_use_modules(${target} Widgets Concurrent)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_trace_moc_files(h cpp)
