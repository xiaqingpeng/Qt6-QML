import QtQuick
import QtQuick.Controls

// 示例7: Label 和 ToolTip
Rectangle {
    width: parent.width
    height: 220
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例7: Label 和 ToolTip"
            font.pixelSize: 18
            font.bold: true
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Label {
                text: "这是一个 Label 标签"
                font.pixelSize: 14
            }

            Label {
                text: "粗体 Label"
                font.pixelSize: 14
                font.bold: true
            }

            Label {
                text: "彩色 Label"
                font.pixelSize: 14
                color: "#e74c3c"
            }

            Button {
                text: "悬停显示提示"
                ToolTip.visible: hovered
                ToolTip.text: "这是一个工具提示\n可以显示多行文本"
                ToolTip.delay: 500
            }
        }
    }
}
