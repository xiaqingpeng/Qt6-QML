import QtQuick
import QtQuick.Controls

// 8. 带清除按钮的输入框
Column {
    width: parent.width
    spacing: 10

    Text {
        text: "8. 带清除按钮的输入框"
        font.pixelSize: 20
        font.bold: true
    }

    TextField {
        id: clearableField
        width: parent.width
        height: 50
        placeholderText: "输入文本后显示清除按钮"
        font.pixelSize: 16

        background: Rectangle {
            color: '#ffffff'
            radius: 10
            border.color: clearableField.activeFocus ? "#0078d4" : "#cccccc"
            border.width: 2
        }

        Button {
            id: clearButton
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 30
            height: 30
            visible: clearableField.text.length > 0
            text: "×"
            font.pixelSize: 20

            background: Rectangle {
                color: clearButton.hovered ? "#e0e0e0" : "transparent"
                radius: 15
            }

            onClicked: clearableField.text = ""
        }
    }
}
