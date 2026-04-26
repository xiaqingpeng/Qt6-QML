pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import demo

Window {
    id: mainWindow
    width: 960
    height: 720
    visible: true
    title: "QML Examples 导航"

    signal sig

    onSig: {
        console.log("signal is triggered");
    }

    function testArg(arg) {
        console.log("arg is ", arg);
        return "testArg"
    }

    // Examples 配置
    ExamplesConfig {
        id: examplesConfig
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: menuPage
    }

    // 红色矩形 - 放在最上层以便显示
    Rectangle {
        objectName: "examplesConfig"
        width: 50
        height: 50
        radius:25
        color: 'red'
        anchors.verticalCenter: parent.verticalCenter
        z: 1  // 确保显示在 StackView 上层
    }

    // 主菜单页面
    Component {
        id: menuPage

        Page {
            id: menuPageItem

            title: "选择示例"

            ScrollView {
                anchors.fill: parent
                clip: true
                contentWidth: availableWidth

                Column {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 50
                    spacing: 20
                    width: 300

                    Text {
                        text: "QML 示例集合"
                        font.pixelSize: 24
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    // 动态生成按钮
                    Repeater {
                        model: examplesConfig.demos

                        delegate: Button {
                            required property var modelData
                            required property int index

                            text: modelData.title
                            width: 300
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: {
                                menuPageItem.StackView.view.push(examplePageComponent, {
                                                                     "exampleTitle": modelData.title,
                                                                     "exampleComponent": modelData.component
                                                                 });
                            }
                        }
                    }
                }
            }
        }
    }

    // 通用示例页面组件
    Component {
        id: examplePageComponent

        Page {
            id: examplePage
            required property string exampleTitle
            required property string exampleComponent

            title: exampleTitle

            header: ToolBar {
                Button {
                    text: "← 返回"
                    onClicked: {
                        examplePage.StackView.view.pop();
                    }
                }
            }

            Loader {
                anchors.fill: parent
                source: "qrc:/qt/qml/demo/src/qml/" + examplePage.exampleComponent + ".qml"
                onStatusChanged: {
                    if (status === Loader.Error) {
                        console.error("Failed to load:", examplePage.exampleComponent);
                    }
                }
            }
        }
    }
}
