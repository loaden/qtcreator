include(QtcLibrary)

set(target QmlJS)

add_definitions(-DQMLJS_BUILD_DIR -DQT_CREATOR)
include_directories(${QTC_LIBS_SOURCE_PATH})

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

set(mocheaders
    qmljsicontextpane.h
    qmljsmodelmanagerinterface.h
)

set(mocspecial
    qmljscodeformatter.h
)

qt_add_resources(qtsrcs ${qrcfiles})
qt_wrap_cpp(qtsrcs ${mocspecial})
qt_wrap_cpp(qtsrcs ${mocheaders})

qtc_set_pch(${target} ${QTC_SHARED_SOURCE_PATH}/qtcreator_gui_pch.h)
qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
)

target_link_libraries(${target} Utils LanguageUtils)
qt_use_modules(${target} Widgets)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_trace_moc_files(h cpp)
