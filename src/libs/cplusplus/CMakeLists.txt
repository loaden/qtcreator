include(QtcLibrary)

set(target CPlusPlus)

add_definitions(-DCPLUSPLUS_BUILD_LIB)
include_directories(. ../3rdparty/cplusplus)

set(sources
    ../3rdparty/cplusplus/ASTClone.cpp
    ../3rdparty/cplusplus/AST.cpp
    ../3rdparty/cplusplus/ASTMatch0.cpp
    ../3rdparty/cplusplus/ASTMatcher.cpp
    ../3rdparty/cplusplus/ASTPatternBuilder.cpp
    ../3rdparty/cplusplus/ASTVisit.cpp
    ../3rdparty/cplusplus/ASTVisitor.cpp
    ../3rdparty/cplusplus/Bind.cpp
    ../3rdparty/cplusplus/Control.cpp
    ../3rdparty/cplusplus/CoreTypes.cpp
    ../3rdparty/cplusplus/DiagnosticClient.cpp
    ../3rdparty/cplusplus/FullySpecifiedType.cpp
    ../3rdparty/cplusplus/Keywords.cpp
    ../3rdparty/cplusplus/Lexer.cpp
    ../3rdparty/cplusplus/Literals.cpp
    ../3rdparty/cplusplus/LiteralTable.cpp
    ../3rdparty/cplusplus/MemoryPool.cpp
    ../3rdparty/cplusplus/Name.cpp
    ../3rdparty/cplusplus/Names.cpp
    ../3rdparty/cplusplus/NameVisitor.cpp
    ../3rdparty/cplusplus/ObjectiveCAtKeywords.cpp
    ../3rdparty/cplusplus/ObjectiveCTypeQualifiers.cpp
    ../3rdparty/cplusplus/Parser.cpp
    ../3rdparty/cplusplus/QtContextKeywords.cpp
    ../3rdparty/cplusplus/Scope.cpp
    ../3rdparty/cplusplus/Symbol.cpp
    ../3rdparty/cplusplus/Symbols.cpp
    ../3rdparty/cplusplus/SymbolVisitor.cpp
    ../3rdparty/cplusplus/Templates.cpp
    ../3rdparty/cplusplus/Token.cpp
    ../3rdparty/cplusplus/TranslationUnit.cpp
    ../3rdparty/cplusplus/Type.cpp
    ../3rdparty/cplusplus/TypeMatcher.cpp
    ../3rdparty/cplusplus/TypeVisitor.cpp
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

qtc_set_pch(${target} ../../shared/qtcreator_gui_pch.h)
qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
)

if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4267")
endif()

qt_use_modules(${target} LINK_PRIVATE Widgets)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_detect_moc_files("" )
