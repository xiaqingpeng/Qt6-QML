import QtQuick
import QtQuick.Controls

// 3. 数字输入框
Column {
    width: parent.width
    spacing: 10

    Text {
        text: "3. 数字输入框 (只能输入数字)"
        font.pixelSize: 20
        font.bold: true
    }

    TextField {
        id: numberField
        width: parent.width
        height: 50
        placeholderText: "请输入数字"
        validator: IntValidator {
            bottom: 0
            top: 9999
        }
        inputMethodHints: Qt.ImhDigitsOnly
        font.pixelSize: 16

        background: Rectangle {
            color: '#ffffff'
            radius: 10
            border.color: numberField.activeFocus ? "#0078d4" : "#cccccc"
            border.width: 2
        }
    }
}
