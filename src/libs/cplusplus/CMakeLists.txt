include(QtcLibrary)

set(target CPlusPlus)

add_definitions(-DCPLUSPLUS_BUILD_LIB)
include_directories(${CMAKE_CURRENT_SOURCE_DIR} ${QTC_LIBS_SOURCE_DIR}/3rdparty/cplusplus)

set(sources
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/ASTClone.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/AST.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/ASTMatch0.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/ASTMatcher.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/ASTPatternBuilder.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/ASTVisit.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/ASTVisitor.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Bind.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Control.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/CoreTypes.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/DiagnosticClient.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/FullySpecifiedType.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Keywords.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Lexer.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Literals.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/LiteralTable.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/MemoryPool.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Name.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Names.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/NameVisitor.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/ObjectiveCAtKeywords.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/ObjectiveCTypeQualifiers.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Parser.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/QtContextKeywords.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Scope.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Symbol.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Symbols.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/SymbolVisitor.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Templates.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Token.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/TranslationUnit.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/Type.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/TypeMatcher.cpp
    ${QTC_3RDPARTY_SOURCE_DIR}/cplusplus/TypeVisitor.cpp
    ASTParent.cpp
    ASTPath.cpp
    BackwardsScanner.cpp
    CppDocument.cpp
    CppRewriter.cpp
    DependencyTable.cpp
    DeprecatedGenTemplateInstance.cpp
    Dumpers.cpp
    ExpressionUnderCursor.cpp
    FastPreprocessor.cpp
    findcdbbreakpoint.cpp
    FindUsages.cpp
    Icons.cpp
    LookupContext.cpp
    LookupItem.cpp
    Macro.cpp
    MatchingText.cpp
    NamePrettyPrinter.cpp
    Overview.cpp
    OverviewModel.cpp
    pp-engine.cpp
    pp-scanner.cpp
    PPToken.cpp
    PreprocessorClient.cpp
    PreprocessorEnvironment.cpp
    ResolveExpression.cpp
    SimpleLexer.cpp
    SnapshotSymbolVisitor.cpp
    SymbolNameVisitor.cpp
    TypeOfExpression.cpp
    TypePrettyPrinter.cpp
)

set(mocheaders
    OverviewModel.h
)

set(qrcfiles
    cplusplus.qrc
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocheaders})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_DIR}/qtcreator_gui_pch.h)
qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
)

if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4267")
endif()

qt_use_modules(${target} Widgets)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_trace_moc_files()
