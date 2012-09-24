include(QtcLibrary)

qt_find_modules(Widgets)

set(target QmlJS)

add_definitions(-DQMLJS_BUILD_DIR -DQT_CREATOR)
include_directories(..)

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

if(QTC_PCH_SUPPORT)
    set_precompiled_header(${target} CXX ../../shared/qtcreator_gui_pch.h precompiled)
endif()

qtc_add_library(${target} SHARED
    ${sources}
    ${qrcsrcs}
    ${precompiled}
)

qt_use_modules(${target} Widgets)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set_target_properties(${target} PROPERTIES
    AUTOMOC ON
)

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} "${sources}")
endif()
