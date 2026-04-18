import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property string name: "Demo 6 示例"

    Rectangle {
        id: main
        anchors.fill: parent
        color: '#f5f5f5'

        ScrollView {
            id: scrollView
            anchors.fill: parent
            anchors.margins: 20
            clip: true

            ColumnLayout {
                width: scrollView.width - 40
                spacing: 30

                // 1. 基础搜索框
                Column {
                    Layout.fillWidth: true
                    spacing: 10

                    Text {
                        text: "1. 基础搜索框"
                        font.pixelSize: 20
                        font.bold: true
                    }

                    TextField {
                        id: searchField
                        width: parent.width
                        height: 50
                        placeholderText: "搜索歌曲、歌手、专辑"
                        placeholderTextColor: "#999999"
                        font.pixelSize: 16

                        background: Rectangle {
                            color: '#ffffff'
                            radius: 10
                            border.color: searchField.activeFocus ? "#0078d4" : "#cccccc"
                            border.width: 2
                        }

                        onTextChanged: console.log("搜索:", text)
                    }
                }

                // 2. 密码输入框
                Column {
                    Layout.fillWidth: true
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

                // 3. 数字输入框
                Column {
                    Layout.fillWidth: true
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
                        validator: IntValidator { bottom: 0; top: 9999 }
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

                // 4. 邮箱输入框
                Column {
                    Layout.fillWidth: true
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

                // 5. 只读输入框
                Column {
                    Layout.fillWidth: true
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

                // 6. 字符长度限制
                Column {
                    Layout.fillWidth: true
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

                // 7. 多行文本框
                Column {
                    Layout.fillWidth: true
                    spacing: 10

                    Text {
                        text: "7. 多行文本框 (TextArea)"
                        font.pixelSize: 20
                        font.bold: true
                    }

                    TextArea {
                        id: textArea
                        width: parent.width
                        height: 120
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

                // 8. 带清除按钮的输入框
                Column {
                    Layout.fillWidth: true
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
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            width: 30
                            height: 30
                            visible: clearableField.text.length > 0
                            text: "×"
                            font.pixelSize: 20

                            background: Rectangle {
                                color: parent.hovered ? "#e0e0e0" : "transparent"
                                radius: 15
                            }

                            onClicked: clearableField.text = ""
                        }
                    }
                }

                // 底部间距
                Item { height: 20 }
            }
        }
    }
}
