import QtQuick
import QtQuick.Controls
import demo

Window {
    id: mainWindow
    width: 1280
    height: 1280
    visible: true
    title: "QML Demo 导航"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: menuPage
    }

    // 主菜单页面
    Component {
        id: menuPage

        Page {
            title: "选择 Demo"

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    text: "QML Demo 示例集合"
                    font.pixelSize: 24
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Button {
                    text: "Demo 1 - 基础交互"
                    width: 250
                    onClicked: stackView.push(demo1Page)
                }

                Button {
                    text: "Demo 2 - Qt 全局对象"
                    width: 250
                    onClicked: stackView.push(demo2Page)
                }

                Button {
                    text: "Demo 3 - Connections 信号劫持"
                    width: 250
                    onClicked: stackView.push(demo3Page)
                }

                Button {
                    text: "Demo 4 - Backend & DataModel"
                    width: 250
                    onClicked: stackView.push(demo4Page)
                }

                Button {
                    text: "Demo 5 - 布局示例"
                    width: 250
                    onClicked: stackView.push(demo5Page)
                }

                Button {
                    text: "Demo 6 - 输入框示例"
                    width: 250
                    onClicked: stackView.push(demo6Page)
                }
            }
        }
    }

    // Demo 1 - 基础交互
    Component {
        id: demo1Page
        
        Page {
            title: "Demo 1 - 基础交互"
            
            header: ToolBar {
                Button {
                    text: "← 返回"
                    onClicked: stackView.pop()
                }
            }

            Demo1 {
                anchors.fill: parent
            }
        }
    }

    // Demo 2 - Qt 全局对象
    Component {
        id: demo2Page
        
        Page {
            title: "Demo 2 - Qt 全局对象"
            
            header: ToolBar {
                Button {
                    text: "← 返回"
                    onClicked: stackView.pop()
                }
            }

            Demo2 {
                anchors.fill: parent
            }
        }
    }

    // Demo 3 - Connections 信号劫持
    Component {
        id: demo3Page
        
        Page {
            title: "Demo 3 - Connections 信号劫持"
            
            header: ToolBar {
                Button {
                    text: "← 返回"
                    onClicked: stackView.pop()
                }
            }

            Demo3 {
                anchors.fill: parent
            }
        }
    }

    // Demo 4 - Backend & DataModel
    Component {
        id: demo4Page
        
        Page {
            title: "Demo 4 - Backend & DataModel"
            
            header: ToolBar {
                Button {
                    text: "← 返回"
                    onClicked: stackView.pop()
                }
            }

            Demo4 {
                anchors.fill: parent
            }
        }
    }

    // Demo 5 - 扩展示例
    Component {
        id: demo5Page
        
        Page {
            title: "Demo 5 - 布局示例"
            
            header: ToolBar {
                Button {
                    text: "← 返回"
                    onClicked: stackView.pop()
                }
            }

            Demo5 {
                anchors.fill: parent
            }
        }
    }


    // Demo 6 - 扩展示例
    Component {
        id: demo6Page

        Page {
            title: "Demo 6 - 输入框示例"

            header: ToolBar {
                Button {
                    text: "← 返回"
                    onClicked: stackView.pop()
                }
            }

            Demo6 {
                anchors.fill: parent
            }
        }
    }
}
