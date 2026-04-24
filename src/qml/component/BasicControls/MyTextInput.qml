import QtQuick
import QtQuick.Controls

// 示例6: TextField 和 TextArea
Rectangle {
    width: parent.width
    height: 350
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        Text {
            text: "示例6: TextField 和 TextArea"
            font.pixelSize: 18
            font.bold: true
        }

        Column {
            width: parent.width
            spacing: 15

            TextField {
                width: parent.width
                placeholderText: "普通输入框"
                onTextChanged: console.log("输入:", text)
            }

            TextField {
                width: parent.width
                placeholderText: "密码输入框"
                echoMode: TextInput.Password
            }

            TextField {
                width: parent.width
                placeholderText: "只读输入框"
                text: "不可编辑"
                readOnly: true
            }

            TextArea {
                width: parent.width
                height: 100
                placeholderText: "多行文本输入框..."
                wrapMode: TextArea.Wrap
            }
        }
    }
}
