include(QtcLibrary)

add_definitions(-DAGGREGATION_LIBRARY)

set(target Aggregation)

set(sources
    aggregate.cpp
)

set(mocheaders
    aggregate.h
)

qt_wrap_cpp(qtsrcs ${mocheaders})

qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
)

qt_use_modules(${target} Core)

#qt_trace_moc_files(h cpp)
