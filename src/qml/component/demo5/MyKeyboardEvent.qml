import QtQuick
import QtQuick.Controls

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
