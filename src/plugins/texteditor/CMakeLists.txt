include(QtcPlugin)

set(target TextEditor)

add_definitions(-DTEXTEDITOR_LIBRARY)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(
    ${QTC_LIBS_SOURCE_DIR}
    ${QTC_PLUGINS_SOURCE_DIR}
    codeassist
    generichighlighter
    snippets
    tooltip
)

set(sources
    autocompleter.cpp
    basefilefind.cpp
    basehoverhandler.cpp
    basetextdocument.cpp
    basetextdocumentlayout.cpp
    basetexteditor.cpp
    basetextmark.cpp
    behaviorsettings.cpp
    behaviorsettingspage.cpp
    behaviorsettingswidget.cpp
    circularclipboardassist.cpp
    circularclipboard.cpp
    codeassist/basicproposalitem.cpp
    codeassist/basicproposalitemlistmodel.cpp
    codeassist/codeassistant.cpp
    codeassist/completionassistprovider.cpp
    codeassist/defaultassistinterface.cpp
    codeassist/functionhintproposal.cpp
    codeassist/functionhintproposalwidget.cpp
    codeassist/genericproposal.cpp
    codeassist/genericproposalwidget.cpp
    codeassist/iassistinterface.cpp
    codeassist/iassistprocessor.cpp
    codeassist/iassistproposal.cpp
    codeassist/iassistproposalitem.cpp
    codeassist/iassistproposalmodel.cpp
    codeassist/iassistproposalwidget.cpp
    codeassist/iassistprovider.cpp
    codeassist/ifunctionhintproposalmodel.cpp
    codeassist/igenericproposalmodel.cpp
    codeassist/quickfixassistprocessor.cpp
    codeassist/quickfixassistprovider.cpp
    codeassist/runner.cpp
    codecselector.cpp
    codestyleeditor.cpp
    codestylepool.cpp
    codestyleselectorwidget.cpp
    colorscheme.cpp
    colorschemeedit.cpp
    completionsettings.cpp
    convenience.cpp
    displaysettings.cpp
    displaysettingspage.cpp
    extraencodingsettings.cpp
    findincurrentfile.cpp
    findinfiles.cpp
    findinopenfiles.cpp
    fontsettings.cpp
    fontsettingspage.cpp
    generichighlighter/context.cpp
    generichighlighter/definitiondownloader.cpp
    generichighlighter/dynamicrule.cpp
    generichighlighter/highlightdefinition.cpp
    generichighlighter/highlightdefinitionhandler.cpp
    generichighlighter/highlightdefinitionmetadata.cpp
    generichighlighter/highlighter.cpp
    generichighlighter/highlightersettings.cpp
    generichighlighter/highlightersettingspage.cpp
    generichighlighter/includerulesinstruction.cpp
    generichighlighter/itemdata.cpp
    generichighlighter/keywordlist.cpp
    generichighlighter/managedefinitionsdialog.cpp
    generichighlighter/manager.cpp
    generichighlighter/progressdata.cpp
    generichighlighter/rule.cpp
    generichighlighter/specificrules.cpp
    helpitem.cpp
    icodestylepreferences.cpp
    icodestylepreferencesfactory.cpp
    indenter.cpp
    itexteditor.cpp
    itextmark.cpp
    linenumberfilter.cpp
    normalindenter.cpp
    outlinefactory.cpp
    plaintexteditor.cpp
    plaintexteditorfactory.cpp
    quickfix.cpp
    refactoringchanges.cpp
    refactoroverlay.cpp
    semantichighlighter.cpp
    simplecodestylepreferences.cpp
    simplecodestylepreferenceswidget.cpp
    snippets/isnippetprovider.cpp
    snippets/plaintextsnippetprovider.cpp
    snippets/snippetassistcollector.cpp
    snippets/snippet.cpp
    snippets/snippeteditor.cpp
    snippets/snippetscollection.cpp
    snippets/snippetssettings.cpp
    snippets/snippetssettingspage.cpp
    storagesettings.cpp
    syntaxhighlighter.cpp
    tabsettings.cpp
    tabsettingswidget.cpp
    texteditoractionhandler.cpp
    texteditorconstants.cpp
    texteditoroptionspage.cpp
    texteditoroverlay.cpp
    texteditorplugin.cpp
    texteditorsettings.cpp
    textfilewizard.cpp
    tooltip/tipcontents.cpp
    tooltip/tipfactory.cpp
    tooltip/tips.cpp
    tooltip/tooltip.cpp
    typingsettings.cpp
)

