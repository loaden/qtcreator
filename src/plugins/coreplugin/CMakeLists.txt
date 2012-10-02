include(QtcPlugin)

set(target Core)

add_definitions(-DCORE_LIBRARY)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(
    ${CMAKE_BINARY_DIR}/src
    ${QTC_LIBS_SOURCE_DIR}
    ${QTC_PLUGINS_SOURCE_DIR}
    ${QTC_SHARED_SOURCE_DIR}/scriptwrapper
    actionmanager
    dialogs
    editormanager
    progressmanager
    scriptmanager
)

if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4250 /wd4251 /wd4290")
endif()

if(WINDOWS)
    set(sources
        progressmanager/progressmanager_win.cpp
    )
elseif(UNIX)
    set(sources
        progressmanager/progressmanager_x11.cpp
    )
endif()

set(sources ${sources}
    actionmanager/actioncontainer.cpp
    actionmanager/actionmanager.cpp
    actionmanager/command.cpp
    actionmanager/commandbutton.cpp
    actionmanager/commandmappings.cpp
    actionmanager/commandsfile.cpp
    basefilewizard.cpp
    coreplugin.cpp
    designmode.cpp
    dialogs/externaltoolconfig.cpp
    dialogs/ioptionspage.cpp
    dialogs/iwizard.cpp
    dialogs/newdialog.cpp
    dialogs/openwithdialog.cpp
    dialogs/promptoverwritedialog.cpp
    dialogs/saveitemsdialog.cpp
    dialogs/settingsdialog.cpp
    dialogs/shortcutsettings.cpp
    documentmanager.cpp
    editmode.cpp
    editormanager/editormanager.cpp
    editormanager/editorview.cpp
    editormanager/ieditor.cpp
    editormanager/ieditorfactory.cpp
    editormanager/iexternaleditor.cpp
    editormanager/openeditorsmodel.cpp
    editormanager/openeditorsview.cpp
    editormanager/openeditorswindow.cpp
    editormanager/systemeditor.cpp
    editortoolbar.cpp
    externaltool.cpp
    fancyactionbar.cpp
    fancytabwidget.cpp
    featureprovider.cpp
    fileiconprovider.cpp
    fileutils.cpp
    findplaceholder.cpp
    generalsettings.cpp
    generatedfile.cpp
    helpmanager.cpp
    icontext.cpp
    icore.cpp
    id.cpp
    idocument.cpp
    imode.cpp
    inavigationwidgetfactory.cpp
    infobar.cpp
    iversioncontrol.cpp
    manhattanstyle.cpp
    messagemanager.cpp
    messageoutputwindow.cpp
    mimedatabase.cpp
    mimetypemagicdialog.cpp
    mimetypesettings.cpp
    minisplitter.cpp
    modemanager.cpp
    navigationsubwidget.cpp
    navigationwidget.cpp
    outputpane.cpp
    outputpanemanager.cpp
    outputwindow.cpp
    plugindialog.cpp
    progressmanager/futureprogress.cpp
    progressmanager/progressbar.cpp
    progressmanager/progressmanager.cpp
    progressmanager/progressview.cpp
    removefiledialog.cpp
    rightpane.cpp
    scriptmanager/scriptmanager.cpp
    settingsdatabase.cpp
    sidebar.cpp
    sidebarwidget.cpp
    statusbarmanager.cpp
    statusbarwidget.cpp
    styleanimator.cpp
    tabpositionindicator.cpp
    textdocument.cpp
    toolsettings.cpp
    variablechooser.cpp
    variablemanager.cpp
    vcsmanager.cpp
    versiondialog.cpp
    mainwindow.cpp
)

set(mocsources
    basefilewizard.cpp
    mimetypesettings.cpp
    progressmanager/futureprogress.cpp
)

