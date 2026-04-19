import QtQuick
import QtQuick.Controls

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: '#f5f5f5'

        ScrollView {
            id: scrollView
            anchors.fill: parent
            anchors.margins: 10
            clip: true

            Column {
                width: scrollView.width - 20
                spacing: 30

                // 示例1: 鼠标点击事件
                Rectangle {
                    width: parent.width
                    height: 200
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例1: 鼠标点击事件"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Row {
                        anchors.centerIn: parent
                        spacing: 20

                        Rectangle {
                            id: clickBox
                            width: 150
                            height: 100
                            color: '#4ecdc4'
                            radius: 8

                            property int clickCount: 0

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    clickBox.clickCount++
                                    console.log("点击次数:", clickBox.clickCount)
                                }
                            }

                            Column {
                                anchors.centerIn: parent
                                spacing: 5

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "点击我"
                                    color: "white"
                                    font.pixelSize: 16
                                    font.bold: true
                                }

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "点击次数: " + clickBox.clickCount
                                    color: "white"
                                    font.pixelSize: 14
                                }
                            }
                        }

                        Rectangle {
                            id: doubleClickBox
                            width: 150
                            height: 100
                            color: '#ff6b6b'
                            radius: 8

                            property int doubleClickCount: 0

                            MouseArea {
                                anchors.fill: parent
                                onDoubleClicked: {
                                    doubleClickBox.doubleClickCount++
                                    console.log("双击次数:", doubleClickBox.doubleClickCount)
                                }
                            }

                            Column {
                                anchors.centerIn: parent
                                spacing: 5

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "双击我"
                                    color: "white"
                                    font.pixelSize: 16
                                    font.bold: true
                                }

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "双击次数: " + doubleClickBox.doubleClickCount
                                    color: "white"
                                    font.pixelSize: 14
                                }
                            }
                        }
                    }
                }

                // 示例2: 鼠标悬停和按下
                Rectangle {
                    width: parent.width
                    height: 200
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例2: 鼠标悬停和按下"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Row {
                        anchors.centerIn: parent
                        spacing: 20

                        Rectangle {
                            id: hoverBox
                            width: 150
                            height: 100
                            color: hoverArea.containsMouse ? '#a29bfe' : '#6c5ce7'
                            radius: 8

                            Behavior on color {
                                ColorAnimation { duration: 200 }
                            }

                            MouseArea {
                                id: hoverArea
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: console.log("鼠标进入")
                                onExited: console.log("鼠标离开")
                            }

                            Text {
                                anchors.centerIn: parent
                                text: hoverArea.containsMouse ? "鼠标在上面" : "悬停试试"
                                color: "white"
                                font.pixelSize: 16
                                font.bold: true
                            }
                        }

                        Rectangle {
                            id: pressBox
                            width: 150
                            height: 100
                            color: pressArea.pressed ? '#e17055' : '#fdcb6e'
                            radius: 8
                            scale: pressArea.pressed ? 0.95 : 1.0

                            Behavior on color {
                                ColorAnimation { duration: 100 }
                            }

                            Behavior on scale {
                                NumberAnimation { duration: 100 }
                            }

                            MouseArea {
                                id: pressArea
                                anchors.fill: parent

                                onPressed: console.log("鼠标按下")
                                onReleased: console.log("鼠标释放")
                            }

                            Text {
                                anchors.centerIn: parent
                                text: pressArea.pressed ? "按下中..." : "按住我"
                                color: "white"
                                font.pixelSize: 16
                                font.bold: true
                            }
                        }
                    }
                }

                // 示例3: 鼠标拖拽
                Rectangle {
                    width: parent.width
                    height: 300
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例3: 鼠标拖拽"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        id: dragBox
                        width: 100
                        height: 100
                        x: 100
                        y: 100
                        color: '#00b894'
                        radius: 8

                        MouseArea {
                            anchors.fill: parent
                            drag.target: dragBox
                            drag.axis: Drag.XAndYAxis
                            drag.minimumX: 0
                            drag.maximumX: parent.parent.width - dragBox.width
                            drag.minimumY: 40
                            drag.maximumY: parent.parent.height - dragBox.height

                            onPressed: {
                                dragBox.color = '#55efc4'
                                console.log("开始拖拽")
                            }

                            onReleased: {
                                dragBox.color = '#00b894'
                                console.log("拖拽结束，位置:", dragBox.x, dragBox.y)
                            }
                        }

                        Text {
                            anchors.centerIn: parent
                            text: "拖动我"
                            color: "white"
                            font.pixelSize: 14
                            font.bold: true
                        }
                    }

                    Text {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 10
                        text: "位置: X=" + Math.round(dragBox.x) + ", Y=" + Math.round(dragBox.y)
                        font.pixelSize: 12
                        color: "#666666"
                    }
                }

                // 示例4: 键盘事件
                Rectangle {
                    width: parent.width
                    height: 250
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例4: 键盘事件（点击框后按键盘）"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        id: keyBox
                        width: parent.width - 40
                        height: 180
                        anchors.centerIn: parent
                        color: keyBox.activeFocus ? '#dfe6e9' : '#ffffff'
                        radius: 8
                        border.color: keyBox.activeFocus ? '#0984e3' : '#cccccc'
                        border.width: 2

                        focus: true

                        property string lastKey: ""
                        property string pressedKeys: ""

                        Keys.onPressed: (event) => {
                            lastKey = event.text || event.key
                            pressedKeys += event.text
                            console.log("按键:", event.key, "文本:", event.text)
                        }

                        Keys.onReturnPressed: {
                            console.log("按下回车键")
                            pressedKeys = ""
                        }

                        Keys.onEscapePressed: {
                            console.log("按下ESC键")
                            pressedKeys = ""
                        }

                        Keys.onUpPressed: console.log("按下上箭头")
                        Keys.onDownPressed: console.log("按下下箭头")
                        Keys.onLeftPressed: console.log("按下左箭头")
                        Keys.onRightPressed: console.log("按下右箭头")

                        MouseArea {
                            anchors.fill: parent
                            onClicked: parent.forceActiveFocus()
                        }

                        Column {
                            anchors.centerIn: parent
                            spacing: 15

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: keyBox.activeFocus ? "⌨️ 键盘已激活" : "点击激活键盘"
                                font.pixelSize: 16
                                font.bold: true
                                color: keyBox.activeFocus ? '#0984e3' : '#999999'
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "最后按键: " + (keyBox.lastKey || "无")
                                font.pixelSize: 14
                                color: "#333333"
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: parent.parent.width - 40
                                text: "输入内容: " + (keyBox.pressedKeys || "无")
                                font.pixelSize: 14
                                color: "#333333"
                                wrapMode: Text.Wrap
                                horizontalAlignment: Text.AlignHCenter
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "按 Enter 清空 | 按 ESC 清空"
                                font.pixelSize: 11
                                color: "#999999"
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "试试方向键 ↑ ↓ ← →"
                                font.pixelSize: 11
                                color: "#999999"
                            }
                        }
                    }
                }

                // 示例5: 鼠标滚轮事件
                Rectangle {
                    width: parent.width
                    height: 250
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例5: 鼠标滚轮事件"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        width: parent.width - 40
                        height: 180
                        anchors.centerIn: parent
                        color: '#ffffff'
                        radius: 8
                        border.color: '#cccccc'
                        border.width: 2

                        property int wheelDelta: 0
                        property int scale: 100

                        MouseArea {
                            anchors.fill: parent

                            onWheel: (wheel) => {
                                parent.wheelDelta += wheel.angleDelta.y
                                parent.scale = Math.max(50, Math.min(200, parent.scale + wheel.angleDelta.y / 12))
                                console.log("滚轮:", wheel.angleDelta.y, "缩放:", parent.scale)
                            }
                        }

                        Column {
                            anchors.centerIn: parent
                            spacing: 15

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "🖱️"
                                font.pixelSize: parent.parent.scale / 2
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "在这里滚动鼠标滚轮"
                                font.pixelSize: 16
                                font.bold: true
                                color: "#333333"
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "缩放: " + parent.parent.scale + "%"
                                font.pixelSize: 14
                                color: "#666666"
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "滚轮累计: " + parent.parent.wheelDelta
                                font.pixelSize: 12
                                color: "#999999"
                            }
                        }
                    }
                }

                // 示例6: 组合事件
                Rectangle {
                    width: parent.width
                    height: 250
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例6: 组合事件（点击+拖拽+悬停）"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        id: comboBox
                        width: 120
                        height: 120
                        x: 150
                        y: 80
                        color: comboArea.containsMouse ? '#fd79a8' : '#e84393'
                        radius: 60
                        scale: comboArea.pressed ? 0.9 : 1.0

                        property int clickCount: 0

                        Behavior on color {
                            ColorAnimation { duration: 200 }
                        }

                        Behavior on scale {
                            NumberAnimation { duration: 100 }
                        }

                        MouseArea {
                            id: comboArea
                            anchors.fill: parent
                            hoverEnabled: true
                            drag.target: comboBox
                            drag.axis: Drag.XAndYAxis
                            drag.minimumX: 0
                            drag.maximumX: parent.parent.width - comboBox.width
                            drag.minimumY: 40
                            drag.maximumY: parent.parent.height - comboBox.height

                            onClicked: {
                                comboBox.clickCount++
                                console.log("组合框点击:", comboBox.clickCount)
                            }

                            onEntered: console.log("鼠标进入组合框")
                            onExited: console.log("鼠标离开组合框")
                        }

                        Column {
                            anchors.centerIn: parent
                            spacing: 5

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "🎯"
                                font.pixelSize: 32
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "点击: " + comboBox.clickCount
                                color: "white"
                                font.pixelSize: 12
                            }
                        }
                    }

                    Text {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 10
                        text: "可以拖拽、点击、悬停"
                        font.pixelSize: 12
                        color: "#666666"
                    }
                }

                // 底部间距
                Item { height: 20 }
            }
        }
    }
}