set(mocsources
    basetextdocumentlayout.cpp
    codeassist/codeassistant.cpp
    codeassist/genericproposalwidget.cpp
    codestyleselectorwidget.cpp
    generichighlighter/manager.cpp
    snippets/snippetssettingspage.cpp
)

set(mocspecial
    syntaxhighlighter.h
    texteditorsettings.h
    tooltip/tips.h
)

set(mocheaders
    basefilefind.h
    basefilefind_p.h
    basehoverhandler.h
    basetextdocument.h
    basetextdocumentlayout.h
    basetexteditor.h
    basetextmark.h
    behaviorsettingspage.h
    behaviorsettingswidget.h
    codeassist/completionassistprovider.h
    codeassist/functionhintproposalwidget.h
    codeassist/genericproposalwidget.h
    codeassist/iassistproposalwidget.h
    codeassist/iassistprovider.h
    codeassist/quickfixassistprovider.h
    codeassist/runner.h
    codecselector.h
    codestyleeditor.h
    codestylepool.h
    codestyleselectorwidget.h
    colorschemeedit.h
    displaysettingspage.h
    findincurrentfile.h
    findinfiles.h
    findinopenfiles.h
    fontsettingspage.h
    generichighlighter/definitiondownloader.h
    generichighlighter/highlighter.h
    generichighlighter/highlightersettingspage.h
    generichighlighter/managedefinitionsdialog.h
    generichighlighter/manager.h
    icodestylepreferences.h
    icodestylepreferencesfactory.h
    ioutlinewidget.h
    itexteditor.h
    itextmark.h
    linenumberfilter.h
    outlinefactory.h
    plaintexteditor.h
    plaintexteditorfactory.h
    quickfix.h
    refactoroverlay.h
    simplecodestylepreferences.h
    simplecodestylepreferenceswidget.h
    snippets/isnippetprovider.h
    snippets/snippeteditor.h
    snippets/snippetscollection.h
    snippets/snippetssettingspage.h
    tabsettingswidget.h
    texteditoractionhandler.h
    texteditoroptionspage.h
    texteditoroverlay.h
    texteditorplugin.h
    textfilewizard.h
    tooltip/tooltip.h
)

set(uifiles
    behaviorsettingspage.ui
    behaviorsettingswidget.ui
    codestyleselectorwidget.ui
    colorschemeedit.ui
    displaysettingspage.ui
    fontsettingspage.ui
    generichighlighter/highlightersettingspage.ui
    generichighlighter/managedefinitionsdialog.ui
    snippets/snippetssettingspage.ui
    tabsettingswidget.ui
)

set(qrcfiles
    texteditor.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_generate_moc(qtincs ${mocsources})
qt_generate_moc_plus(qtincs moc_ .cpp ${mocspecial})
qt_wrap_ui(qtincs ${uifiles})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_DIR}/qtcreator_gui_pch.h)
qtc_add_plugin(${target}
    ${sources}
    ${qtsrcs}
    ${qtincs}
)

target_link_libraries(${target} LINK_PUBLIC Core Find Locator)
qt_use_modules(${target} LINK_PRIVATE Widgets Concurrent PrintSupport Network Xml)
qtc_use_pch(${target} ${sources} ${qtsrcs})

file(COPY ${CMAKE_SOURCE_DIR}/share/qtcreator/styles
    DESTINATION ${CMAKE_BINARY_DIR}/share/qtcreator
)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/share/qtcreator/styles
    DESTINATION share/qtcreator
)

#qt_trace_moc_files(h cpp)
