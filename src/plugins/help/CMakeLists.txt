include(QtcPlugin)

set(target Help)

add_definitions(-DHELP_LIBRARY -DQT_CLUCENE_SUPPORT -DQT_NO_WEBKIT)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(
    ${CMAKE_BINARY_DIR}/src
    ../../shared/help
)

set(sources
    ../../shared/help/bookmarkmanager.cpp
    ../../shared/help/contentwindow.cpp
    ../../shared/help/filternamedialog.cpp
    ../../shared/help/indexwindow.cpp
    ../../shared/help/topicchooser.cpp
    centralwidget.cpp
    docsettingspage.cpp
    externalhelpwindow.cpp
    filtersettingspage.cpp
    generalsettingspage.cpp
    helpfindsupport.cpp
    helpindexfilter.cpp
    helpmode.cpp
    helpplugin.cpp
    helpviewer.cpp
    helpviewer_qtb.cpp
    helpviewer_qwv.cpp
    localhelpmanager.cpp
    openpagesmanager.cpp
    openpagesmodel.cpp
    openpagesswitcher.cpp
    openpageswidget.cpp
    remotehelpfilter.cpp
    searchwidget.cpp
    xbelsupport.cpp
)

set(mocheaders
    ../../shared/help/bookmarkmanager.h
    ../../shared/help/contentwindow.h
    ../../shared/help/filternamedialog.h
    ../../shared/help/indexwindow.h
    ../../shared/help/topicchooser.h
    centralwidget.h
    docsettingspage.h
    externalhelpwindow.h
    filtersettingspage.h
    generalsettingspage.h
    helpfindsupport.h
    helpindexfilter.h
    helpplugin.h
    helpviewer.h
    helpviewer_p.h
    localhelpmanager.h
    openpagesmanager.h
    openpagesmodel.h
    openpagesswitcher.h
    openpageswidget.h
    remotehelpfilter.h
    searchwidget.h
)

set(uifiles
    ../../shared/help/bookmarkdialog.ui
    ../../shared/help/filternamedialog.ui
    ../../shared/help/topicchooser.ui
    docsettingspage.ui
    filtersettingspage.ui
    generalsettingspage.ui
    remotehelpfilter.ui
)

set(qrcfiles
    help.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_wrap_ui(qtincs ${uifiles})

qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

target_link_libraries(${target} LINK_PRIVATE Core Find Locator)
qt_use_modules(${target} LINK_PRIVATE Widgets Concurrent Network Help PrintSupport)

#qt_detect_moc_files("../../shared/help" h cpp)
