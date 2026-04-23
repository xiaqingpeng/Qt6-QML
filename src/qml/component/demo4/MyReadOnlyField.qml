import QtQuick
import QtQuick.Controls

// 5. 只读输入框
Column {
    width: parent.width
    spacing: 10

    Text {
        text: "5. 只读输入框"
        font.pixelSize: 20
        font.bold: true
    }

    TextField {
        width: parent.width
        height: 50
        text: "这是只读文本，不可编辑"
        readOnly: true
        font.pixelSize: 16

        background: Rectangle {
            color: '#e0e0e0'
            radius: 10
        }
    }
}
