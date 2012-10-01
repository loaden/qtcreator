include(QtcPlugin)

set(target QtSupport)

add_definitions(
    -DQTSUPPORT_LIBRARY
    -DQT_CREATOR
    -DQMAKE_AS_LIBRARY
    -DQMAKE_LIBRARY
    -DPROPARSER_THREAD_SAFE
    -DPROEVALUATOR_THREAD_SAFE
    -DPROEVALUATOR_CUMULATIVE
)

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${QTC_LIBS_SOURCE_DIR}
    ${QTC_PLUGINS_SOURCE_DIR}
    ${QTC_SHARED_SOURCE_DIR}
)

set(sources
    ${QTC_SHARED_SOURCE_DIR}/proparser/qmakeglobals.cpp
    ${QTC_SHARED_SOURCE_DIR}/proparser/qmakeparser.cpp
    ${QTC_SHARED_SOURCE_DIR}/proparser/qmakeevaluator.cpp
    ${QTC_SHARED_SOURCE_DIR}/proparser/profileevaluator.cpp
    ${QTC_SHARED_SOURCE_DIR}/proparser/qmakebuiltins.cpp
    ${QTC_SHARED_SOURCE_DIR}/proparser/proitems.cpp
    ${QTC_SHARED_SOURCE_DIR}/proparser/prowriter.cpp
    ${QTC_SHARED_SOURCE_DIR}/proparser/ioutils.cpp
    qtsupportplugin.cpp
    qtkitconfigwidget.cpp
    qtkitinformation.cpp
    qtoutputformatter.cpp
    qtversionmanager.cpp
    qtversionfactory.cpp
    baseqtversion.cpp
    qmldumptool.cpp
    qmlobservertool.cpp
    qmldebugginglibrary.cpp
    qtoptionspage.cpp
    customexecutablerunconfiguration.cpp
    customexecutableconfigurationwidget.cpp
    debugginghelper.cpp
    debugginghelperbuildtask.cpp
    profilereader.cpp
    qtparser.cpp
    gettingstartedwelcomepage.cpp
    exampleslistmodel.cpp
    screenshotcropper.cpp
)

set(mocsources
    customexecutablerunconfiguration.cpp
    gettingstartedwelcomepage.cpp
)

set(mocspecial
    qmldumptool.cpp
)

set(mocheaders
    baseqtversion.h
    customexecutableconfigurationwidget.h
    customexecutablerunconfiguration.h
    debugginghelperbuildtask.h
    exampleslistmodel.h
    gettingstartedwelcomepage.h
    profilereader.h
    qtkitconfigwidget.h
    qtkitinformation.h
    qtoptionspage.h
    qtoutputformatter.h
    qtparser.h
    qtsupportplugin.h
    qtversionfactory.h
    qtversionmanager.h
)

set(uifiles
    showbuildlog.ui
    qtversioninfo.ui
    debugginghelper.ui
    qtversionmanager.ui
)

set(qrcfiles
    ${QTC_SHARED_SOURCE_DIR}/proparser/proparser.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_generate_moc(qtincs ${mocsources})
qt_generate_moc_plus(qtincs "" .moc ${mocspecial})
qt_wrap_ui(qtincs ${uifiles})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_DIR}/qtcreator_gui_pch.h)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

target_link_libraries(${target} QmlJS TextEditor ProjectExplorer)

qt_use_modules(${target} Widgets Concurrent Network Quick1)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_trace_moc_files(h cpp)
