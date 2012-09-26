include(QtcLibrary)

set(target QtcSsh)

add_definitions(-DQSSH_LIBRARY)
if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4267")
endif()

set(sources
    sftpchannel.cpp
    sftpdefs.cpp
    sftpfilesystemmodel.cpp
    sftpincomingpacket.cpp
    sftpoperation.cpp
    sftpoutgoingpacket.cpp
    sftppacket.cpp
    sshcapabilities.cpp
    sshchannel.cpp
    sshchannelmanager.cpp
    sshconnection.cpp
    sshconnectionmanager.cpp
    sshcryptofacility.cpp
    sshincomingpacket.cpp
    sshkeycreationdialog.cpp
    sshkeyexchange.cpp
    sshkeygenerator.cpp
    sshkeypasswordretriever.cpp
    sshoutgoingpacket.cpp
    sshpacket.cpp
    sshpacketparser.cpp
    sshremoteprocess.cpp
    sshremoteprocessrunner.cpp
    sshsendfacility.cpp
)

set(mocsources
    sshconnectionmanager.cpp
)

set(mocheaders
    sftpchannel.h
    sftpchannel_p.h
    sftpfilesystemmodel.h
    sshchannel_p.h
    sshchannelmanager_p.h
    sshconnection.h
    sshconnection_p.h
    sshkeycreationdialog.h
    sshremoteprocess.h
    sshremoteprocess_p.h
    sshremoteprocessrunner.h
)

set(uifiles
    sshkeycreationdialog.ui
)

qt_generate_moc(qtsrcs ${mocsources})
qt_wrap_cpp(qtsrcs ${mocheaders})
qt_wrap_ui(qthdrs ${uifiles})

qtc_set_pch(${target} CXX ../../shared/qtcreator_gui_pch.h precompiled)
qtc_add_library(${target} SHARED
    ${sources}
    ${qtsrcs}
    ${qthdrs}
    ${precompiled}
)

include_directories(${QTC_LIBS_SOURCE_PATH}/3rdparty ${CMAKE_CURRENT_BINARY_DIR})
target_link_libraries(${target} Botan)
qt_use_modules(${target} Widgets Network)
qtc_use_pch(${target} ${sources} ${qtsrcs})

#qt_trace_moc_files(h cpp)
