import QtQuick
import QtQuick.Controls

// 6. 字符长度限制
Column {
    width: parent.width
    spacing: 10

    Text {
        text: "6. 字符长度限制 (最多10个字符)"
        font.pixelSize: 20
        font.bold: true
    }

    TextField {
        id: limitedField
        width: parent.width
        height: 50
        placeholderText: "最多输入10个字符"
        maximumLength: 10
        font.pixelSize: 16

        background: Rectangle {
            color: '#ffffff'
            radius: 10
            border.color: limitedField.activeFocus ? "#0078d4" : "#cccccc"
            border.width: 2
        }

        Text {
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            text: limitedField.length + "/10"
            color: limitedField.length >= 10 ? "red" : "#666666"
            font.pixelSize: 14
        }
    }
}
