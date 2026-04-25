cmake_minimum_required(VERSION 3.16)

project(demo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 Multimedia)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appdemo
    main.cpp
)

qt_add_qml_module(appdemo
    URI demo
    QML_FILES
        Main.qml
        src/qml/ExamplesConfig.qml
        src/qml/InteractionBasics.qml
        src/qml/BackendIntegration.qml
        src/qml/AnchorLayouts.qml
        src/qml/InputFields.qml
        src/qml/MouseKeyboardEvents.qml
        src/qml/BasicControls.qml
        src/qml/StateTransitions.qml
        src/qml/AudioPlayer.qml
        src/qml/component/AnchorLayouts/MyThreeColumnLayout.qml
        src/qml/component/AnchorLayouts/MyCenterLayout.qml
        src/qml/component/AnchorLayouts/MyFillLayout.qml
        src/qml/component/AnchorLayouts/MyRelativeLayout.qml
        src/qml/component/AnchorLayouts/MyToolbarLayout.qml
        src/qml/component/AnchorLayouts/MySidebarLayout.qml
        src/qml/component/AnchorLayouts/MyBottomButtonLayout.qml
        src/qml/component/AnchorLayouts/MyMusicLayout.qml
        src/qml/component/InputFields/MySearchField.qml
        src/qml/component/InputFields/MyPasswordField.qml
        src/qml/component/InputFields/MyNumberField.qml
        src/qml/component/InputFields/MyEmailField.qml
        src/qml/component/InputFields/MyReadOnlyField.qml
        src/qml/component/InputFields/MyLimitedField.qml
        src/qml/component/InputFields/MyTextAreaField.qml
        src/qml/component/InputFields/MyClearableField.qml
        src/qml/component/MouseKeyboardEvents/MyClickEvent.qml
        src/qml/component/MouseKeyboardEvents/MyHoverAndPress.qml
        src/qml/component/MouseKeyboardEvents/MyDragEvent.qml
        src/qml/component/MouseKeyboardEvents/MyKeyboardEvent.qml
        src/qml/component/MouseKeyboardEvents/MyWheelEvent.qml
        src/qml/component/MouseKeyboardEvents/MyComboEvent.qml
        src/qml/component/BasicControls/MyButton.qml
        src/qml/component/BasicControls/MyCheckBox.qml
        src/qml/component/BasicControls/MySliderAndProgressBar.qml
        src/qml/component/BasicControls/MySwitchAndSpinBox.qml
        src/qml/component/BasicControls/MyComboBox.qml
        src/qml/component/BasicControls/MyTextInput.qml
        src/qml/component/BasicControls/MyLabelAndToolTip.qml
        src/qml/component/BasicControls/MyBusyAndDial.qml
        src/qml/component/BasicControls/MyPopup.qml
        src/qml/component/BasicControls/MyDialog.qml
        src/qml/component/BasicControls/MyMenu.qml
        src/qml/component/BasicControls/MyCard.qml
        src/qml/component/StateTransitions/MyBasicState.qml
        src/qml/component/StateTransitions/MyColorPositionTransition.qml
        src/qml/component/StateTransitions/MyRotationScale.qml
        src/qml/component/StateTransitions/MyMultiState.qml
        src/qml/component/StateTransitions/MyTrafficLight.qml
        src/qml/component/StateTransitions/MyCardFlip.qml

    SOURCES
        Backend.h
        Backend.cpp
        DataModel.cpp
        DataModel.h
        QmlBridge.h
        QmlBridge.cpp
    RESOURCES
        report.png
        audio/sample1.mp3
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
    PRIVATE Qt6::Quick Qt6::QuickControls2 Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appdemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
