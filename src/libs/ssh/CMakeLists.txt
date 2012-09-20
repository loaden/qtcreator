include(QtcLibrary)

find_package(Qt5Widgets)

set(target QtcSsh)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

add_definitions(-DQSSH_LIBRARY)
if (MSVC)
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

set(uifiles
    sshkeycreationdialog.ui
)

qt5_wrap_ui(uisrcs ${uifiles})

add_qtc_library(${target} SHARED
    ${sources}
    ${uisrcs}
)

qt5_use_modules(${target} Widgets Network)

include_directories(${QTC_LIBS_SOURCE_PATH}/3rdparty)
target_link_libraries(${target} Botan)

if (QTC_PCH_SUPPORT)
    use_precompiled_header(${target} ${QTC_GUI_PCH_TARGET} "${sources}")
endif()
