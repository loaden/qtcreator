include(QtcLibrary)
include(QtcTool)

set(target Utils)
set(targetProcessStub qtcreator_process_stub)
set(targetCtrlcStub qtcreator_ctrlc_stub)

if(WINDOWS)
    set(${targetProcessStub}_srcs process_stub_win.c)
else()
    set(${targetProcessStub}_srcs process_stub_unix.c)
endif()
add_qtc_tool(${targetProcessStub} ${${targetProcessStub}_srcs})
if(WINDOWS)
    target_link_libraries(${targetProcessStub} shell32)
endif()

if(WINDOWS)
    add_qtc_tool(${targetCtrlcStub} process_ctrlc_stub.cpp)
    target_link_libraries(${targetCtrlcStub} user32 shell32)
endif()

add_definitions(-DQTCREATOR_UTILS_LIB)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(.. ${CMAKE_BINARY_DIR}/src)

if(WINDOWS)
    set(sources
        consoleprocess_win.cpp
        winutils.cpp
    )
elseif(UNIX)
    set(sources
        consoleprocess_unix.cpp
    )
endif()

if(UNIX AND NOT MACOSX)
    set(sources ${sources}
        unixutils.cpp
    )
endif()

set(sources ${sources}
    annotateditemdelegate.cpp
    appmainwindow.cpp
    basetreeview.cpp
    basevalidatinglineedit.cpp
    bracematcher.cpp
    buildablehelperlibrary.cpp
    changeset.cpp
    checkablemessagebox.cpp
    classnamevalidatinglineedit.cpp
    codegeneration.cpp
    completingtextedit.cpp
    consoleprocess.cpp
    crumblepath.cpp
    detailsbutton.cpp
    detailswidget.cpp
    elfreader.cpp
    environment.cpp
    environmentmodel.cpp
    faketooltip.cpp
    fancylineedit.cpp
    fancymainwindow.cpp
    fileinprojectfinder.cpp
    filenamevalidatinglineedit.cpp
    filesearch.cpp
    filesystemwatcher.cpp
    fileutils.cpp
    filewizarddialog.cpp
    filewizardpage.cpp
    filterlineedit.cpp
    flowlayout.cpp
    historycompleter.cpp
    htmldocextractor.cpp
    ipaddresslineedit.cpp
    iwelcomepage.cpp
    json.cpp
    linecolumnlabel.cpp
    navigationtreeview.cpp
    networkaccessmanager.cpp
    newclasswidget.cpp
    outputformatter.cpp
    parameteraction.cpp
    pathchooser.cpp
    pathlisteditor.cpp
    persistentsettings.cpp
    portlist.cpp
    projectintropage.cpp
    projectnamevalidatinglineedit.cpp
    proxyaction.cpp
    qtcassert.cpp
    qtcolorbutton.cpp
    qtcprocess.cpp
    reloadpromptutils.cpp
    savedaction.cpp
    savefile.cpp
    settingsselector.cpp
    statuslabel.cpp
    stringutils.cpp
    styledbar.cpp
    stylehelper.cpp
    submiteditorwidget.cpp
    submitfieldwidget.cpp
    synchronousprocess.cpp
    tcpportsgatherer.cpp
    textfileformat.cpp
    treewidgetcolumnstretcher.cpp
    uncommentselection.cpp
    wizard.cpp
)

set(mocsources
    crumblepath.cpp
    qtcolorbutton.cpp
    submiteditorwidget.cpp
    wizard.cpp
)

set(mocspecial
    completingtextedit.h
)

set(mocheaders
    appmainwindow.h
    basetreeview.h
    basevalidatinglineedit.h
    checkablemessagebox.h
    classnamevalidatinglineedit.h
    consoleprocess.h
    crumblepath.h
    detailsbutton.h
    detailswidget.h
    environmentmodel.h
    faketooltip.h
    fancylineedit.h
    fancymainwindow.h
    filenamevalidatinglineedit.h
    filesystemwatcher.h
    filewizarddialog.h
    filewizardpage.h
    filterlineedit.h
    historycompleter.h
    ipaddresslineedit.h
    iwelcomepage.h
    linecolumnlabel.h
    multitask.h
    navigationtreeview.h
    networkaccessmanager.h
    newclasswidget.h
    outputformatter.h
    parameteraction.h
    pathchooser.h
    pathlisteditor.h
    projectintropage.h
    projectnamevalidatinglineedit.h
    proxyaction.h
    qtcolorbutton.h
    qtcprocess.h
    savedaction.h
    settingsselector.h
    statuslabel.h
    styledbar.h
    submiteditorwidget.h
    submitfieldwidget.h
    synchronousprocess.h
    wizard.h
)

set(uifiles
    filewizardpage.ui
    projectintropage.ui
    newclasswidget.ui
    submiteditorwidget.ui
)

set(qrcfiles
    utils.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_generate_moc(qtincs ${mocsources})
qt_generate_moc_plus(qtincs moc_ .cpp ${mocspecial})
qt_wrap_ui(qtincs ${uifiles})

qtc_set_pch(${target} ../../shared/qtcreator_gui_pch.h)
qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

if(WINDOWS)
    target_link_libraries(${target} LINK_PRIVATE user32 iphlpapi ws2_32)
else()
    target_link_libraries(${target} LINK_PRIVATE X11)
endif()

qt_use_modules(${target} LINK_PRIVATE Widgets Network Script Concurrent)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_detect_moc_files("" h cpp)
