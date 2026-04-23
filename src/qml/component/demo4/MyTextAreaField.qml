import QtQuick
import QtQuick.Controls

// 7. 多行文本框
Column {
    width: parent.width
    spacing: 10

    Text {
        text: "7. 多行文本框 (TextArea)"
        font.pixelSize: 20
        font.bold: true
    }

    TextArea {
        id: textArea
        width: parent.width
        implicitHeight: 120
        placeholderText: "请输入多行文本..."
        wrapMode: TextArea.Wrap
        font.pixelSize: 16

        background: Rectangle {
            color: '#ffffff'
            radius: 10
            border.color: textArea.activeFocus ? "#0078d4" : "#cccccc"
            border.width: 2
        }
    }
}
