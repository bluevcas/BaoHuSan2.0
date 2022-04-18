QT += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    baidufaceonline.cpp \
    main.cpp \
    mainwindow.cpp \
    screenwidget.cpp

HEADERS += \
    baidufaceonline.h \
    mainwindow.h \
    screenwidget.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#windows app 64bit openssl
#LIBS += -L'C:/Program Files/OpenSSL-Win64/lib' -llibcrypto
#LIBS += -L'C:/Program Files/OpenSSL-Win64/lib' -llibssl
#INCLUDEPATH += 'C:/Program Files/OpenSSL-Win64/include'
#DEPENDPATH += 'C:/Program Files/OpenSSL-Win64/include'

RESOURCES += \
    files.qrc\
    qdarkstyle/style.qrc
