include(QtcLibrary)

find_package(Qt5Widgets)

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

qt5_add_resources(qrcsrcs ${qrcfiles})

add_qtc_library(${target} SHARED
    ${sources}
    ${qrcsrcs}
)

qt5_use_modules(${target} Widgets)

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${QTC_GUI_PCH_TARGET} "${sources}")
endif()
