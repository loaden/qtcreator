include(QtcLibrary)

qt_find_modules(Widgets)

set(target CPlusPlus)

add_definitions(-DCPLUSPLUS_BUILD_LIB)
include_directories(. ${QTC_LIBS_SOURCE_PATH}/3rdparty/cplusplus)

set(sources
    ../3rdparty/cplusplus/AST.cpp
    ../3rdparty/cplusplus/ASTClone.cpp
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

set(qrcfiles
    cplusplus.qrc
)

qt_add_resources(qrcsrcs ${qrcfiles})

if(QTC_PCH_SUPPORT)
    set_precompiled_header(${target} CXX ../../shared/qtcreator_gui_pch.h precompiled)
endif()

qtc_add_library(${target} SHARED
    ${sources}
    ${qrcsrcs}
    ${precompiled}
)

qt_use_modules(${target} Widgets)

if(QTC_PCH_SUPPORT)
    use_precompiled_header(${target} "${sources}")
endif()

