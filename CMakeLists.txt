cmake_minimum_required(VERSION 3.16)

project(demo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appdemo
    main.cpp
)

qt_add_qml_module(appdemo
    URI demo
    QML_FILES
        Main.qml
        src/qml/DemoConfig.qml
        src/qml/Demo1.qml
        src/qml/Demo2.qml
        src/qml/Demo3.qml
        src/qml/Demo4.qml
        src/qml/Demo5.qml
        src/qml/Demo6.qml
        src/qml/component/demo6/MyButton.qml
        src/qml/component/demo6/MyCheckBox.qml
        src/qml/component/demo6/MySliderAndProgressBar.qml
        src/qml/component/demo6/MySwitchAndSpinBox.qml
        src/qml/component/demo6/MyComboBox.qml
        src/qml/component/demo6/MyTextInput.qml
        src/qml/component/demo6/MyLabelAndToolTip.qml
        src/qml/component/demo6/MyBusyAndDial.qml
        src/qml/component/demo6/MyPopup.qml
        src/qml/component/demo6/MyDialog.qml
        src/qml/component/demo6/MyMenu.qml
        src/qml/component/demo6/MyCard.qml
        src/qml/component/demo6/MySliderAndProgressBar.qml
        src/qml/component/demo6/MySwitchAndSpinBox.qml

    SOURCES
        Backend.h
        Backend.cpp
        DataModel.cpp
        DataModel.h
    RESOURCES
        report.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appdemo PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appdemo
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appdemo
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appdemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
