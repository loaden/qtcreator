TEMPLATE  = subdirs
CONFIG   += ordered
QT += core gui

# aggregation and extensionsystem are directly in src.pro
# because of dependencies of app
SUBDIRS   = \
    3rdparty \
    utils \
    utils/process_stub.pro \
    languageutils \
    cplusplus \
    qtcomponents/styleitem \
    ssh

win32:SUBDIRS += utils/process_ctrlc_stub.pro

