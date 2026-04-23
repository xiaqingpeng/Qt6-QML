import QtQuick
import QtQuick.Controls

// 4. 邮箱输入框
Column {
    width: parent.width
    spacing: 10

    Text {
        text: "4. 邮箱输入框"
        font.pixelSize: 20
        font.bold: true
    }

    TextField {
        id: emailField
        width: parent.width
        height: 50
        placeholderText: "example@email.com"
        inputMethodHints: Qt.ImhEmailCharactersOnly
        font.pixelSize: 16

        background: Rectangle {
            color: '#ffffff'
            radius: 10
            border.color: emailField.activeFocus ? "#0078d4" : "#cccccc"
            border.width: 2
        }

        Text {
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            text: emailField.acceptableInput ? "✓" : ""
            color: "green"
            font.pixelSize: 20
        }
    }
}
