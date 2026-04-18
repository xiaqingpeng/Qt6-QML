pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import demo

Window {
    id: mainWindow
    width: 1280
    height: 1280
    visible: true
    title: "QML Demo 导航"

    // Demo 配置
    DemoConfig {
        id: demoConfig
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: menuPage
    }

    // 主菜单页面
    Component {
        id: menuPage

        Page {
            id: menuPageItem
            
            title: "选择 Demo"

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
                        text: "QML Demo 示例集合"
                        font.pixelSize: 24
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    // 动态生成按钮
                    Repeater {
                        model: demoConfig.demos

                        delegate: Button {
                            required property var modelData
                            required property int index
                            
                            text: modelData.title
                            width: 300
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: {
                                menuPageItem.StackView.view.push(demoPageComponent, {
                                    "demoTitle": modelData.title,
                                    "demoComponent": modelData.component
                                })
                            }
                        }
                    }
                }
            }
        }
    }

    // 通用 Demo 页面组件
    Component {
        id: demoPageComponent

        Page {
            id: demoPage
            required property string demoTitle
            required property string demoComponent

            title: demoTitle

            header: ToolBar {
                Button {
                    text: "← 返回"
                    onClicked: {
                        demoPage.StackView.view.pop()
                    }
                }
            }

            Loader {
                anchors.fill: parent
                source: "qrc:/qt/qml/demo/" + demoPage.demoComponent + ".qml"
                onStatusChanged: {
                    if (status === Loader.Error) {
                        console.error("Failed to load:", demoPage.demoComponent)
                    }
                }
            }
        }
    }
}
