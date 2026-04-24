import QtQuick
import QtQuick.Controls

// 2. 密码输入框
Column {
    width: parent.width
    spacing: 10

    Text {
        text: "2. 密码输入框"
        font.pixelSize: 20
        font.bold: true
    }

    TextField {
        id: passwordField
        width: parent.width
        height: 50
        placeholderText: "请输入密码"
        echoMode: TextInput.Password
        font.pixelSize: 16

        background: Rectangle {
            color: '#ffffff'
            radius: 10
            border.color: passwordField.activeFocus ? "#0078d4" : "#cccccc"
            border.width: 2
        }
    }
}
