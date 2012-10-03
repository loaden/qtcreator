include(QtcPlugin)

set(target Find)

add_definitions(-DFIND_LIBRARY)
include_directories(${CMAKE_CURRENT_BINARY_DIR})

set(sources
    basetextfind.cpp
    currentdocumentfind.cpp
    findplugin.cpp
    findtoolbar.cpp
    findtoolwindow.cpp
    ifindfilter.cpp
    ifindsupport.cpp
    searchresulttreeitemdelegate.cpp
    searchresulttreeitems.cpp
    searchresulttreemodel.cpp
    searchresulttreeview.cpp
    searchresultwidget.cpp
    searchresultwindow.cpp
    treeviewfind.cpp
)

set(mocsources
    ifindsupport.cpp
    searchresultwidget.cpp
    searchresultwindow.cpp
)

set(mocheaders
    basetextfind.h
    currentdocumentfind.h
    findplugin.h
    findtoolbar.h
    findtoolwindow.h
    ifindfilter.h
    ifindsupport.h
    searchresulttreemodel.h
    searchresulttreeview.h
    searchresultwidget.h
    searchresultwindow.h
    treeviewfind.h
)

set(uifiles
    finddialog.ui
    findwidget.ui
)

set(qrcfiles
    find.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_generate_moc(qtincs ${mocsources})
qt_wrap_ui(qtincs ${uifiles})

qtc_set_pch(${target} ../../shared/qtcreator_gui_pch.h)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

target_link_libraries(${target} LINK_PRIVATE Core)
qt_use_modules(${target} LINK_PRIVATE Widgets Concurrent)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_detect_moc_files("" h cpp)
