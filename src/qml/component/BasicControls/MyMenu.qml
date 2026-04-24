import QtQuick
import QtQuick.Controls

// 示例11: Menu 弹出菜单
Rectangle {
    width: parent.width
    height: 180
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例11: Menu 弹出菜单"
            font.pixelSize: 18
            font.bold: true
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            Button {
                text: "右键菜单"
                onClicked: contextMenu.popup()
            }

            Button {
                text: "文件菜单"
                onClicked: fileMenu.popup()
            }

            Button {
                id: menuButton
                text: "编辑菜单"
                onClicked: editMenu.open()
            }
        }
    }

    Menu {
        id: contextMenu

        MenuItem {
            text: "复制"
            onTriggered: console.log("复制")
        }
        MenuItem {
            text: "粘贴"
            onTriggered: console.log("粘贴")
        }
        MenuSeparator {}
        MenuItem {
            text: "删除"
            onTriggered: console.log("删除")
        }
    }

    Menu {
        id: fileMenu

        MenuItem {
            text: "新建"
            onTriggered: console.log("新建文件")
        }
        MenuItem {
            text: "打开"
            onTriggered: console.log("打开文件")
        }
        MenuItem {
            text: "保存"
            onTriggered: console.log("保存文件")
        }
        MenuSeparator {}
        MenuItem {
            text: "退出"
            onTriggered: console.log("退出应用")
        }
    }

    Menu {
        id: editMenu
        x: menuButton.x
        y: menuButton.y + menuButton.height

        MenuItem {
            text: "撤销"
            enabled: false
        }
        MenuItem {
            text: "重做"
            enabled: false
        }
        MenuSeparator {}
        Menu {
            title: "更多选项"
            MenuItem {
                text: "选项 1"
                onTriggered: console.log("选项 1")
            }
            MenuItem {
                text: "选项 2"
                onTriggered: console.log("选项 2")
            }
        }
    }
}
