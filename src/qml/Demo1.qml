import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: '#f5f5f5'

        Column {
            anchors.fill: parent
            spacing: 0

            // 顶部标签栏
            TabBar {
                id: tabBar
                width: parent.width
                height: 60

                TabButton {
                    text: "基础交互"
                    width: implicitWidth
                }
                TabButton {
                    text: "Qt 全局对象"
                    width: implicitWidth
                }
                TabButton {
                    text: "Connections 信号"
                    width: implicitWidth
                }
            }

            // 内容区域
            StackLayout {
                width: parent.width
                height: parent.height - tabBar.height
                currentIndex: tabBar.currentIndex

                // Tab 1: 基础交互
                Item {
                    Row {
                        anchors.centerIn: parent
                        spacing: 20

                        Rectangle {
                            id: page1
                            width: 200
                            height: 200
                            color: 'red'
                            border.color: "cyan"
                            border.width: 2
                            radius: 100

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("打印了数据")
                                    parent.color = "black"
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                text: "我是qml-demo"
                                color: "white"
                                font.pointSize: 16
                            }
                        }

                        Rectangle {
                            id: page2
                            width: 200
                            height: 200
                            color: 'red'
                            border.color: "cyan"
                            border.width: 2
                            radius: 100

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("打印了数据")
                                    parent.color = "purple"
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                width: parent.width - 40
                                text: "长文本示例：2026-04-18 error messaging the mach port"
                                color: "white"
                                font.pointSize: 16
                                wrapMode: Text.Wrap
                                elide: Text.ElideRight
                                maximumLineCount: 3
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }

                        Rectangle {
                            width: 250
                            height: 250
                            color: '#f0f0f0'
                            border.color: '#cccccc'
                            border.width: 2
                            radius: 10

                            Image {
                                anchors.centerIn: parent
                                width: 200
                                height: 200
                                source: "report.png"
                                fillMode: Image.PreserveAspectFit

                                onStatusChanged: {
                                    if (status === Image.Error) {
                                        console.error("Image load error:", source)
                                    } else if (status === Image.Ready) {
                                        console.log("Image loaded successfully:", source)
                                    }
                                }
                            }
                        }
                    }
                }

                // Tab 2: Qt 全局对象
                Item {
                    Row {
                        anchors.centerIn: parent
                        spacing: 20

                        Rectangle {
                            width: 200
                            height: 200
                            color: 'pink'
                            border.color: "cyan"
                            border.width: 2
                            radius: 100

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Qt.md5:", Qt.md5("hello, world"))
                                    console.log("Qt.rgba:", Qt.rgba(1, 0, 0, 1))
                                    parent.color = "black"
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                color: Qt.rgba(1, 0, 0, 1)
                                text: "MD5:\n" + Qt.md5("hello")
                                font.pointSize: 12
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }

                        Rectangle {
                            width: 200
                            height: 200
                            color: 'pink'
                            border.color: "cyan"
                            border.width: 2
                            radius: 100

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("当前平台:", Qt.platform.os)
                                    console.log("点击退出按钮会调用 Qt.quit()")
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                color: Qt.rgba(0, 0, 1, 1)
                                text: "平台:\n" + Qt.platform.os
                                font.pointSize: 12
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }

                        Rectangle {
                            width: 200
                            height: 200
                            color: '#ff6b6b'
                            border.color: "cyan"
                            border.width: 2
                            radius: 100

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("退出应用")
                                    Qt.quit()
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                color: "white"
                                text: "点击退出\nQt.quit()"
                                font.pointSize: 14
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }
                }

                // Tab 3: Connections 信号劫持
                Item {
                    property int clickCount: 0

                    Column {
                        anchors.centerIn: parent
                        spacing: 30

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "点击红色圆形，观察控制台输出"
                            font.pixelSize: 18
                            color: "#333333"
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "点击次数: " + parent.parent.clickCount
                            font.pixelSize: 16
                            color: "#666666"
                        }

                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 20

                            Rectangle {
                                width: 150
                                height: 150
                                color: 'red'
                                radius: 75

                                MouseArea {
                                    id: redRectId
                                    anchors.fill: parent

                                    onClicked: {
                                        parent.parent.parent.parent.clickCount++
                                        console.log("红色矩形被点击，次数:", parent.parent.parent.parent.clickCount)
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "点我"
                                    color: "white"
                                    font.pixelSize: 20
                                    font.bold: true
                                }
                            }

                            Rectangle {
                                width: 150
                                height: 150
                                color: 'green'
                                radius: 75

                                Connections {
                                    target: redRectId
                                    function onClicked() {
                                        console.log("→ 绿色矩形监听到了红色的点击")
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "监听红色"
                                    color: "white"
                                    font.pixelSize: 14
                                }
                            }

                            Rectangle {
                                width: 150
                                height: 150
                                color: 'blue'
                                radius: 75

                                Connections {
                                    target: redRectId
                                    function onClicked() {
                                        console.log("→ 蓝色矩形也监听到了红色的点击")
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "监听红色"
                                    color: "white"
                                    font.pixelSize: 14
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
