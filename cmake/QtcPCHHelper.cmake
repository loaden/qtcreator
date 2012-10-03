include(PrecompiledHeader)

macro(qtc_set_pch target precompiledHeader)
    if(QTC_PCH_SUPPORT)
        set_precompiled_header(${target} CXX ${precompiledHeader} pchSrcVar)
    endif()
endmacro()

macro(qtc_use_pch target)
    if(QTC_PCH_SUPPORT)
        use_precompiled_header(${target} ${ARGN})
    endif()
endmacro()

macro(qtc_add_pch_compile_flags target)
    if(QTC_PCH_SUPPORT)
        add_pch_compile_flags(${target} ${ARGN})
    endif()
endmacro()
