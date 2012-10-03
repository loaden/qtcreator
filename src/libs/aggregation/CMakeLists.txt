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

qtc_set_pch(${target} ../../shared/qtcreator_pch.h)
qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
)

qt_use_modules(${target} LINK_PRIVATE Core)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_detect_moc_files("" h cpp)