set(mocheaders
    actionmanager/actioncontainer.h
    actionmanager/actioncontainer_p.h
    actionmanager/actionmanager.h
    actionmanager/actionmanager_p.h
    actionmanager/command.h
    actionmanager/command_p.h
    actionmanager/commandbutton.h
    actionmanager/commandmappings.h
    actionmanager/commandsfile.h
    basefilewizard.h
    coreplugin.h
    designmode.h
    dialogs/externaltoolconfig.h
    dialogs/ioptionspage.h
    dialogs/iwizard.h
    dialogs/newdialog.h
    dialogs/openwithdialog.h
    dialogs/promptoverwritedialog.h
    dialogs/saveitemsdialog.h
    dialogs/settingsdialog.h
    dialogs/shortcutsettings.h
    documentmanager.h
    editmode.h
    editormanager/editormanager.h
    editormanager/editorview.h
    editormanager/ieditor.h
    editormanager/ieditorfactory.h
    editormanager/iexternaleditor.h
    editormanager/openeditorsmodel.h
    editormanager/openeditorsview.h
    editormanager/openeditorswindow.h
    editormanager/systemeditor.h
    editortoolbar.h
    externaltool.h
    externaltoolmanager.h
    fancyactionbar.h
    fancytabwidget.h
    featureprovider.h
    findplaceholder.h
    generalsettings.h
    helpmanager.h
    icontext.h
    icore.h
    icorelistener.h
    idocument.h
    idocumentfactory.h
    ifilewizardextension.h
    imode.h
    inavigationwidgetfactory.h
    infobar.h
    ioutputpane.h
    iversioncontrol.h
    mainwindow.h
    manhattanstyle.h
    messagemanager.h
    messageoutputwindow.h
    mimetypemagicdialog.h
    mimetypesettings.h
    modemanager.h
    navigationsubwidget.h
    navigationwidget.h
    outputpane.h
    outputpanemanager.h
    outputwindow.h
    plugindialog.h
    progressmanager/futureprogress.h
    progressmanager/progressbar.h
    progressmanager/progressmanager.h
    progressmanager/progressmanager_p.h
    progressmanager/progressview.h
    removefiledialog.h
    rightpane.h
    scriptmanager/scriptmanager.h
    scriptmanager/scriptmanager_p.h
    sidebar.h
    sidebarwidget.h
    statusbarmanager.h
    statusbarwidget.h
    styleanimator.h
    tabpositionindicator.h
    textdocument.h
    toolsettings.h
    variablechooser.h
    variablemanager.h
    vcsmanager.h
    versiondialog.h
)

if(MACOSX)
    set(mocheaders ${mocheaders}
        macfullscreen.h
    )
endif()

set(uifiles
    actionmanager/commandmappings.ui
    dialogs/externaltoolconfig.ui
    dialogs/newdialog.ui
    dialogs/openwithdialog.ui
    dialogs/saveitemsdialog.ui
    editormanager/openeditorsview.ui
    generalsettings.ui
    mimetypemagicdialog.ui
    mimetypesettingspage.ui
    removefiledialog.ui
    variablechooser.ui
)

set(qrcfiles
    core.qrc
    fancyactionbar.qrc
)

qt_include_private_modules(Gui)
qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_generate_moc(qtincs ${mocsources})
qt_wrap_ui(qtincs ${uifiles})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_DIR}/qtcreator_gui_pch.h)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

if(WINDOWS)
    target_link_libraries(${target} LINK_PRIVATE user32 ole32)
elseif(MACOSX)
    target_link_libraries(${target} LINK_PRIVATE AppKit)
endif()

target_link_libraries(${target} LINK_PUBLIC Utils ExtensionSystem)
qt_use_modules(${target} LINK_PRIVATE Widgets Concurrent Script PrintSupport Sql Help)
qtc_use_pch(${target} ${sources} ${qtsrcs})

if(UNIX)
    foreach(size 16 24 32 48 64 128 256 512)
        install(FILES images/logo/${size}/qtcreator.png
            DESTINATION share/icons/hicolor/${size}x${size}/apps
        )
    endforeach()
endif()

#qt_trace_moc_files(h cpp)
