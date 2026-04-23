import QtQuick
import QtQuick.Controls

// 1. 基础搜索框
Column {
    width: parent.width
    spacing: 10

    Text {
        text: "1. 基础搜索框"
        font.pixelSize: 20
        font.bold: true
    }

    TextField {
        id: searchField
        width: parent.width
        height: 80
        placeholderText: "搜索歌曲、歌手、专辑"
        placeholderTextColor: "#999999"
        font.pixelSize: 16

        verticalAlignment: TextInput.AlignVCenter
        leftPadding: 16

        background: Rectangle {
            color: '#ffffff'
            radius: 10
            border.color: searchField.activeFocus ? "#0078d4" : "#cccccc"
            border.width: 2
        }

        onTextChanged: console.log("onTextChanged:", text)
        onFocusChanged: console.log("onFocusChanged:", text)
        onAccepted: console.log("onAccepted:", text)
    }
}
