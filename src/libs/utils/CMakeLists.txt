include(QtcLibrary)
include(QtcTool)

qt_find_modules(Widgets)

set(target Utils)
set(targetProcessStub qtcreator_process_stub)
set(targetCtrlcStub qtcreator_ctrlc_stub)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

add_definitions(-DQTCREATOR_UTILS_LIB)
include_directories(".." "${CMAKE_BINARY_DIR}")

if (WINDOWS)
    set(sources
        consoleprocess_win.cpp
        winutils.cpp
    )
elseif (UNIX)
    set(sources
        consoleprocess_unix.cpp
    )
endif()

if (UNIX AND NOT MACOSX)
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

set(uifiles
    filewizardpage.ui
    projectintropage.ui
    newclasswidget.ui
    submiteditorwidget.ui
)

set(qrcfiles
    utils.qrc
)

qt_wrap_ui(uisrcs ${uifiles})
qt_add_resources(qrcsrcs ${qrcfiles})

qtc_add_library(${target} SHARED
    ${sources}
    ${uisrcs}
    ${qrcsrcs}
)

qt_use_modules(${target} Widgets Network Script Concurrent)

if (WINDOWS)
    target_link_libraries(${target} user32 iphlpapi ws2_32)
else()
    target_link_libraries(${target} X11)
endif()

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${QTC_GUI_PCH_TARGET} "${sources}")
endif()

if (WINDOWS)
    set(${targetProcessStub}_srcs process_stub_win.c)
else()
    set(${targetProcessStub}_srcs process_stub_unix.c)
endif()
add_qtc_tool(${targetProcessStub} ${${targetProcessStub}_srcs})
if (WINDOWS)
    target_link_libraries(${targetProcessStub} shell32)
endif()

if (WINDOWS)
    add_qtc_tool(${targetCtrlcStub} process_ctrlc_stub.cpp)
    target_link_libraries(${targetCtrlcStub} user32 shell32)
endif()
