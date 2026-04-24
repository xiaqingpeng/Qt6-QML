import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

// 示例10: Dialog 对话框
Rectangle {
    width: parent.width
    height: 320
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例10: Dialog 对话框"
            font.pixelSize: 18
            font.bold: true
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15

                Button {
                    text: "确认对话框"
                    onClicked: confirmDialog.open()
                }

                Button {
                    text: "信息对话框"
                    onClicked: infoDialog.open()
                }

                Button {
                    text: "自定义对话框"
                    onClicked: customDialog.open()
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15

                Button {
                    text: "文件选择"
                    onClicked: fileDialog.open()
                }

                Button {
                    text: "多选文件"
                    onClicked: multiFileDialog.open()
                }

                Button {
                    text: "文件夹选择"
                    onClicked: folderDialog.open()
                }

                Button {
                    text: "颜色选择"
                    onClicked: colorDialog.open()
                }

                Rectangle {
                    width: 50
                    height: 40
                    color: colorDialog.selectedColor
                    border.color: "#cccccc"
                    border.width: 1
                    radius: 4
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15

                Button {
                    text: "字体选择"
                    onClicked: fontDialog.open()
                }

                Button {
                    text: "消息对话框"
                    onClicked: messageDialog.open()
                }

                Text {
                    width: 60
                    height: 40
                    text: "字体"
                    font: fontDialog.selectedFont
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    Dialog {
        id: confirmDialog
        anchors.centerIn: parent
        title: "确认操作"
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel

        Label {
            text: "确定要执行此操作吗？"
        }

        onAccepted: console.log("用户点击了确定")
        onRejected: console.log("用户点击了取消")
    }

    Dialog {
        id: infoDialog
        anchors.centerIn: parent
        title: "提示信息"
        modal: true
        standardButtons: Dialog.Close

        Column {
            spacing: 10

            Label {
                text: "这是一条重要信息"
                font.bold: true
            }

            Label {
                text: "Dialog 提供标准化的对话框样式"
                color: "#666666"
            }
        }
    }

    Dialog {
        id: customDialog
        anchors.centerIn: parent
        title: "用户登录"
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel

        Column {
            spacing: 15
            width: 250

            TextField {
                id: usernameField
                width: parent.width
                placeholderText: "用户名"
            }

            TextField {
                id: passwordField
                width: parent.width
                placeholderText: "密码"
                echoMode: TextInput.Password
            }
        }

        onAccepted: {
            console.log("登录:", usernameField.text)
            usernameField.text = ""
            passwordField.text = ""
        }
    }

    // 文件选择对话框（单选）
    FileDialog {
        id: fileDialog
        title: "请选择文件"
        fileMode: FileDialog.OpenFile
        nameFilters: ["图片文件 (*.png *.jpg *.jpeg)", "所有文件 (*)"]
        onAccepted: {
            console.log("选择的文件:", fileDialog.selectedFile)
        }
        onRejected: {
            console.log("取消选择文件")
        }
    }

    // 文件选择对话框（多选）
    FileDialog {
        id: multiFileDialog
        title: "请选择多个文件"
        fileMode: FileDialog.OpenFiles
        nameFilters: ["图片文件 (*.png *.jpg *.jpeg)", "文本文件 (*.txt)", "所有文件 (*)"]
        onAccepted: {
            console.log("选择的文件数量:", multiFileDialog.selectedFiles.length)
            for (var i = 0; i < multiFileDialog.selectedFiles.length; i++) {
                console.log("文件" + (i + 1) + ":", multiFileDialog.selectedFiles[i])
            }
        }
        onRejected: {
            console.log("取消选择文件")
        }
    }

    // 文件夹选择对话框
    FolderDialog {
        id: folderDialog
        title: "请选择文件夹"
        onAccepted: {
            console.log("选择的文件夹:", folderDialog.selectedFolder)
        }
        onRejected: {
            console.log("取消选择文件夹")
        }
    }

    // 颜色选择对话框
    ColorDialog {
        id: colorDialog
        title: "请选择颜色"
        onAccepted: {
            console.log("选择的颜色:", colorDialog.selectedColor)
        }
        onRejected: {
            console.log("取消选择颜色")
        }
    }

    // 字体选择对话框
    FontDialog {
        id: fontDialog
        title: "请选择字体"
        onAccepted: {
            console.log("选择的字体:", fontDialog.selectedFont.family, "大小:", fontDialog.selectedFont.pointSize)
        }
        onRejected: {
            console.log("取消选择字体")
        }
    }

    // 消息对话框
    MessageDialog {
        id: messageDialog
        title: "系统提示"
        text: "这是一个消息对话框"
        informativeText: "MessageDialog 用于显示简单的提示信息，支持多种按钮组合。"
        buttons: MessageDialog.Ok | MessageDialog.Cancel
        onAccepted: console.log("MessageDialog: 点击了确定")
        onRejected: console.log("MessageDialog: 点击了取消")
    }
}
