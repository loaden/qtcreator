include(QtcLibrary)

qt_find_modules(Widgets)

set(target QmlJS)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

add_definitions(-DQMLJS_BUILD_DIR -DQT_CREATOR)

set(sources
    jsoncheck.cpp
    parser/qmldirparser.cpp
    parser/qmlerror.cpp
    parser/qmljsast.cpp
    parser/qmljsastvisitor.cpp
    parser/qmljsengine_p.cpp
    parser/qmljsgrammar.cpp
    parser/qmljslexer.cpp
    parser/qmljsparser.cpp
    qmljsbind.cpp
    qmljscheck.cpp
    qmljscodeformatter.cpp
    qmljscompletioncontextfinder.cpp
    qmljscontext.cpp
    qmljsdelta.cpp
    qmljsdocument.cpp
    qmljsevaluate.cpp
    qmljsicons.cpp
    qmljsindenter.cpp
    qmljsinterpreter.cpp
    qmljslineinfo.cpp
    qmljslink.cpp
    qmljsmodelmanagerinterface.cpp
    qmljspropertyreader.cpp
    qmljsreformatter.cpp
    qmljsrewriter.cpp
    qmljsscanner.cpp
    qmljsscopeastpath.cpp
    qmljsscopebuilder.cpp
    qmljsscopechain.cpp
    qmljsstaticanalysismessage.cpp
    qmljstypedescriptionreader.cpp
    qmljsutils.cpp
    qmljsvalueowner.cpp
)

set(qrcfiles
    qmljs.qrc
)

qt_add_resources(qrcsrcs ${qrcfiles})

qtc_add_library(${target} SHARED
    ${sources}
    ${qrcsrcs}
)

qt_use_modules(${target} Widgets)

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${QTC_GUI_PCH_TARGET} "${sources}")
endif()
