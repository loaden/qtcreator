include(QtcLibrary)

qt_find_modules(Core)

set(target Aggregation)

set(sources
    aggregate.cpp
)

add_definitions(-DAGGREGATION_LIBRARY)

qtc_add_library(${target} SHARED
    ${sources}
)

qt_use_modules(${target} Core)

